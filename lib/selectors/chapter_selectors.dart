import 'package:Quran/states/app_state.dart';
import 'package:Quran/states/chapter_state.dart';
import 'package:Quran/models/chapter_model.dart';

ChapterState chapterSelector(AppState state) => state.chapter;
bool chapterListLoadingSelector(ChapterState state) => state.chapterListLoading;
bool chapterListLoadSucceededSelector(ChapterState state) => state.chapterListLoadSucceeded;
List<ChapterModel> chapterListSelector(ChapterState state) => state.chapterList;
bool chapterListLoadFailedSelector(ChapterState state) => state.chapterListLoadFailed;
String chapterListLoadErrorSelector(ChapterState state) => state.chapterListLoadError;
