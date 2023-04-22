part of 'listings_img_bloc.dart';

enum ImageState { loading, loaded, error }

class ListingImgState {
  final List<String?> images;
  final List<ImageState> imageStates;

  ListingImgState({required this.images, required this.imageStates});
}
