
import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

abstract class RepositoryBase<T> {
  List<T> _cachedEntities;

  String get dataFileName;
  T fromJson(dynamic parsedJson);

  Future<bool> init() async {
    final key = 'assets/data/$dataFileName.json';

    String data = await rootBundle.loadString(key);
    _cachedEntities = json.decode(data).map<T>(fromJson).toList();

    print('Repository inited. (dataFileName: $dataFileName)');

    return true;
  }

  Future<List<T>> findAll() async {
    if (_cachedEntities == null)
      await init();

    return _cachedEntities;
  }
}
