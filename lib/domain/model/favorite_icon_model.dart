import 'package:flutter/cupertino.dart';

class FavoriteIconViewModel {
  Icon? icon (bool isFavorite, Icon redIcon) {
    if (isFavorite = true) {
      return redIcon;
    } else {
      return null;
    }
  }
}