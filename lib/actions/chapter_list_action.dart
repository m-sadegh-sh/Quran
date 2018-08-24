import 'package:Quran/items/chapter_item.dart';

class LoadChapterListAction { }

class ChapterListLoadSucceededAction {
  final List<ChapterItem> chapterList;

  ChapterListLoadSucceededAction({this.chapterList});
}

class ChapterListLoadFailedAction {
  final String chapterListLoadError;

  ChapterListLoadFailedAction({this.chapterListLoadError});
}

class ChapterListItemTappedAction {
  final ChapterItem chapterItem;

  ChapterListItemTappedAction({this.chapterItem});
}
