import 'package:equatable/equatable.dart';

class PaymentEvent extends Equatable {
  @override
  List<Object?> get props => [props];
}

class MakePayment extends PaymentEvent {
  MakePayment({required this.amount, required this.currency});

  @override
  List<Object?> get props => [props];

  final String amount, currency;
}
