// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_article_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SingleArticleScreenStore on _SingleArticleScreenStore, Store {
  late final _$isFavoriteAtom =
      Atom(name: '_SingleArticleScreenStore.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$_SingleArticleScreenStoreActionController =
      ActionController(name: '_SingleArticleScreenStore', context: context);

  @override
  void changeFavorite() {
    final _$actionInfo = _$_SingleArticleScreenStoreActionController
        .startAction(name: '_SingleArticleScreenStore.changeFavorite');
    try {
      return super.changeFavorite();
    } finally {
      _$_SingleArticleScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Icon? changeIcon(bool isFavorite, Icon activeIcon, Icon inactiveIcon) {
    final _$actionInfo = _$_SingleArticleScreenStoreActionController
        .startAction(name: '_SingleArticleScreenStore.changeIcon');
    try {
      return super.changeIcon(isFavorite, activeIcon, inactiveIcon);
    } finally {
      _$_SingleArticleScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFavorite: ${isFavorite}
    ''';
  }
}
