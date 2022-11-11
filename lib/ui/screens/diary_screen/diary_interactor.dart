import 'package:birge_app/domain/model/diary_model.dart';
import 'diary_repository.dart';

class DiaryInteractor {
  final DiaryRepository _repository = DiaryRepository();
  void addNote(DiaryModel diaryNote) => _repository.addDiaryNote(diaryNote);
}