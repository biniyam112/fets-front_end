import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentController {
  late Map<String, dynamic>? paymentIntent;
  final http.Client client;

  PaymentController({required this.client});

  Future<Map<String, dynamic>?> makePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntent = await createPaymentIntent(amount, currency);
      print(paymentIntent);
      Stripe.instance.presentPaymentSheet();
      if (paymentIntent != null) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            applePay: true,
            googlePay: true,
            testEnv: true,
            merchantCountryCode: 'US',
            merchantDisplayName: 'Prospects',
            customerId: paymentIntent!['customer'],
            paymentIntentClientSecret: paymentIntent!['client_secret'],
            customerEphemeralKeySecret: paymentIntent!['ephemeralKey'],
          ),
        );
      }
      return paymentIntent;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  createPaymentIntent(String amount, String currency) async {
    String? stripePrivateKey = dotenv.get('stripe_secret_key');
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer $stripePrivateKey',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  String calculateAmount(String amount) {
    final a = (double.parse(amount)) * 100;
    print('amount is ${a.toInt().toString()}');
    return a.toInt().toString();
  }
}
