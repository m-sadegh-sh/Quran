import 'package:redux/redux.dart';

import 'package:Quran/states/chapter_state.dart';
import 'package:Quran/actions/chapter_actions.dart';

final Reducer<ChapterState> chapterReducer = combineReducers([
  TypedReducer<ChapterState, LoadChapterListAction>(_loadChapterList),
  TypedReducer<ChapterState, ChapterListLoadSucceededAction>(_chapterListLoadSucceeded),
  TypedReducer<ChapterState, ChapterListLoadFailedAction>(_chapterListLoadFailed)
]);

ChapterState _loadChapterList(ChapterState state, LoadChapterListAction action) {
  state.chapterListLoading = true;
  state.chapterListLoadSucceeded = false;
  state.chapterList = List.unmodifiable([]);
  state.chapterListLoadFailed = false;
  state.chapterListLoadError = null;

  return state;
}

ChapterState _chapterListLoadSucceeded(ChapterState state, ChapterListLoadSucceededAction action) {
  state.chapterListLoading = false;
  state.chapterListLoadSucceeded = true;
  state.chapterList = action.chapterList;

  return state;
}

ChapterState _chapterListLoadFailed(ChapterState state, ChapterListLoadFailedAction action) {
  state.chapterListLoading = false;
  state.chapterListLoadFailed = true;
  state.chapterListLoadError = action.chapterListLoadError;

  return state;
}