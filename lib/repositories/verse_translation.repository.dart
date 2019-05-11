import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/items/verse_translation.item.dart';

class VerseTranslationRepository {
  List<VerseTranslationItem> _cachedEntities;

  VerseTranslationRepository() {
    _init();
  }

  Future<List<VerseTranslationItem>> findAll() async {
    if (_cachedEntities == null)
      await _init();

    return _cachedEntities;
  }

  Future<VerseTranslationItem> findOneByVerseId(int verseId, int translatorId) async {
    await Future.delayed(Duration(milliseconds: 500));

    if (verseId == null)
      return null;

    if (verseId > 10000)
      return (await findAll()).singleWhere((vti) => vti.verseId == 1 && vti.translatorId == translatorId);

    return (await findAll()).singleWhere((vti) => vti.verseId == verseId && vti.translatorId == translatorId);
  }

  Future _init() async {
    final key = 'assets/data/verse_translations.json';

    String data = await rootBundle.loadString(key);

    _cachedEntities = json.decode(data).map<VerseTranslationItem>(
      (pj) => VerseTranslationItem.fromJson(pj)
    ).toList();

    print('Repository inited. (dataFileName: $key)');
  }
}
