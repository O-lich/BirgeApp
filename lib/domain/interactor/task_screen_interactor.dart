import 'package:birge_app/data/repository/task_screen_repository.dart';
import '../model/task_model.dart';

class TaskInteractor {
  TaskInteractor();

  final TaskRepository _repository = TaskRepository();

  Stream<List<TaskModel>> getStreamNotes(String date) =>
      _repository.getUserTaskNotesStream(date);

  void addNote(TaskModel taskNote) => _repository.create(taskNote);

  void deleteNote(TaskModel taskNote) => _repository.delete(taskNote);

  void updateNote(TaskModel taskNote) => _repository.update(taskNote);
}