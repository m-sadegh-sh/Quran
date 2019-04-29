import 'dart:async';

import 'package:quran/data/repository_base.dart';
import 'package:quran/items/verse_translation_item.dart';

class VerseTranslationRepository extends RepositoryBase<VerseTranslationItem> {
  static final VerseTranslationRepository _instance = VerseTranslationRepository._private();

  factory VerseTranslationRepository() {
    return _instance;
  }

  VerseTranslationRepository._private();

  @override
  String get dataFileName => 'verse_translations';

  @override
  VerseTranslationItem fromJson(dynamic parsedJson) =>
      VerseTranslationItem.fromJson(parsedJson);

  Future<VerseTranslationItem> findOneByVerseId(int verseId, int translatorId) async {
    if (verseId > 10000)
      return (await findAll()).singleWhere((vti) => vti.verseId == 1 && vti.translatorId == translatorId);

    return (await findAll()).singleWhere((vti) => vti.verseId == verseId && vti.translatorId == translatorId);
  }
}
