import 'package:birge_app/domain/model/diary_model.dart';
import 'diary_repository.dart';


class DiaryInteractor {
  DiaryInteractor();

  final DiaryRepository _repository = DiaryRepository();

  Stream<List<DiaryModel>> getStreamNotes(String date) =>
      _repository.getUserNotesStream(date);

  void addNote(DiaryModel diaryNote) => _repository.create(diaryNote);
}
