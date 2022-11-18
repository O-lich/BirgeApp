import 'package:birge_app/domain/model/diary_model.dart';
import 'diary_repository.dart';

// class DiaryInteractor {
//   final String date;
//
//   DiaryInteractor({required this.date});
//
//   final DiaryRepository _repository = DiaryRepository();
//
//   //final String date = "2022-11-17";
//
//   Stream<List<DiaryModel>> get streamNotes =>
//       _repository.getUserNotesStream(date);
//
//   void addNote(DiaryModel diaryNote) => _repository.create(diaryNote);
// }

class DiaryInteractor {
  DiaryInteractor();

  final DiaryRepository _repository = DiaryRepository();

  Stream<List<DiaryModel>> getStreamNotes(String date) =>
      _repository.getUserNotesStream(date);

  void addNote(DiaryModel diaryNote) => _repository.create(diaryNote);
}
