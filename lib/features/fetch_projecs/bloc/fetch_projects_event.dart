import 'package:equatable/equatable.dart';

class FetchProjectsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchAllProjects extends FetchProjectsEvent {}

class FetchDonorProjects extends FetchProjectsEvent {
  final String userName;

  FetchDonorProjects({required this.userName});
}
