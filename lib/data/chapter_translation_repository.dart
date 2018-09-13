import 'dart:async';

import 'package:Quran/data/repository_base.dart';
import 'package:Quran/items/chapter_translation_item.dart';

class ChapterTranslationRepository extends RepositoryBase<ChapterTranslationItem> {
  static ChapterTranslationRepository _instance;

  ChapterTranslationRepository.protected();

  factory ChapterTranslationRepository() {
    if (_instance == null)
      _instance = ChapterTranslationRepository._private();

    return _instance;
  }

  ChapterTranslationRepository._private();

  @override
  String get dataFileName => 'chapter-translations';

  @override
  ChapterTranslationItem fromJson(dynamic parsedJson) => ChapterTranslationItem.fromJson(parsedJson);
  
  Future<ChapterTranslationItem> findByChapterId(int chapterId) async {
    return (await list()).firstWhere((cti) => cti.chapterId == chapterId);
  }
}
