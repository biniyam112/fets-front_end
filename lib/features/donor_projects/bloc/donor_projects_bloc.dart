import 'package:fets_mobile/features/donor_projects/bloc/donor_projects_event.dart';
import 'package:fets_mobile/features/donor_projects/bloc/donor_projects_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../data/repository/donor_projets_repo.dart';

class DonorProjectBloc extends Bloc<DonorProjectEvent, DonorProjectState> {
  DonorProjectBloc(
      {required this.donorProjectsRepo,
      required DonorProjectState initialState})
      : super(initialState) {
    on<FetchUserDonations>(_fetchUserDonations);
  }

  final DonorProjectsRepo donorProjectsRepo;

  Future<void> _fetchUserDonations(
      FetchUserDonations event, Emitter<DonorProjectState> emit) async {
    emit(UserDonationFetching());
    try {
      List<Donation> donations = await donorProjectsRepo.fetchUserDonations(
        userName: event.userName,
        abiPath: 'assets/abis/PaymentInformations.json',
        functionName: 'getPaymentInfoByUsername',
      );
      emit(UserDonationsFetched(donations: donations));
    } catch (e) {
      emit(
        UserDonationFetchingFailed(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
