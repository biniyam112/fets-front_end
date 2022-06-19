import 'package:fets_mobile/helper/helper.dart';
import 'package:http/http.dart' as http;

class PaymentDP {
  final http.Client client;
  final PaymentController paymentController;

  PaymentDP({required this.paymentController, required this.client});

  Future<Map<String, dynamic>?> makePayment({
    required String amount,
    required String currency,
  }) async {
    return await paymentController.makePayment(
        amount: amount, currency: currency);
  }
}
