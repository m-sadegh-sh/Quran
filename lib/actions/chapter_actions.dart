import 'package:Quran/models/chapter_model.dart';

class LoadChapterListAction { }

class ChapterListLoadSucceededAction {
  final List<ChapterModel> chapterList;

  ChapterListLoadSucceededAction({this.chapterList});
}

class ChapterListLoadFailedAction {
  final String chapterListLoadError;

  ChapterListLoadFailedAction({this.chapterListLoadError});
}