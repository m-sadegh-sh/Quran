import 'package:redux/redux.dart';

import 'package:Quran/states/chapter_list_state.dart';
import 'package:Quran/actions/chapter_list_action.dart';

final Reducer<ChapterListState> chapterReducer = combineReducers([
  TypedReducer<ChapterListState, ChapterListLoadAction>(_chapterListLoad),
  TypedReducer<ChapterListState, ChapterListLoadSucceededAction>(_chapterListLoadSucceeded),
  TypedReducer<ChapterListState, ChapterListLoadFailedAction>(_chapterListLoadFailed)
]);

ChapterListState _chapterListLoad(ChapterListState state, ChapterListLoadAction action) {
  state.chapterListLoading = true;
  state.chapterListLoadSucceeded = false;
  state.chapterListItems = List.unmodifiable([]);
  state.chapterListLoadFailed = false;
  state.chapterListLoadError = null;

  return state;
}

ChapterListState _chapterListLoadSucceeded(ChapterListState state, ChapterListLoadSucceededAction action) {
  state.chapterListLoading = false;
  state.chapterListLoadSucceeded = true;
  state.chapterListItems = action.chapterListItems;

  return state;
}

ChapterListState _chapterListLoadFailed(ChapterListState state, ChapterListLoadFailedAction action) {
  state.chapterListLoading = false;
  state.chapterListLoadFailed = true;
  state.chapterListLoadError = action.chapterListLoadError;

  return state;
}