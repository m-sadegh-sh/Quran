import 'package:Quran/enumerations/chapter_classification.dart';

class ChapterItem {
  final int id;
  final int order;
  final int partNumber;
  final int versesCount;
  final ChapterClassification classification;

  ChapterItem({
    this.id,
    this.order,
    this.partNumber,
    this.versesCount,
    this.classification
  });

  factory ChapterItem.fromJson(Map<String, dynamic> parsedJson) {
    return ChapterItem(
      id: parsedJson['id'],
      order: parsedJson['order'],
      partNumber: parsedJson['partNumber'],
      versesCount: parsedJson['versesCount'],
      classification: ChapterClassification.values.firstWhere((v) => v.toString() == parsedJson['classification'], orElse: () => null)
    );
  }
}
