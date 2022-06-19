import 'package:fets_mobile/features/payment/bloc/payment_event.dart';
import 'package:fets_mobile/features/payment/bloc/payment_state.dart';
import 'package:fets_mobile/features/payment/data/repository/payment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc({required PaymentState initialState, required this.paymentRepo})
      : super(initialState) {
    on<MakePayment>(_makePayment);
  }
  final PaymentRepo paymentRepo;

  Future<void> _makePayment(
      MakePayment event, Emitter<PaymentState> emit) async {
    emit(PaymentInProgress());
    try {
      var response = await paymentRepo.makePayment(
        amount: event.amount,
        currency: event.currency,
      );
      emit(PaymentCompleted(response: response));
    } catch (e) {
      emit(PaymentFailed(errorMessage: e.toString()));
    }
  }
}
