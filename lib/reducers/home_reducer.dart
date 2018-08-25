import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/home_state.dart';
import 'package:Quran/actions/home_action.dart';

final Reducer<HomeState> homeReducer = combineReducers([
  TypedReducer<HomeState, HomeDrawerItemTappedAction>(_homeDrawerItemTapped),
  TypedReducer<HomeState, HomeActionItemPressedAction>(_homeActionItemPressed)
]);

HomeState _homeDrawerItemTapped(HomeState state, HomeDrawerItemTappedAction action) {
  Navigator.pop(action.context);
  Navigator.pushNamed(action.context, action.drawerItem.routeName);

  return state;
}

HomeState _homeActionItemPressed(HomeState state, HomeActionItemPressedAction action) {
  Navigator.pushNamed(action.context, action.actionItem.routeName);

  return state;
}
