import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kiwi/kiwi.dart';

import 'package:quran/items/chapter.item.dart';
import 'package:quran/repositories/chapter_translation.repository.dart';

class ChapterRepository {
  List<ChapterItem> _cachedEntities;

  ChapterRepository() {
    _init();
  }

  Future<List<ChapterItem>> findAll() async {
    if (_cachedEntities == null)
      await _init();

    return _cachedEntities;
  }
  
  Future<List<ChapterItem>> findAllTranslated(int settingTranslatorId) async {
    final chapterTranslationRepository = Container().resolve<ChapterTranslationRepository>();

    return Future.wait((await findAll()).map((c) async =>
      ChapterItem.toTranslated(c, await chapterTranslationRepository.findTranslationTitle(c.id, settingTranslatorId))
    ));
  }
  
  Future<List<ChapterItem>> searchAllTranslated(int settingTranslatorId, String homeSearchQuery) async {
    return (await findAllTranslated(settingTranslatorId)).where((ci) => 
      ci.fullTitle.contains(homeSearchQuery) ||
      ci.cleanTitle.contains(homeSearchQuery) ||
      ci.translatedTitle.contains(homeSearchQuery)
    ).toList();
  }
  
  Future _init() async {
    final key = 'assets/data/chapters.json';

    String data = await rootBundle.loadString(key);
    
    _cachedEntities = json.decode(data).map<ChapterItem>(
      (pj) => ChapterItem.fromJson(pj)
    ).toList();

    print('Repository inited. (dataFileName: $key)');
  }
}
