import 'package:Quran/data/repository_base.dart';
import 'package:Quran/items/verse_item.dart';

class VerseRepository extends RepositoryBase<VerseItem> {
  static VerseRepository _instance;

  VerseRepository.protected();

  factory VerseRepository() {
    if (_instance == null)
      _instance = VerseRepository._private();

    return _instance;
  }

  VerseRepository._private();

  VerseItem fromJson(dynamic parsedJson) => VerseItem.fromJson(parsedJson);
}
