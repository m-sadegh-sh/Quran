import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/items/verse_item.dart';

class VerseRepository {
  List<VerseItem> _cachedEntities;

  VerseRepository() {
    _init();
  }

  Future<List<VerseItem>> findAll() async {
    return _cachedEntities;
  }
  
  Future<List<VerseItem>> findAllByChapterId(int chapterId) async {
    await Future.delayed(Duration(seconds: 1));

    return (await findAll()).where((vi) => vi.chapterId == chapterId).toList();
  }

  Future<bool> _init() async {
    final key = 'assets/data/verses.json';

    String data = await rootBundle.loadString(key);
    
    _cachedEntities = json.decode(data).map<VerseItem>(
      (pj) => VerseItem.fromJson(pj)
    ).toList();

    print('Repository inited. (dataFileName: $key)');

    return true;
  }
}
