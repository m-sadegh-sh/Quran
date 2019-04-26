import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/home_state.dart';
import 'package:quran/actions/home_action.dart';

final Reducer<HomeState> homeReducer = combineReducers([
  TypedReducer<HomeState, HomeReloadInitialStateSucceededAction>(_homeReloadInitialStateSucceeded),
  TypedReducer<HomeState, HomeDrawerItemTappedAction>(_homeDrawerItemTapped),
  TypedReducer<HomeState, HomeActionItemPressedAction>(_homeActionItemPressed)
]);

HomeState _homeReloadInitialStateSucceeded(HomeState state, HomeReloadInitialStateSucceededAction action) {
  return action.homeState;
}

HomeState _homeDrawerItemTapped(HomeState state, HomeDrawerItemTappedAction action) {
  Navigator.of(action.context)
    .pushNamed(action.drawerItem.routeName);

  return state;
}

HomeState _homeActionItemPressed(HomeState state, HomeActionItemPressedAction action) {
  Navigator.of(action.context)
    .pushNamed(action.actionItem.routeName);

  return state;
}
