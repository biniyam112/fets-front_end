import 'package:equatable/equatable.dart';

class DonorProjectEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUserDonations extends DonorProjectEvent {
  final String userName;

  FetchUserDonations({required this.userName});
}
