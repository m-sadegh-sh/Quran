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

  VerseTranslationItem fromJson(dynamic parsedJson) => VerseTranslationItem.fromJson(parsedJson);
}
