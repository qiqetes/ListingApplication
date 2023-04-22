import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_gpt/repository/image_repository.dart';
part 'listings_img_event.dart';
part 'listings_img_state.dart';

class ListingImgBloc extends Bloc<ListingImgEvent, ListingImgState> {
  ListingImgBloc({required List<String> queries})
      : super(
          ListingImgState(
            images: List.filled(queries.length, null),
            imageStates: List.filled(
              queries.length,
              ImageState.loading,
            ),
          ),
        ) {
    on<ListingImgLoad>((_, emit) => _initialize(queries, emit));
  }

  void _initialize(List<String> querys, Emitter<ListingImgState> emit) async {
    emit(ListingImgState(
        images: List.filled(querys.length, null),
        imageStates: List.filled(querys.length, ImageState.loading)));

    List<int> indexes = List.generate(querys.length, (index) => index);
    await Future.forEach(indexes, (i) => _loadImg(querys[i], i, emit));
  }

  void _loadImg(String query, int i, Emitter<ListingImgState> emit) async {
    try {
      String url = await ImgRepository.getImgUrl(query);
      List<String?> images = state.images;
      images[i] = url;
      List<ImageState> imageStates = state.imageStates;
      imageStates[i] = ImageState.loaded;
      emit(ListingImgState(images: images, imageStates: imageStates));
    } catch (e) {
      List<String?> images = state.images;
      images[i] = null;
      List<ImageState> imageStates = state.imageStates;
      imageStates[i] = ImageState.error;
      emit(ListingImgState(images: images, imageStates: imageStates));
    }
  }
}
