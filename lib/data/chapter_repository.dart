import 'dart:async';
import 'package:Quran/data/data_context.dart';
import 'package:Quran/models/chapter_model.dart';

class ChapterRepository {
  final DataContext _dataContext;

  ChapterRepository(this._dataContext);

  void insertChapter(ChapterModel chapter) async {
    var database = await _dataContext.getDatabase;

    await database.transaction((txn) async {
      return await txn.rawInsert(
        'INSERT INTO Chapters (ArabicTitle, PersianTitle, EnglishTitle, PartNumber, VerseCount, DescentPlace) ' +
        'VALUES (\'${chapter.arabicTitle}\', \'${chapter.persianTitle}\', \'${chapter.englishTitle}\', ${chapter.partNumber}, ${chapter.versesCount}, ${chapter.descentPlace})');
    });
  }

  Future<List<ChapterModel>> getChapters() async {
    var database = await _dataContext.getDatabase;

    List<Map> records = await database.rawQuery('SELECT Id, ArabicTitle, PersianTitle, EnglishTitle, PartNumber, VerseCount, DescentPlace FROM Chapters');
    List<ChapterModel> chapters = new List();

    for (var record in records) {
      chapters.add(
        new ChapterModel(
          record["Id"],
          record["ArabicTitle"],
          record["PersianTitle"],
          record["EnglishTitle"],
          record["PartNumber"],
          record["VerseCount"],
          record["DescentPlace"]
        )
      );
    }
    
    return chapters;
  }
}
