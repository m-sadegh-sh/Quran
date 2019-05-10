import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/items/translator.item.dart';

class TranslatorRepository {
  List<TranslatorItem> _cachedEntities;

  TranslatorRepository() {
    _init();
  }

  Future<List<TranslatorItem>> findAll() async {
    return _cachedEntities;
  }
  
  Future<bool> _init() async {
    final key = 'assets/repositories/translators.json';

    String data = await rootBundle.loadString(key);
    
    _cachedEntities = json.decode(data).map<TranslatorItem>(
      (pj) => TranslatorItem.fromJson(pj)
    ).toList();

    print('Repository inited. (dataFileName: $key)');

    return true;
  }
}
