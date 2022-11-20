import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../domain/model/task_model.dart';

class TaskRepository {
  final _plan = <TaskModel>[];
  List<TaskModel> get plan => _plan;

  Stream<List<TaskModel>> getUserTaskNotesStream(String date) async* {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance.ref("plans/$userId/$date");
    await for (final event in ref.onValue) {
      final map = event.snapshot.value as Map<dynamic, dynamic>?;
      if (map != null) {
        final List<TaskModel> plans = [];
        map.forEach((key, value) {
          plans.add(TaskModel(
              userId: userId,
              text: value['text'],
              id: key,
              date: date,
              isChecked: value['isChecked']));
        });
        yield plans;
      }
    }
  }

  Future create(TaskModel taskNoteModel) async {
    final userId = taskNoteModel.userId;
    final date = taskNoteModel.date.toString().substring(0, 10);
    final ref = FirebaseDatabase.instance.ref("plans/$userId/$date");
    await ref.push().set(<String, Object>{
      "text": taskNoteModel.text,
      "isChecked": taskNoteModel.isChecked
    });
  }

  Future<void> delete(TaskModel taskNoteModel) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance
        .ref("plans/$userId/${taskNoteModel.date}/${taskNoteModel.id}");
    ref.remove();
  }

  Future update(TaskModel taskNoteModel) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance
        .ref("plans/$userId/${taskNoteModel.date}/${taskNoteModel.id}");
    await ref.set(<String, Object>{
      "text": taskNoteModel.text,
      "isChecked": !taskNoteModel.isChecked
    });
  }
}