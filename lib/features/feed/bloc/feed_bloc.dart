import 'package:fets_mobile/features/features.dart';
import 'package:fets_mobile/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepository _feedRepository;

  FeedBloc()
      : _feedRepository = serviceLocator<FeedRepository>(),
        super(FeedInit()) {
    on<FetchAllFeeds>(_fetchAllFeeds);
  }

  Future<void> _fetchAllFeeds(
      FetchAllFeeds event, Emitter<FeedState> emit) async {
    emit(FeedInprogress());

    try {
      final apiData = await _feedRepository.getAllFeeds();

      if (apiData.error == true && apiData.statusCode != 200) {
        emit(FeedFailed(errorMessage: apiData.errors![0].toString()));
      }
      print(apiData.body[0]);
      List<APIFeedData> feeds = [];

      ((apiData.body) as List)
          .map((e) => {feeds.add(APIFeedData.fromJson(e))})
          .toList();

      emit(FeedsFetched(feeds: feeds));
    } catch (e) {
      print(e.toString());
      emit(FeedFailed(errorMessage: e.toString()));
    }
  }
}
