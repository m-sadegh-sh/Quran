import 'dart:async';

import 'package:quran/data/repository_base.dart';
import 'package:quran/items/verse_item.dart';

class VerseRepository extends RepositoryBase<VerseItem> {
  static final VerseRepository _instance = VerseRepository._private();

  factory VerseRepository() {
    return _instance;
  }

  VerseRepository._private();

  @override
  String get dataFileName => 'verses';

  @override
  VerseItem fromJson(dynamic parsedJson) => VerseItem.fromJson(parsedJson);
  
  Future<VerseItem> findOneById(int id) async {
    return (await findAll()).singleWhere((vi) => vi.id == id);
  }

  Future<List<VerseItem>> findAllByChapterId(int chapterId) async {
    return (await findAll()).where((vi) => vi.chapterId == chapterId).toList();
  }
}
