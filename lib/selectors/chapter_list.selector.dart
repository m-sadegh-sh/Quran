import 'package:quran/states/root.state.dart';
import 'package:quran/states/chapter_list.state.dart';
import 'package:quran/items/chapter.item.dart';

ChapterListState chapterListStateSelector(RootState state) => state.chapterListState;
bool chapterListLoadingSelector(ChapterListState state) => state.chapterListLoading;
bool chapterListLoadSucceededSelector(ChapterListState state) => state.chapterListLoadSucceeded;
List<ChapterItem> chapterListItemsSelector(ChapterListState state) => state.chapterListItems;
bool chapterListLoadFailedSelector(ChapterListState state) => state.chapterListLoadFailed;
String chapterListLoadErrorSelector(ChapterListState state) => state.chapterListLoadError;
