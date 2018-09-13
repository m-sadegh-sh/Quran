import 'dart:async';

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

  @override
  String get dataFileName => 'translators';

  @override
  TranslatorItem fromJson(dynamic parsedJson) => TranslatorItem.fromJson(parsedJson);
  
  Future<TranslatorItem> findById(int id) async {
    return (await list()).firstWhere((ti) => ti.id == id);
  }

  Future<TranslatorItem> findByLocaleCode(String localeCode) async {
    return (await list()).firstWhere((ti) => ti.localeCode == localeCode);
  }
}
