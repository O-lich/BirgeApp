import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../domain/model/diary_model.dart';

class DiaryRepository {
  final _diary = <DiaryModel>[];
  List<DiaryModel> get diary => _diary;

  Stream<List<DiaryModel>> getUserNotesStream() async* {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance.ref("notes/$userId");
    await for (final event in ref.onValue) {
      final map = event.snapshot.value as Map<dynamic, dynamic>?;
      if (map != null) {
        final List<DiaryModel> notes = [];
        map.forEach((key, value) {
          notes.add(DiaryModel(userId: userId, title: value['title'], subtitle: value['subtitle'], id: key));
        });
        yield notes;
      }
    }
  }
  Future create(DiaryModel diaryNoteModel) async {
    final userId = diaryNoteModel.userId;
    final ref = FirebaseDatabase.instance.ref("notes/$userId");
    await ref.push().set(<String, Object>{"title": diaryNoteModel.title, "subtitle": diaryNoteModel.subtitle});
  }
}

