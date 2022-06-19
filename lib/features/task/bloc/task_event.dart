import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchTaskBySubProjectId extends TaskEvent {
  final BigInt subProjectId;

  FetchTaskBySubProjectId({required this.subProjectId});

  @override
  List<Object?> get props => [subProjectId];
}

class FetchTaskByProjectId extends TaskEvent {
  final BigInt projectId;

  FetchTaskByProjectId({required this.projectId});

  @override
  List<Object?> get props => [projectId];
}
