import 'package:fets_mobile/features/payment/data/provider/payment_dp.dart';

class PaymentRepo {
  final PaymentDP paymentDP;

  PaymentRepo({required this.paymentDP});

  Future<Map<String, dynamic>?> makePayment(
      {required String amount, required String currency}) async {
    return await paymentDP.makePayment(amount: amount, currency: currency);
  }
}
