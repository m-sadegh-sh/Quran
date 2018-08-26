import 'package:Quran/data/repository_base.dart';
import 'package:Quran/items/translator_item.dart';

class TranslatorRepository extends RepositoryBase<TranslatorItem> {
  static TranslatorRepository _instance;

  TranslatorRepository.protected();

  factory TranslatorRepository() {
    if (_instance == null)
      _instance = TranslatorRepository._private();

    return _instance;
  }

  TranslatorRepository._private();

  TranslatorItem fromJson(dynamic parsedJson) => TranslatorItem.fromJson(parsedJson);
}
