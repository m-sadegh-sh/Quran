import 'dart:async';

import 'package:quran/data/repository_base.dart';
import 'package:quran/items/chapter_translation_item.dart';

class ChapterTranslationRepository extends RepositoryBase<ChapterTranslationItem> {
  static ChapterTranslationRepository _instance;

  ChapterTranslationRepository.protected();

  factory ChapterTranslationRepository() {
    if (_instance == null) {
      _instance = ChapterTranslationRepository._private();
      print('ChapterTranslationRepository created.');
    }

    return _instance;
  }

  ChapterTranslationRepository._private();

  @override
  String get dataFileName => 'chapter_translations';

  @override
  ChapterTranslationItem fromJson(dynamic parsedJson) => ChapterTranslationItem.fromJson(parsedJson);
  
  Future<ChapterTranslationItem> findOneByChapterId(int chapterId, int translatorId) async {    
    return (await findAll()).singleWhere((cti) => cti.chapterId == chapterId && cti.translatorId == translatorId);
  }
}
