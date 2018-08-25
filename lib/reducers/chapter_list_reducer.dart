import 'package:redux/redux.dart';

import 'package:Quran/states/chapter_list_state.dart';
import 'package:Quran/actions/chapter_list_action.dart';

final Reducer<ChapterListState> chapterListReducer = combineReducers([
  TypedReducer<ChapterListState, ChapterListLoadAction>(_chapterListLoad),
  TypedReducer<ChapterListState, ChapterListLoadSucceededAction>(_chapterListLoadSucceeded),
  TypedReducer<ChapterListState, ChapterListLoadFailedAction>(_chapterListLoadFailed)
]);

ChapterListState _chapterListLoad(ChapterListState state, ChapterListLoadAction action) {
  return state.copyWith(
    chapterListLoading: true,
    chapterListLoadSucceeded: false,
    chapterListItems: List.unmodifiable([]),
    chapterListLoadFailed: false,
    chapterListLoadError: null
  );
}

ChapterListState _chapterListLoadSucceeded(ChapterListState state, ChapterListLoadSucceededAction action) {
  return state.copyWith(
    chapterListLoading: false,
    chapterListLoadSucceeded: true,
    chapterListItems: action.chapterListItems
  );
}

ChapterListState _chapterListLoadFailed(ChapterListState state, ChapterListLoadFailedAction action) {
  return state.copyWith(
    chapterListLoading: false,
    chapterListLoadFailed: true,
    chapterListLoadError: action.chapterListLoadError
  );
}