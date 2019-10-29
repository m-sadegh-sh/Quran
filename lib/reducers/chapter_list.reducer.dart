import 'package:redux/redux.dart';

import 'package:quran/states/chapter_list.state.dart';
import 'package:quran/actions/chapter_list.action.dart';
import 'package:quran/items/chapter.item.dart';

final Reducer<ChapterListState> chapterListReducer = combineReducers([
  TypedReducer<ChapterListState, ChapterListLoadAction>(_chapterListLoad),
  TypedReducer<ChapterListState, ChapterListLoadSucceededAction>(_chapterListLoadSucceeded),
  TypedReducer<ChapterListState, ChapterListLoadFailedAction>(_chapterListLoadFailed)
]);

ChapterListState _chapterListLoad(ChapterListState state, ChapterListLoadAction action) {
  return state.copyWith(
    chapterListLoading: true,
    chapterListLoadSucceeded: false,
    chapterListItems: List<ChapterItem>.unmodifiable([]),
    chapterListLoadFailed: false,
    chapterListLoadError: null
  );
}

ChapterListState _chapterListLoadSucceeded(ChapterListState state, ChapterListLoadSucceededAction action) {
  return state.copyWith(
    chapterListLoading: false,
    chapterListLoadSucceeded: true,
    chapterListItems: List<ChapterItem>.unmodifiable(action.chapterListItems)
  );
}

ChapterListState _chapterListLoadFailed(ChapterListState state, ChapterListLoadFailedAction action) {
  return state.copyWith(
    chapterListLoading: false,
    chapterListLoadFailed: true,
    chapterListLoadError: action.chapterListLoadError
  );
}
