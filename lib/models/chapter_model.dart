import 'package:Quran/enumerations/chapter_classification.dart';

class ChapterModel {
  final int id;
  final int order;
  final int partNumber;
  final int versesCount;
  final ChapterClassification classification;

  ChapterModel({this.id, this.order, this.partNumber, this.versesCount, this.classification});

  factory ChapterModel.fromJson(Map<String, dynamic> parsedJson) {
    return ChapterModel(
      id: parsedJson['id'],
      order: parsedJson['order'],
      partNumber: parsedJson['partNumber'],
      versesCount: parsedJson['versesCount'],
      classification: ChapterClassification.values.firstWhere((v) => v.toString() == parsedJson['classification'], orElse: () => null)
    );
  }
}
