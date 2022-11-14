import 'package:birge_app/domain/model/diary_model.dart';
import 'package:birge_app/ui/screens/diary_screen/diary_interactor.dart';
import 'package:mobx/mobx.dart';
part 'diary_screen_store.g.dart';

class DiaryScreenStore = _DiaryScreenStore with _$DiaryScreenStore;

abstract class _DiaryScreenStore with Store {
  late final DiaryInteractor _diaryInteractor;

  @observable
  List<DiaryModel> value = [];

  @action
  void addDiaryNote(DiaryModel diaryNote) => _diaryInteractor.addNote(diaryNote);

}