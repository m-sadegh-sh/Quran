import 'package:Quran/items/chapter_item.dart';

class ChapterListLoadAction { }

class ChapterListLoadSucceededAction {
  final List<ChapterItem> chapterListItems;

  ChapterListLoadSucceededAction({this.chapterListItems});
}

class ChapterListLoadFailedAction {
  final String chapterListLoadError;

  ChapterListLoadFailedAction({this.chapterListLoadError});
}

class ChapterListItemTappedAction {
  final ChapterItem chapterItem;

  ChapterListItemTappedAction({this.chapterItem});
}
