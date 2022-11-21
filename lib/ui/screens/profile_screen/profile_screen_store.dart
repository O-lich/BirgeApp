import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'profile_screen_store.g.dart';

class ProfileScreenStore = _ProfileScreenStore with _$ProfileScreenStore;

abstract class _ProfileScreenStore with Store {
  @observable
  String? downloadImage;

  @observable
  File? imageFile;

  String name = FirebaseAuth.instance.currentUser?.displayName ?? '';

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
  Future uploadFile() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final file = File(imageFile!.path);
    final destination = 'files/$userId';
    try {
      final ref = FirebaseStorage.instance.ref().child(destination);
      UploadTask uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      downloadImage = await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('error occurred $e');
    }
  }
}
