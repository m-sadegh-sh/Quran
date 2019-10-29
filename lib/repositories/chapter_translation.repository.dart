import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/items/chapter_translation.item.dart';

class ChapterTranslationRepository {
  List<ChapterTranslationItem> _cachedEntities;

  ChapterTranslationRepository() {
    _init();
  }

  Future<List<ChapterTranslationItem>> findAll() async {
    if (_cachedEntities == null)
      await _init();

    return _cachedEntities;
  }
  
  Future<String> findTranslationTitle(int chapterId, int settingTranslatorId) async {    
    return (await findAll()).singleWhere(
      (cti) => cti.chapterId == chapterId && cti.translatorId == settingTranslatorId
    )?.title;
  }

  Future _init() async {
    final key = 'assets/data/chapter_translations.json';

    String data = await rootBundle.loadString(key);
    
    _cachedEntities = json.decode(data).map<ChapterTranslationItem>(
      (pj) => ChapterTranslationItem.fromJson(pj)
    ).toList();

    print('Repository inited. (dataFileName: $key)');
  }
}
