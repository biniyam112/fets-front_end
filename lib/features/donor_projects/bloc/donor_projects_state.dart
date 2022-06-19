import 'package:equatable/equatable.dart';
import 'package:fets_mobile/features/models/donation.dart';

class DonorProjectState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserDonationsInitState extends DonorProjectState {}

class UserDonationsFetched extends DonorProjectState {
  final List<Donation> donations;

  UserDonationsFetched({required this.donations});
}

class UserDonationFetchingFailed extends DonorProjectState {
  final String errorMessage;

  UserDonationFetchingFailed({required this.errorMessage});
}

class UserDonationFetching extends DonorProjectState {}
