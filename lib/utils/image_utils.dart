import 'package:image_picker/image_picker.dart';

class ImageUtils{

  ImagePicker picker = ImagePicker();

  Future<XFile?> captureCameraImage() async{
    XFile? file = await picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> pickGalleryImage() async{
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}