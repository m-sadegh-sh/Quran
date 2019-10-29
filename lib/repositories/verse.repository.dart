import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kiwi/kiwi.dart';

import 'package:quran/items/verse.item.dart';
import 'package:quran/repositories/verse_translation.repository.dart';

class VerseRepository {
  List<VerseItem> _cachedEntities;

  VerseRepository() {
    _init();
  }

  Future<List<VerseItem>> findAll() async {
    if (_cachedEntities == null)
      await _init();

    return _cachedEntities;
  }
  
  Future<List<VerseItem>> findAllTranslated(int chapterId, int settingsTranslatorId) async {
    final verseTranslationRepository = Container().resolve<VerseTranslationRepository>();

    return Future.wait((await findAll()).map((v) async =>
      VerseItem.toTranslated(v, await verseTranslationRepository.findTranslationText(v.id, settingsTranslatorId))
    ));
  }
  
  Future<List<VerseItem>> searchAllTranslated(int chapterId, int settingsTranslatorId, String chapterDetailsSearchQuery) async {
    return (await findAllTranslated(chapterId, settingsTranslatorId)).where((ci) => 
      ci.fullText.contains(chapterDetailsSearchQuery) ||
      ci.cleanText.contains(chapterDetailsSearchQuery) ||
      ci.translatedText.contains(chapterDetailsSearchQuery)
    ).toList();
  }

  Future _init() async {
    final key = 'assets/data/verses.json';

    String data = await rootBundle.loadString(key);
    
    _cachedEntities = json.decode(data).map<VerseItem>(
      (pj) => VerseItem.fromJson(pj)
    ).toList();

    print('Repository inited. (dataFileName: $key)');
  }
}
