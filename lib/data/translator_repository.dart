import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/items/translator_item.dart';

class TranslatorRepository {
  static List<TranslatorItem> _cachedEntities;

  static final TranslatorRepository _instance = TranslatorRepository._private();

  TranslatorRepository._private() {
    _init();
  }

  factory TranslatorRepository() {
    return _instance;
  }

  Future<List<TranslatorItem>> findAll() async {
    return _cachedEntities;
  }
  
  Future<bool> _init() async {
    final key = 'assets/data/translators.json';

    String data = await rootBundle.loadString(key);
    _cachedEntities = json.decode(data).map<TranslatorItem>(_fromJson).toList();

    print('Repository inited. (dataFileName: $key)');

    return true;
  }

  TranslatorItem _fromJson(dynamic parsedJson) => TranslatorItem.fromJson(parsedJson);
}
