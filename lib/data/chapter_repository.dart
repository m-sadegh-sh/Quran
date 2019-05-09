import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/items/chapter_item.dart';

class ChapterRepository {
  static List<ChapterItem> _cachedEntities;

  static final ChapterRepository _instance = ChapterRepository._private();

  ChapterRepository._private() {
    _init();
  }

  factory ChapterRepository() {
    return _instance;
  }

  Future<List<ChapterItem>> findAll() async {
    await Future.delayed(Duration(seconds: 3));

    return _cachedEntities;
  }
  
  Future<bool> _init() async {
    final key = 'assets/data/chapters.json';

    String data = await rootBundle.loadString(key);
    _cachedEntities = json.decode(data).map<ChapterItem>(_fromJson).toList();

    print('Repository inited. (dataFileName: $key)');

    return true;
  }

  ChapterItem _fromJson(dynamic parsedJson) => ChapterItem.fromJson(parsedJson);
}
