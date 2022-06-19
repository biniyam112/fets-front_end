import 'package:fets_mobile/features/search_image/bloc/search_image_event.dart';
import 'package:fets_mobile/features/search_image/bloc/search_image_state.dart';
import 'package:fets_mobile/features/search_image/data/repository/search_image_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchImageBloc extends Bloc<SearchImageEvent, SearchImageState> {
  SearchImageBloc(
      {required SearchImageState initialState, required this.searchImageRepo})
      : super(initialState) {
    on<SearchImageEvent>(_searchImage);
  }
  final SearchImageRepo searchImageRepo;
  Future<void> _searchImage(
      SearchImageEvent event, Emitter<SearchImageState> emit) async {
    emit(ImageSearchingState());
    try {
      String imageUrl = await searchImageRepo.searchImage(query: event.query);
      if (imageUrl.isEmpty) {
        emit(NoImageFound());
      } else {
        emit(
          ImageFound(
            imageUrl: imageUrl,
          ),
        );
      }
    } catch (e) {
      emit(ImageSearchingFailed());
    }
  }
}
