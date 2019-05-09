import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/items/verse_item.dart';

class VerseRepository {
  static List<VerseItem> _cachedEntities;

  static final VerseRepository _instance = VerseRepository._private();

  VerseRepository._private() {
    _init();
  }

  factory VerseRepository() {
    return _instance;
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
    _cachedEntities = json.decode(data).map<VerseItem>(_fromJson).toList();

    print('Repository inited. (dataFileName: $key)');

    return true;
  }

  VerseItem _fromJson(dynamic parsedJson) => VerseItem.fromJson(parsedJson);
}
