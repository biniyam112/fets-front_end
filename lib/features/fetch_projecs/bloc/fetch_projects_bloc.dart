import 'package:fets_mobile/features/fetch_projecs/bloc/fetch_projects_event.dart';
import 'package:fets_mobile/features/fetch_projecs/bloc/fetch_projects_state.dart';
import 'package:fets_mobile/features/fetch_projecs/data/repository/fetch_projects_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchProjectsBloc extends Bloc<FetchProjectsEvent, FetchProjectsState> {
  FetchProjectsBloc(FetchProjectsState initialState,
      {required this.fetchProjectsRepo})
      : super(initialState) {
    on<FetchAllProjects>(_fetchAllProjects);
  }
  final FetchProjectsRepo fetchProjectsRepo;

  Future<void> _fetchAllProjects(
      FetchProjectsEvent event, Emitter<FetchProjectsState> emit) async {
    emit(FetchingProjects());
    // try {
    var projects = await fetchProjectsRepo.readProjectContract(
      abiPath: 'assets/abis/Project.json',
      functionName: 'getAllProjects',
      args: [],
    );
    emit(ProjectsFetched(projects: projects));
    // } catch (e) {
    //   emit(ProjectsFetchingFailed(errorMessage: e.toString()));
    // }
  }
}
