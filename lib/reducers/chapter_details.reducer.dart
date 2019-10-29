import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:page_transition/page_transition.dart';

import 'package:quran/states/chapter_details.state.dart';
import 'package:quran/actions/chapter_details.action.dart';
import 'package:quran/items/verse.item.dart';

final Reducer<ChapterDetailsState> chapterDetailsReducer = combineReducers([
  TypedReducer<ChapterDetailsState, ChapterDetailsReloadInitialStateSucceededAction>(_chapterDetailsReloadInitialStateSucceeded),
  TypedReducer<ChapterDetailsState, ChapterDetailsLoadAction>(_chapterDetailsLoad),
  TypedReducer<ChapterDetailsState, ChapterDetailsLoadSucceededAction>(_chapterDetailsLoadSucceeded),
  TypedReducer<ChapterDetailsState, ChapterDetailsLoadFailedAction>(_chapterDetailsLoadFailed),
  TypedReducer<ChapterDetailsState, ChapterDetailsActionItemPressedAction>(_chapterDetailsActionItemPressed),
  TypedReducer<ChapterDetailsState, ChapterDetailsActionChildItemPressedAction>(_chapterDetailsActionChildItemPressed)
]);

ChapterDetailsState _chapterDetailsReloadInitialStateSucceeded(ChapterDetailsState state, ChapterDetailsReloadInitialStateSucceededAction action) {
  return action.chapterDetailsState;
}

ChapterDetailsState _chapterDetailsLoad(ChapterDetailsState state, ChapterDetailsLoadAction action) {
  return state.copyWith(
    chapterDetailsChapterItem: action.chapterDetailsChapterItem,
    chapterDetailsLoading: true,
    chapterDetailsLoadSucceeded: false,
    chapterDetailsVerseItems: List<VerseItem>.unmodifiable([]),
    chapterDetailsLoadFailed: false,
    chapterDetailsLoadError: null
  );
}

ChapterDetailsState _chapterDetailsLoadSucceeded(ChapterDetailsState state, ChapterDetailsLoadSucceededAction action) {
  return state.copyWith(
    chapterDetailsLoading: false,
    chapterDetailsLoadSucceeded: true,
    chapterDetailsVerseItems: List<VerseItem>.unmodifiable(action.chapterDetailsVerseItems)
  );
}

ChapterDetailsState _chapterDetailsLoadFailed(ChapterDetailsState state, ChapterDetailsLoadFailedAction action) {
  return state.copyWith(
    chapterDetailsLoading: false,
    chapterDetailsLoadFailed: true,
    chapterDetailsLoadError: action.chapterDetailsLoadError
  );
}

ChapterDetailsState _chapterDetailsActionItemPressed(ChapterDetailsState state, ChapterDetailsActionItemPressedAction action) {
  Navigator.of(action.context)
    .push(PageTransition(
      curve: Curves.easeInOutQuart,
      type: PageTransitionType.rightToLeft,
      child: action.chapterDetailsOnGenerateChild(action.context)
    ));

  return state;
}

ChapterDetailsState _chapterDetailsActionChildItemPressed(ChapterDetailsState state, ChapterDetailsActionChildItemPressedAction action) {
  if (action.chapterDetailsOnGenerateChild != null)
    Navigator.of(action.context).push(PageTransition(
      curve: Curves.easeInOutQuart,
      type: PageTransitionType.rightToLeft,
      child: action.chapterDetailsOnGenerateChild(action.context)
    ));

  return state;
}
