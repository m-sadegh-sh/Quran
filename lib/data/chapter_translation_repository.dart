import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/items/chapter_translation_item.dart';

class ChapterTranslationRepository {
  static List<ChapterTranslationItem> _cachedEntities;

  static final ChapterTranslationRepository _instance = ChapterTranslationRepository._private();

  ChapterTranslationRepository._private() {
    _init();
  }

  factory ChapterTranslationRepository() {
    return _instance;
  }

  Future<List<ChapterTranslationItem>> findAll() async {
    return _cachedEntities;
  }
  
  Future<ChapterTranslationItem> findOneByChapterId(int chapterId, int translatorId) async {    
    await Future.delayed(Duration(milliseconds: 500));

    return (await findAll()).singleWhere((cti) => cti.chapterId == chapterId && cti.translatorId == translatorId);
  }

  Future<bool> _init() async {
    final key = 'assets/data/chapter_translations.json';

    String data = await rootBundle.loadString(key);
    _cachedEntities = json.decode(data).map<ChapterTranslationItem>(_fromJson).toList();

    print('Repository inited. (dataFileName: $key)');

    return true;
  }

  ChapterTranslationItem _fromJson(dynamic parsedJson) => ChapterTranslationItem.fromJson(parsedJson);
}
