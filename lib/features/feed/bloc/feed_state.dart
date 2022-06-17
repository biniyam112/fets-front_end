import 'package:equatable/equatable.dart';
import 'package:fets_mobile/features/features.dart';

abstract class FeedState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FeedInit extends FeedState {}

class FeedFailed extends FeedState {
  final String errorMessage;

  FeedFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class FeedInprogress extends FeedState {}

class FeedsFetched extends FeedState {
  final List<APIFeedData> feeds;

  FeedsFetched({required this.feeds});

  @override
  List<Object?> get props => [feeds];
}
