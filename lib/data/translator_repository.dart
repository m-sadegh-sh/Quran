import 'dart:async';

import 'package:quran/data/repository_base.dart';
import 'package:quran/items/translator_item.dart';

class TranslatorRepository extends RepositoryBase<TranslatorItem> {
  static final TranslatorRepository _instance = TranslatorRepository._private();

  factory TranslatorRepository() {
    return _instance;
  }

  TranslatorRepository._private();

  @override
  String get dataFileName => 'translators';

  @override
  TranslatorItem fromJson(dynamic parsedJson) => TranslatorItem.fromJson(parsedJson);
  
  Future<TranslatorItem> findOneById(int id) async {
    return (await findAll()).singleWhere((ti) => ti.id == id);
  }

  Future<TranslatorItem> findOneByLocaleCode(String localeCode) async {
    return (await findAll()).singleWhere((ti) => ti.localeCode == localeCode);
  }
}
