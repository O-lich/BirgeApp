import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../domain/model/diary_model.dart';

class DiaryRepository {
  final _diary = <DiaryModel>[];

  List<DiaryModel> get diary => _diary;

  Stream<List<DiaryModel>> getUserNotesStream(String date) async* {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance.ref("notes/$userId/$date");
    await for (final event in ref.onValue) {
      final map = event.snapshot.value as Map<dynamic, dynamic>?;
      if (map != null) {
        final List<DiaryModel> notes = [];
        map.forEach((key, value) {
          notes.add(DiaryModel(
              userId: userId,
              title: value['title'],
              subtitle: value['subtitle'],
              id: key,
              date: date));
        });
        yield notes;
      } else {
        yield [];
      }
    }
  }

  Future create(DiaryModel diaryNoteModel) async {
    final userId = diaryNoteModel.userId;
    final date = diaryNoteModel.date.toString().substring(0, 10);
    final ref = FirebaseDatabase.instance.ref("notes/$userId/$date");
    await ref.push().set(<String, Object>{
      "title": diaryNoteModel.title,
      "subtitle": diaryNoteModel.subtitle
    });
  }

  Future<void> delete(DiaryModel diaryNoteModel) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance
        .ref("notes/$userId/${diaryNoteModel.date}/${diaryNoteModel.id}");
    ref.remove();
  }

  Future<void> update(DiaryModel diaryNoteModel) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance
        .ref("notes/$userId/${diaryNoteModel.date}/${diaryNoteModel.id}");
    await ref.set(<String, Object>{
      "title": diaryNoteModel.title,
      "subtitle": diaryNoteModel.subtitle
    });
  }
}
