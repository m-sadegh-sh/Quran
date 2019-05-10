import 'dart:async';
import 'package:kiwi/kiwi.dart';

import 'package:quran/repositories/chapter_translation.repository.dart';
import 'package:quran/enumerations/chapter_revelation_place.dart';
import 'package:quran/items/chapter_translation.item.dart';

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
    return await Container().resolve<ChapterTranslationRepository>().findOneByChapterId(id, translatorId);
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
