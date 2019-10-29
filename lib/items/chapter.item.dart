import 'package:quran/enumerations/chapter_revelation_place.dart';

class ChapterItem {
  final int id;
  final String fullTitle;
  final String cleanTitle;
  final int order;
  final int partNumber;
  final int versesCount;
  final ChapterRevelationPlace revelationPlace;
  final String translatedTitle;

  ChapterItem({
    this.id,
    this.fullTitle,
    this.cleanTitle,
    this.order,
    this.partNumber,
    this.versesCount,
    this.revelationPlace,
    this.translatedTitle
  });

  factory ChapterItem.toTranslated(ChapterItem chapter, String translatedTitle) {
    return ChapterItem(
      id: chapter.id,
      fullTitle: chapter.fullTitle,
      cleanTitle: chapter.cleanTitle,
      order: chapter.order,
      partNumber: chapter.partNumber,
      versesCount: chapter.versesCount,
      revelationPlace: chapter.revelationPlace,
      translatedTitle: translatedTitle
    );
  }

  factory ChapterItem.fromJson(dynamic parsedJson) {
    return ChapterItem(
      id: parsedJson['id'],
      fullTitle: parsedJson['fullTitle'],
      cleanTitle: parsedJson['cleanTitle'],
      order: parsedJson['order'],
      partNumber: parsedJson['partNumber'],
      versesCount: parsedJson['versesCount'],
      revelationPlace: ChapterRevelationPlace.values.firstWhere((v) => v.toString() == parsedJson['revelationPlace'])
    );
  }
}
