import 'package:equatable/equatable.dart';
import 'package:fets_mobile/features/models/models.dart';

abstract class SubprojectState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubprojectInit extends SubprojectState {}

class SubprojectProgressState extends SubprojectState {}

class SubProjectsFetched extends SubprojectState {
  final List<SubprojectData> subprojectData;

  SubProjectsFetched({required this.subprojectData});

  @override
  List<Object?> get props => [subprojectData];
}

class SubprojectFailure extends SubprojectState {
  final String errorMessage;

  SubprojectFailure({required this.errorMessage});

  @override
  List<Object?> get props => [this.errorMessage];
}
