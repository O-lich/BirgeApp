import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'profile_screen_store.g.dart';

class ProfileScreenStore = _ProfileScreenStore with _$ProfileScreenStore;

abstract class _ProfileScreenStore with Store {
  @observable
  XFile? pickedFile;

  @action
  void pickedFileupload(Future<dynamic> Function(), XFile? photo) {
    if (pickedFile != null) {
      photo = File(pickedFile!.path) as XFile?;
      Function();
    } else {
      print('No image selected.');
    }
  }
}
