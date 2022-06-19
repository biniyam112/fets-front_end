import 'package:fets_mobile/features/models/project.dart';

class FundProjectState {}

class FundProjectInitState extends FundProjectState {}

class FundingProject extends FundProjectState {}

class ProjectFunded extends FundProjectState {}

class ProjectFundingFailed extends FundProjectState {
  final String errorMessage;

  ProjectFundingFailed({required this.errorMessage});
}
