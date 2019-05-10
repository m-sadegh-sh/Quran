import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/items/chapter.item.dart';

class ChapterRepository {
  List<ChapterItem> _cachedEntities;

  ChapterRepository() {
    _init();
  }

  Future<List<ChapterItem>> findAll() async {
    await Future.delayed(Duration(seconds: 1));

    return _cachedEntities;
  }
  
  Future<bool> _init() async {
    final key = 'assets/repositories/chapters.json';

    String data = await rootBundle.loadString(key);
    
    _cachedEntities = json.decode(data).map<ChapterItem>(
      (pj) => ChapterItem.fromJson(pj)
    ).toList();

    print('Repository inited. (dataFileName: $key)');

    return true;
  }
}
