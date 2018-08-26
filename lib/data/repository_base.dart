
import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class RepositoryBase<T> {
  List<T> _cachedEntities;

  T fromJson(dynamic parsedJson) {
    return null;
  }

  Future<bool> init(String dataFileName) async {
    final key = 'assets/data/$dataFileName.json';

    String data = await rootBundle.loadString(key);
    _cachedEntities = json.decode(data).map<T>(fromJson).toList();

    return true;
  }

  Future<List<T>> list() async {
    return _cachedEntities;
  }
}
