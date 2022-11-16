import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../domain/model/article_model.dart';

class ArticleRepository {
  Stream<List<ArticleModel>> getArticlesStream() async* {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final ref = FirebaseDatabase.instance.ref("articles/$userId");
    await for (final event in ref.onValue) {
      final map = event.snapshot.value as Map<dynamic, dynamic>?;
      if (map != null) {
        final List<ArticleModel> articles = [];
        map.forEach((title, content) {
          articles.add(ArticleModel(title: title, content: content));
        });
        yield articles;
      }
    }
  }
}