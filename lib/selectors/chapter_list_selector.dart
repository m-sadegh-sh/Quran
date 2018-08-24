import 'package:Quran/states/root_state.dart';
import 'package:Quran/states/chapter_list_state.dart';
import 'package:Quran/items/chapter_item.dart';

ChapterListState chapterListStateSelector(RootState state) => state.chapterListState;
bool chapterListLoadingSelector(ChapterListState state) => state.chapterListLoading;
bool chapterListLoadSucceededSelector(ChapterListState state) => state.chapterListLoadSucceeded;
List<ChapterItem> chapterListItemsSelector(ChapterListState state) => state.chapterListItems;
bool chapterListLoadFailedSelector(ChapterListState state) => state.chapterListLoadFailed;
String chapterListLoadErrorSelector(ChapterListState state) => state.chapterListLoadError;
