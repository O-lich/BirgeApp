import 'dart:convert';
import '../../const/strings.dart';
import '../../domain/model/meditation_model.dart';

class MeditationRepository {
  static List meditationsMap = jsonDecode(jsonMeditations.toString());

  static final List<MeditationModel> _meditations = [];

  static void init() {
    // json parse
    for (int i = 0; i < meditationsMap.length; i++) {
      _meditations.add(MeditationModel.fromJson(meditationsMap[i]));
    }
  }

  static List<MeditationModel> get getMeditations => _meditations;
}

// Future<void> readJson() async {
//   final String response = await rootBundle.loadString('assets/files/meditations.json');
//   final data = await json.decode(response);
// }
