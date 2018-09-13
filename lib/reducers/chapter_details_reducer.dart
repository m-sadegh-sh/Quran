import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/chapter_details_state.dart';
import 'package:Quran/actions/chapter_details_action.dart';
import 'package:Quran/items/verse_item.dart';

final Reducer<ChapterDetailsState> chapterDetailsReducer = combineReducers([
  TypedReducer<ChapterDetailsState, ChapterDetailsActionItemPressedAction>(_chapterDetailsActionItemPressed),
  TypedReducer<ChapterDetailsState, ChapterDetailsLoadAction>(_chapterDetailsLoad),
  TypedReducer<ChapterDetailsState, ChapterDetailsLoadSucceededAction>(_chapterDetailsLoadSucceeded),
  TypedReducer<ChapterDetailsState, ChapterDetailsLoadFailedAction>(_chapterDetailsLoadFailed)
]);

ChapterDetailsState _chapterDetailsActionItemPressed(ChapterDetailsState state, ChapterDetailsActionItemPressedAction action) {
  Navigator.of(action.context)
    .pushNamed(action.chapterDetailsActionItem.routeName);

  return state;
}

ChapterDetailsState _chapterDetailsLoad(ChapterDetailsState state, ChapterDetailsLoadAction action) {
  return state.copyWith(
    chapterDetailsChapterItemId: action.chapterDetailsChapterItemId,
    chapterDetailsLoading: true,
    chapterDetailsLoadSucceeded: false,
    chapterDetailsChapterItem: null,
    chapterDetailsVerseItems: List.unmodifiable<VerseItem>([]),
    chapterDetailsLoadFailed: false,
    chapterDetailsLoadError: null
  );
}

ChapterDetailsState _chapterDetailsLoadSucceeded(ChapterDetailsState state, ChapterDetailsLoadSucceededAction action) {
  return state.copyWith(
    chapterDetailsLoading: false,
    chapterDetailsLoadSucceeded: true,
    chapterDetailsChapterItem: action.chapterDetailsChapterItem,
    chapterDetailsVerseItems: List.unmodifiable<VerseItem>(action.chapterDetailsVerseItems)
  );
}

ChapterDetailsState _chapterDetailsLoadFailed(ChapterDetailsState state, ChapterDetailsLoadFailedAction action) {
  return state.copyWith(
    chapterDetailsLoading: false,
    chapterDetailsLoadFailed: true,
    chapterDetailsLoadError: action.chapterDetailsLoadError
  );
}