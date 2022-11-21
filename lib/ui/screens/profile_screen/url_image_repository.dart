import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UrlImageRepository {
  Stream<String?> getImageUrl() async* {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance.ref("images/$userId");
    await for (final event in ref.onValue) {
      final map = event.snapshot.value as Map<dynamic, dynamic>?;
      if (map == null) {
        yield null;
      }
      yield map?.values.first as String?;
    }
  }

  Future create(String imageUrl) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance.ref("images/$userId");
    await ref.push().set(imageUrl);
  }
}
