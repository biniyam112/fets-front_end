import 'package:equatable/equatable.dart';

class PaymentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaymentInitState extends PaymentState {}

class PaymentInProgress extends PaymentState {}

class PaymentCompleted extends PaymentState {
  final Map<String, dynamic>? response;
  PaymentCompleted({required this.response});
}

class PaymentFailed extends PaymentState {
  final String errorMessage;

  PaymentFailed({required this.errorMessage});
}
