import 'dart:async';

import 'package:quran/data/chapter_translation_repository.dart';
import 'package:quran/enumerations/chapter_revelation_place.dart';
import 'package:quran/items/chapter_translation_item.dart';

class ChapterItem {
  final int id;
  final String title;
  final int order;
  final int partNumber;
  final int versesCount;
  final ChapterRevelationPlace revelationPlace;

  ChapterItem({
    this.id,
    this.title,
    this.order,
    this.partNumber,
    this.versesCount,
    this.revelationPlace
  });

  Future<ChapterTranslationItem> translation(int translatorId) async {
    return await ChapterTranslationRepository().findOneByChapterId(id, translatorId);
  }

  factory ChapterItem.fromJson(dynamic parsedJson) {
    return ChapterItem(
      id: parsedJson['id'],
      title: parsedJson['title'],
      order: parsedJson['order'],
      partNumber: parsedJson['partNumber'],
      versesCount: parsedJson['versesCount'],
      revelationPlace: ChapterRevelationPlace.values.firstWhere((v) => v.toString() == parsedJson['revelationPlace'])
    );
  }
}
