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
        'INSERT INTO Chapters (Order, PartNumber, VersesCount, Classification) ' +
        'VALUES (${chapter.order}, ${chapter.partNumber}, ${chapter.versesCount}, ${chapter.classification})');
    });
  }

  Future<List<ChapterModel>> getChapters() async {
    var database = await _dataContext.getDatabase;

    List<Map> records = await database.rawQuery('SELECT Id, Order, PartNumber, VerseCount, Classification FROM Chapters');
    List<ChapterModel> chapters = new List();

    for (var record in records) {
      chapters.add(
        new ChapterModel(
          id: record["Id"],
          order: record["Order"],
          partNumber: record["PartNumber"],
          versesCount: record["VersesCount"],
          classification: record["classification"]
        )
      );
    }
    
    return chapters;
  }
}
