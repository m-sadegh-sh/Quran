import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/home_state.dart';
import 'package:Quran/actions/home_action.dart';

final Reducer<HomeState> homeReducer = combineReducers([
  TypedReducer<HomeState, ChapterListDrawerItemTappedAction>(_chapterListDrawerItemTapped),
  TypedReducer<HomeState, ChapterListActionItemPressedAction>(_chapterListActionItemPressed)
]);

HomeState _chapterListDrawerItemTapped(HomeState state, ChapterListDrawerItemTappedAction action) {
  Navigator.pop(action.context);
  Navigator.pushNamed(action.context, action.drawerItem.routeName);

  return state;
}

HomeState _chapterListActionItemPressed(HomeState state, ChapterListActionItemPressedAction action) {
  Navigator.pushNamed(action.context, action.actionItem.routeName);

  return state;
}
