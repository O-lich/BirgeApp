import 'dart:math';

import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  final List images;

  const RandomImage({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(randomImages());
  }

  String randomImages() {
    int min = 0;
    int max = images.length - 1;
    final random = Random();
    int r = min + random.nextInt(max - min);
    String randomImage = images[r].toString();
    return randomImage;
  }
}
