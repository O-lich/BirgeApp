import 'dart:convert';

import '../const/strings.dart';
import '../domain/model/meditation_model.dart';

class MeditationRepository {
  Map<String, dynamic> meditationsMap = jsonDecode(jsonMeditations.toString());

  static List<MeditationModel> _meditations = [];

  static void init() {
    // json parse
    _meditations.add(MeditationModel.fromJson(meditationsMap));
    print(_meditations);
  }

  static List<MeditationModel> get getMeditations => _meditations;
}
