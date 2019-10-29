import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kiwi/kiwi.dart';

import 'package:quran/items/verse.item.dart';
import 'package:quran/repositories/verse_translation.repository.dart';

class VerseRepository {
  List<VerseItem> _cachedEntities;

  Future<List<VerseItem>> findAll() async {
    return _cachedEntities;
  }
  
  Future<List<VerseItem>> findAllByChapterId(int chapterId) async {
    return (await findAll()).where((v) => v.chapterId == chapterId).toList();
  }
  
  Future<List<VerseItem>> findAllTranslated(int chapterId, int settingsTranslatorId) async {
    final verseTranslationRepository = Container().resolve<VerseTranslationRepository>();

    // final verseItems = await findAllByChapterId(chapterId);
    // final translatedVerseItems = new List<VerseItem>();

    // for (var verseItem in verseItems) {
    //   translatedVerseItems.add(
    //     VerseItem.toTranslated(
    //       verseItem,
    //       await verseTranslationRepository.findTranslationText(verseItem.id, settingsTranslatorId)
    //     )
    //   );
    // }

    // return translatedVerseItems;
    return Future.wait((await findAllByChapterId(chapterId)).map((v) async =>
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

  Future init() async {
    final key = 'assets/data/verses.json';

    String data = await rootBundle.loadString(key);
    
    _cachedEntities = json.decode(data).map<VerseItem>(
      (pj) => VerseItem.fromJson(pj)
    ).toList();

    print('Repository inited. (dataFileName: $key)');
  }
}
