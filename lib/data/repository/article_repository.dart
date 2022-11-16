import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../domain/model/article_model.dart';

class ArticleRepository {
  static final List<ArticleModel> articles = [];

  static void getArticlesStream() async {
    final ref = FirebaseDatabase.instance.ref("articles/");
    await for (final event in ref.onValue) {
      final map = event.snapshot.value as Map<dynamic, dynamic>?;
      if (map != null) {
        map.values.forEach((e) {
          articles.add(ArticleModel(title: e['title'], content: e['content']));
        });
      }
    }
  }

  static List<ArticleModel> get getArticles => articles;
}
