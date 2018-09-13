import 'dart:async';

import 'package:Quran/data/repository_base.dart';
import 'package:Quran/items/verse_translation_item.dart';

class VerseTranslationRepository extends RepositoryBase<VerseTranslationItem> {
  static VerseTranslationRepository _instance;

  VerseTranslationRepository.protected();

  factory VerseTranslationRepository() {
    if (_instance == null)
      _instance = VerseTranslationRepository._private();

    return _instance;
  }

  VerseTranslationRepository._private();

  @override
  String get dataFileName => 'verse-translations';

  @override
  VerseTranslationItem fromJson(dynamic parsedJson) => VerseTranslationItem.fromJson(parsedJson);
  
  Future<VerseTranslationItem> findByVerseId(int verseId) async {
    return (await list()).firstWhere((vti) => vti.verseId == verseId);
  }
}
