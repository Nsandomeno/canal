import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_repository.g.dart';

class ImageRepository {
  ImageRepository(this._picker);

  final ImagePicker _picker;
  /// TODO map XFile to internal type
  Future<XFile?> selectOne() async {
    return await _picker.pickImage(
      source: ImageSource.gallery
    );
  }

  Future<List<XFile?>> selectTwo() async {
    return await _picker.pickMultiImage();
  }

  Future<XFile?> takeOne() async {
    return await _picker.pickImage(
      source: ImageSource.camera
    );
  }
}

@riverpod
ImageRepository imageRepository(ImageRepositoryRef ref) {
  return ImageRepository(ImagePicker());
}
