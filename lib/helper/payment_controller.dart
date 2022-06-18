import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentController {
  late Map<String, dynamic>? paymentIntent;
  final http.Client client;


  PaymentController({required this.client});

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntent = await createPaymentIntent(amount, currency);
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
        ));
        print(paymentIntent);
        displayPaymentSheet();
      }
    } catch (e, s) {
      print('error $e \n\n stack trace $s');
      throw Exception(e.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      return const SnackBar(
        content: Text(
        'Payment Successful',
        ),
          backgroundColor: Colors.green,
          margin:  EdgeInsets.all(10),
          duration:  Duration(seconds: 2),);
   
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  createPaymentIntent(String amount, String currency) async {
      String? stripePrivateKey = dotenv.get('stripe_secret_key');
      print('private key is $stripePrivateKey');
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
      print('response is ${response.body}');

      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}