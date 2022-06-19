import 'package:equatable/equatable.dart';

abstract class SubprojectEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchSubprojectByProjectId extends SubprojectEvent {
  final BigInt projectId;

  FetchSubprojectByProjectId({required this.projectId});

  @override
  List<Object?> get props => [projectId];
}
