import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/items/verse_translation_item.dart';

class VerseTranslationRepository {
  static List<VerseTranslationItem> _cachedEntities;

  static final VerseTranslationRepository _instance = VerseTranslationRepository._private();

  VerseTranslationRepository._private() {
    _init();
  }

  factory VerseTranslationRepository() {
    return _instance;
  }

  Future<List<VerseTranslationItem>> findAll() async {
    return _cachedEntities;
  }

  Future<VerseTranslationItem> findOneByVerseId(int verseId, int translatorId) async {
    await Future.delayed(Duration(milliseconds: 500));

    if (verseId > 10000)
      return (await findAll()).singleWhere((vti) => vti.verseId == 1 && vti.translatorId == translatorId);

    return (await findAll()).singleWhere((vti) => vti.verseId == verseId && vti.translatorId == translatorId);
  }

  Future<bool> _init() async {
    final key = 'assets/data/verse_translations.json';

    String data = await rootBundle.loadString(key);
    _cachedEntities = json.decode(data).map<VerseTranslationItem>(_fromJson).toList();

    print('Repository inited. (dataFileName: $key)');

    return true;
  }

  VerseTranslationItem _fromJson(dynamic parsedJson) => VerseTranslationItem.fromJson(parsedJson);
}
