import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:page_transition/page_transition.dart';

import 'package:quran/states/home.state.dart';
import 'package:quran/actions/home.action.dart';

final Reducer<HomeState> homeReducer = combineReducers([
  TypedReducer<HomeState, HomeReloadInitialStateSucceededAction>(_homeReloadInitialStateSucceeded),
  TypedReducer<HomeState, HomeSearchQueryChangedAction>(_homeSearchQueryChanged),
  TypedReducer<HomeState, HomeDrawerItemTappedAction>(_homeDrawerItemTapped),
  TypedReducer<HomeState, HomeActionItemPressedAction>(_homeActionItemPressed),
  TypedReducer<HomeState, HomeActionChildItemPressedAction>(_homeActionChildItemPressed)
]);

HomeState _homeReloadInitialStateSucceeded(HomeState state, HomeReloadInitialStateSucceededAction action) {
  return action.homeState;
}

HomeState _homeSearchQueryChanged(HomeState state, HomeSearchQueryChangedAction action) {
  return state.copyWith(
    homeSearchQuery: action.homeSearchChangedQuery,
    homeSearchQueryController: new TextEditingController(text: action.homeSearchChangedQuery)
  );
}

HomeState _homeDrawerItemTapped(HomeState state, HomeDrawerItemTappedAction action) {
  Navigator.of(action.context)
    .push(PageTransition(
      curve: Curves.easeInOutQuart,
      type: PageTransitionType.rightToLeft,
      child: action.homeDrawerItem.onGenerateChild(action.context)
    ));

  return state;
}

HomeState _homeActionItemPressed(HomeState state, HomeActionItemPressedAction action) {
  if (action.homeActionItem.onGenerateChild != null) {
    Navigator.of(action.context)
      .push(PageTransition(
        curve: Curves.easeInOutQuart,
        type: PageTransitionType.rightToLeft,
        child: action.homeActionItem.onGenerateChild(action.context)
      ));
  } else if (action.homeActionItem.onUpdateState != null) {
    return action.homeActionItem.onUpdateState(action.context, state);
  }

  return state;
}

HomeState _homeActionChildItemPressed(HomeState state, HomeActionChildItemPressedAction action) {
  if (action.homeOnGenerateChild != null)
    Navigator.of(action.context)
      .push(PageTransition(
        curve: Curves.easeInOutQuart,
        type: PageTransitionType.rightToLeft,
        child: action.homeOnGenerateChild(action.context)
      ));
      
  return state;
}