import 'dart:async';

import 'package:quran/data/repository_base.dart';
import 'package:quran/items/chapter_item.dart';

class ChapterRepository extends RepositoryBase<ChapterItem> {
  static final ChapterRepository _instance = ChapterRepository._private();

  factory ChapterRepository() {
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
