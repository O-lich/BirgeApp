import 'dart:convert';
import '../const/strings.dart';
import '../domain/model/meditation_model.dart';

class MeditationRepository {
  static List meditationsMap = jsonDecode(jsonMeditations.toString());

  static final List<MeditationModel> _meditations = [];
  static final List<String> _meditationTitles = [];
  static final List<String> _meditationLinks = [];
  static final List<String> _meditationImages = [];
  static final List<String> _meditationAuthors = [];

  static void init() {
    // json parse
    for (int i = 0; i < meditationsMap.length; i++) {
      _meditations.add(MeditationModel.fromJson(meditationsMap[i]));
      _meditationLinks.add(_meditations[i].link);
      _meditationTitles.add(_meditations[i].title);
      _meditationAuthors.add(_meditations[i].author);
      _meditationImages.add(_meditations[i].image);
    }
  }

  static List<MeditationModel> get getMeditations => _meditations;

  static List<String> get getMeditationsLinks => _meditationLinks;

  static List<String> get getMeditationsTitles => _meditationTitles;

  static List<String> get getMeditationsImages => _meditationImages;

  static List<String> get getMeditationsAuthors => _meditationAuthors;
}

// Future<void> readJson() async {
//   final String response = await rootBundle.loadString('assets/files/meditations.json');
//   final data = await json.decode(response);
// }
