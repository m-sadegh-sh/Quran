import 'dart:async';

import 'package:quran/data/repository_base.dart';
import 'package:quran/items/verse_translation_item.dart';

class VerseTranslationRepository extends RepositoryBase<VerseTranslationItem> {
  static VerseTranslationRepository _instance;

  VerseTranslationRepository.protected();

  factory VerseTranslationRepository() {
    if (_instance == null) {
      _instance = VerseTranslationRepository._private();
      print('VerseTranslationRepository created.');
    }

    return _instance;
  }

  VerseTranslationRepository._private();

  @override
  String get dataFileName => 'verse_translations';

  @override
  VerseTranslationItem fromJson(dynamic parsedJson) =>
      VerseTranslationItem.fromJson(parsedJson);

  Future<VerseTranslationItem> findOneByVerseId(int verseId, int translatorId) async {
    return (await findAll()).singleWhere((vti) => vti.verseId == verseId && vti.translatorId == translatorId);
  }
}
