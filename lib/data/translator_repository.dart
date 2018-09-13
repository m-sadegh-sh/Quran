import 'dart:async';

import 'package:Quran/data/repository_base.dart';
import 'package:Quran/items/translator_item.dart';

class TranslatorRepository extends RepositoryBase<TranslatorItem> {
  static TranslatorRepository _instance;

  TranslatorRepository.protected();

  factory TranslatorRepository() {
    if (_instance == null) {
      _instance = TranslatorRepository._private();
      print('TranslatorRepository created.');
    }

    return _instance;
  }

  TranslatorRepository._private();

  @override
  String get dataFileName => 'translators';

  @override
  TranslatorItem fromJson(dynamic parsedJson) => TranslatorItem.fromJson(parsedJson);
  
  Future<TranslatorItem> findOneById(int id) async {
    return (await findAll()).firstWhere((ti) => ti.id == id);
  }

  Future<TranslatorItem> findOneByLocaleCode(String localeCode) async {
    return (await findAll()).firstWhere((ti) => ti.localeCode == localeCode);
  }
}
