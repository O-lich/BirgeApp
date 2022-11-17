import 'package:birge_app/domain/model/diary_model.dart';
import 'diary_repository.dart';

class DiaryInteractor {
  final DiaryRepository _repository = DiaryRepository();

  Stream<List<DiaryModel>> get streamNotes =>
      _repository.getUserNotesStream();
  void addNote(DiaryModel diaryNote) => _repository.create(diaryNote);
}