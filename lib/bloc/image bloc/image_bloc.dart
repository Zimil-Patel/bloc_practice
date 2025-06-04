import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/image%20bloc/image_events.dart';
import 'package:bloc_practice/bloc/image%20bloc/image_state.dart';
import 'package:bloc_practice/utils/image_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImageBloc extends Bloc<ImageEvents, ImageState>{

  final ImageUtils imageUtils;

  ImageBloc(this.imageUtils) : super(ImageState()) {
    on<CaptureCameraImage>(_captureCameraImage);
    on<PickGalleryImage>(_pickGalleryImage);
  }

  _captureCameraImage(CaptureCameraImage event, Emitter<ImageState> emit) async {
    XFile? file = await imageUtils.captureCameraImage();
    emit(state.copyWith(file: file));
  }

  _pickGalleryImage(PickGalleryImage event, Emitter<ImageState> emit) async {
    XFile? file = await imageUtils.pickGalleryImage();
    emit(state.copyWith(file: file));
  }

}