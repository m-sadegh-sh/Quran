import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kiwi/kiwi.dart';

import 'package:quran/items/chapter.item.dart';
import 'package:quran/repositories/chapter_translation.repository.dart';

class ChapterRepository {
  List<ChapterItem> _cachedEntities;

  Future<List<ChapterItem>> findAll() async {
    return _cachedEntities;
  }
  
  Future<List<ChapterItem>> findAllTranslated(int settingsTranslatorId) async {
    final chapterTranslationRepository = Container().resolve<ChapterTranslationRepository>();

    return Future.wait((await findAll()).map((c) async =>
      ChapterItem.toTranslated(c, await chapterTranslationRepository.findTranslationTitle(c.id, settingsTranslatorId))
    ));
  }
  
  Future<List<ChapterItem>> searchAllTranslated(int settingsTranslatorId, String homeSearchQuery) async {
    return (await findAllTranslated(settingsTranslatorId)).where((ci) => 
      ci.fullTitle.contains(homeSearchQuery) ||
      ci.cleanTitle.contains(homeSearchQuery) ||
      ci.translatedTitle.contains(homeSearchQuery)
    ).toList();
  }
  
  Future init() async {
    final key = 'assets/data/chapters.json';

    String data = await rootBundle.loadString(key);
    
    _cachedEntities = json.decode(data).map<ChapterItem>(
      (pj) => ChapterItem.fromJson(pj)
    ).toList();

    print('Repository inited. (dataFileName: $key)');
  }
}
