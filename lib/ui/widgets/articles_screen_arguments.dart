import 'package:flutter/cupertino.dart';

class ArticleScreenArguments {
  final String title;
  final String content;
  final ImageProvider image;

  ArticleScreenArguments({
    required this.image,
    required this.title,
    required this.content,
  });
}
