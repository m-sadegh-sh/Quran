import 'package:Quran/enumerations/chapter_classification.dart';

class ChapterItem {
  final int id;
  final String title;
  final int order;
  final int partNumber;
  final int versesCount;
  final ChapterClassification classification;

  ChapterItem({
    this.id,
    this.title,
    this.order,
    this.partNumber,
    this.versesCount,
    this.classification
  });

  factory ChapterItem.fromJson(dynamic parsedJson) {
    return ChapterItem(
      id: parsedJson['id'],
      title: parsedJson['title'],
      order: parsedJson['order'],
      partNumber: parsedJson['partNumber'],
      versesCount: parsedJson['versesCount'],
      classification: ChapterClassification.values.firstWhere((v) => v.toString() == parsedJson['classification'], orElse: () => null)
    );
  }
}
