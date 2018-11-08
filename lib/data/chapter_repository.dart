import 'dart:async';

import 'package:quran/data/repository_base.dart';
import 'package:quran/items/chapter_item.dart';

class ChapterRepository extends RepositoryBase<ChapterItem> {
  static ChapterRepository _instance;

  ChapterRepository.protected();

  factory ChapterRepository() {
    if (_instance == null) {
      _instance = ChapterRepository._private();
      print('ChapterRepository created.');
    }

    return _instance;
  }

  ChapterRepository._private();

  @override
  String get dataFileName => 'chapters';

  @override
  ChapterItem fromJson(dynamic parsedJson) => ChapterItem.fromJson(parsedJson);

  Future<ChapterItem> findOneById(int id) async {
    return (await findAll()).singleWhere((ci) => ci.id == id);
  }
}
