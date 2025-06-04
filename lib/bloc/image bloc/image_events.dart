import 'package:equatable/equatable.dart';

abstract class ImageEvents extends Equatable {
  const ImageEvents();

  @override
  List<Object?> get props => [];
}

class CaptureCameraImage extends ImageEvents{}

class PickGalleryImage extends ImageEvents{}