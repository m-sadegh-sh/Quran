import 'package:Quran/states/app_state.dart';
import 'package:Quran/states/chapter_list_state.dart';
import 'package:Quran/items/chapter_item.dart';

ChapterListState chapterSelector(AppState state) => state.chapter;
bool chapterListLoadingSelector(ChapterListState state) => state.chapterListLoading;
bool chapterListLoadSucceededSelector(ChapterListState state) => state.chapterListLoadSucceeded;
List<ChapterItem> chapterListSelector(ChapterListState state) => state.chapterList;
bool chapterListLoadFailedSelector(ChapterListState state) => state.chapterListLoadFailed;
String chapterListLoadErrorSelector(ChapterListState state) => state.chapterListLoadError;
