import 'package:fets_mobile/features/features.dart';
import 'package:fets_mobile/features/models/models.dart';
import 'package:fets_mobile/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubprojectBloc extends Bloc<SubprojectEvent, SubprojectState> {
  final SubProjectRepository _subProjectRepository;
  SubprojectBloc()
      : _subProjectRepository = serviceLocator.get<SubProjectRepository>(),
        super(SubprojectInit()) {
    on<FetchSubprojectByProjectId>(_fetchSubprojectByProjectId);
  }

  Future<void> _fetchSubprojectByProjectId(
      FetchSubprojectByProjectId event, Emitter<SubprojectState> emit) async {
    emit(SubprojectProgressState());
    try {
      final contractData = await _subProjectRepository.readSuprojectContract(
          "assets/abis/SubProject.json",
          "getSubProjectsListByProjectId",
          [event.projectId]);

      print(contractData[0]);
      final subprojectData = List.generate(contractData[0].length, (index) {
        return SubprojectData.fromList(contractData[0][index]);
      }).toList();

      emit(SubProjectsFetched(subprojectData: subprojectData));
    } catch (e) {
      emit(SubprojectFailure(errorMessage: e.toString()));
    }
  }
}
