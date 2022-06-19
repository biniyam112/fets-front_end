import 'package:equatable/equatable.dart';

class SearchImageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ImageSearchingState extends SearchImageState {}

class ImageSearchingFailed extends SearchImageState {}

class NoImageFound extends SearchImageState {}

class ImageFound extends SearchImageState {
  final String imageUrl;

  ImageFound({required this.imageUrl});
}
