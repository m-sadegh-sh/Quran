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
    if (_cachedEntities == null)
      await _init();

    return _cachedEntities;
  }
  
  Future<List<ChapterItem>> searchAll(String homeSearchQuery) async {
    return (await findAll()).where((ci) => 
      ci.fullTitle.contains(homeSearchQuery) ||
      ci.cleanTitle.contains(homeSearchQuery)
    ).toList();
  }
  
  Future _init() async {
    final key = 'assets/data/chapters.json';

    String data = await rootBundle.loadString(key);
    
    _cachedEntities = json.decode(data).map<ChapterItem>(
      (pj) => ChapterItem.fromJson(pj)
    ).toList();

    print('Repository inited. (dataFileName: $key)');
  }
}
