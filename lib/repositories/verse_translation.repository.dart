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

  Future<String> findTranslationText(int verseId, int settingsTranslatorId) async {
    if (verseId == null)
      return null;

    return (await findAll()).singleWhere(
      (cti) => cti.verseId == (verseId > 10000 ? 1 : verseId) && cti.translatorId == settingsTranslatorId
    )?.text;
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
