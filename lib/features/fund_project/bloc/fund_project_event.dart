import 'package:fets_mobile/features/models/donation.dart';

class FundProjectEvent {}

class FundProject extends FundProjectEvent {
  final Donation donation;

  FundProject({required this.donation});
}
