import '../../../domain/model/diary_model.dart';

class DiaryRepository {
  final _diary = <DiaryModel>[];
  List<DiaryModel> get diary => _diary;
  void addDiaryNote(DiaryModel diaryNote) {
    diary.add(diaryNote);
  }
}

