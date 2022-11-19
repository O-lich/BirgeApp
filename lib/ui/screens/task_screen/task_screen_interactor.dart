import 'package:birge_app/ui/screens/task_screen/task_screen_repository.dart';
import '../../../domain/model/task_model.dart';

class TaskInteractor {
  TaskInteractor();

  final TaskRepository _repository = TaskRepository();

  Stream<List<TaskModel>> getStreamNotes(String date) =>
      _repository.getUserTaskNotesStream(date);

  void addNote(TaskModel taskNote) => _repository.create(taskNote);
}