import 'package:Quran/enumerations/chapter_classification.dart';

class ChapterModel {
  final int id;
  final int order;
  final int partNumber;
  final int versesCount;
  final ChapterClassification classification;

  ChapterModel({this.id, this.order, this.partNumber, this.versesCount, this.classification});
}
