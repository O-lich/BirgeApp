import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'profile_screen_store.g.dart';

class ProfileScreenStore = _ProfileScreenStore with _$ProfileScreenStore;

abstract class _ProfileScreenStore with Store {
  @observable
  XFile? pickedFile;

  @observable
  String? downloadImage;

  @observable
  File? imageFile;

  @action
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      print(image.path.toString());
      imageFile = imageTemp;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @action
  void pickedFileDownload(Future<dynamic> Function()) {
    downloadImage = Function().toString();
  }

// @action
// void pickedFileupload(Future<dynamic> Function(), XFile? photo) {
//   if (pickedFile != null) {
//     photo = File(pickedFile!.path) as XFile?;
//     Function();
//   } else {
//     print('No image selected.');
//   }
// }
}
