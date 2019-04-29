import 'dart:async';

import 'package:quran/data/repository_base.dart';
import 'package:quran/items/chapter_translation_item.dart';

class ChapterTranslationRepository extends RepositoryBase<ChapterTranslationItem> {
  static final ChapterTranslationRepository _instance = ChapterTranslationRepository._private();

  factory ChapterTranslationRepository() {
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
