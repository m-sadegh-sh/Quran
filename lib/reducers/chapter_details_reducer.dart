import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/chapter_details_state.dart';
import 'package:Quran/actions/chapter_details_action.dart';

final Reducer<ChapterDetailsState> chapterDetailsReducer = combineReducers([
  TypedReducer<ChapterDetailsState, ChapterDetailsLoadAction>(_chapterDetailsLoad),
  TypedReducer<ChapterDetailsState, ChapterDetailsLoadSucceededAction>(_chapterDetailsLoadSucceeded),
  TypedReducer<ChapterDetailsState, ChapterDetailsLoadFailedAction>(_chapterDetailsLoadFailed)
]);

ChapterDetailsState _chapterDetailsLoad(ChapterDetailsState state, ChapterDetailsLoadAction action) {
  return state.copyWith(
    chapterDetailsItemId: action.chapterDetailsItemId,
    chapterDetailsLoading: true,
    chapterDetailsLoadSucceeded: false,
    chapterDetailsItem: null,
    chapterDetailsLoadFailed: false,
    chapterDetailsLoadError: null
  );
}

ChapterDetailsState _chapterDetailsLoadSucceeded(ChapterDetailsState state, ChapterDetailsLoadSucceededAction action) {
  return state.copyWith(
    chapterDetailsLoading: false,
    chapterDetailsLoadSucceeded: true,
    chapterDetailsItem: action.chapterDetailsItem
  );
}

ChapterDetailsState _chapterDetailsLoadFailed(ChapterDetailsState state, ChapterDetailsLoadFailedAction action) {
  return state.copyWith(
    chapterDetailsLoading: false,
    chapterDetailsLoadFailed: true,
    chapterDetailsLoadError: action.chapterDetailsLoadError
  );
}