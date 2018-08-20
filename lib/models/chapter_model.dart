import 'package:Quran/enumerations/descent_place.dart';

class ChapterModel {
  final int id;
  final String arabicTitle;
  final String persianTitle;
  final String englishTitle;
  final int partNumber;
  final int versesCount;
  final DescentPlace descentPlace;

  ChapterModel(this.id, this.arabicTitle, this.persianTitle, this.englishTitle, this.partNumber, this.versesCount, this.descentPlace);
  
  @override
  String toString() {
    return arabicTitle;
  }
}
