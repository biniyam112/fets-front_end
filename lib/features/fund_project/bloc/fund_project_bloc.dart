import 'package:fets_mobile/features/fund_project/bloc/fund_project_event.dart';
import 'package:fets_mobile/features/fund_project/bloc/fund_project_state.dart';
import 'package:fets_mobile/features/fund_project/data/repository/fund_project_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FundProjectBloc extends Bloc<FundProjectEvent, FundProjectState> {
  FundProjectBloc(
      {required FundProjectState initialState, required this.fundProjectRepo})
      : super(initialState) {
    on<FundProject>(_fundProject);
  }

  final FundProjectRepo fundProjectRepo;
  Future<void> _fundProject(
      FundProject event, Emitter<FundProjectState> emit) async {
    emit(FundingProject());
    try {
      await fundProjectRepo.fundProject(
        abiPath: 'assets/abis/PaymentInformations.json',
        functionName: 'addPaymentInfo',
        donation: event.donation,
      );
      emit(ProjectFunded());
    } catch (e) {
      emit(ProjectFundingFailed(errorMessage: e.toString()));
    }
  }
}
