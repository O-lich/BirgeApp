import 'dart:convert';

import '../const/strings.dart';
import '../domain/model/meditation_model.dart';

class MeditationRepository {
  Map<String, dynamic> meditationsMap = jsonDecode(jsonMeditations.toString());

  List<MeditationModel> _meditations = [];

  void init() {
    // json parse
    _meditations = MeditationModel.fromJson(meditationsMap);
    print(_meditations);
  }

  static List<MeditationModel> get getMeditations => _meditations;
}
