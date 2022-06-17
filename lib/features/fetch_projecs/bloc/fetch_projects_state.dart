import 'package:fets_mobile/features/models/project.dart';

class FetchProjectsState {}

class ProjectsIdleState extends FetchProjectsState {}

class FetchingProjects extends FetchProjectsState {}

class ProjectsFetched extends FetchProjectsState {
  final List<Project> projects;

  ProjectsFetched({
    required this.projects,
  });
}

class ProjectsFetchingFailed extends FetchProjectsState {
  final String errorMessage;

  ProjectsFetchingFailed({required this.errorMessage});
}
