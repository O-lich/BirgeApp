import 'dart:io';
import 'package:birge_app/ui/screens/profile_screen/url_image_repository.dart';
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

  final _repository = UrlImageRepository();

  @action
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      print(image.path.toString());
      imageFile = imageTemp;
      final userId = FirebaseAuth.instance.currentUser?.uid;
      final file = File(imageFile!.path);
      final destination = 'files/$userId';
      final ref = FirebaseStorage.instance.ref().child(destination);
      UploadTask uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      _repository.create(await snapshot.ref.getDownloadURL());
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }


  void listenChanges() {
    _repository.getImageUrl().listen((imageUrl) {
      if (imageUrl == null) return;
      downloadImage = imageUrl;
    });
  }
}
