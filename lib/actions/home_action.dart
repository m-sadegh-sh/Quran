import 'package:flutter/material.dart';

import 'package:quran/states/home_state.dart';
import 'package:quran/items/drawer_item.dart';
import 'package:quran/items/action_item.dart';
import 'package:quran/items/action_child_item.dart';

class HomeReloadInitialStateAction { }

class HomeReloadInitialStateSucceededAction {
  final HomeState homeState;

  HomeReloadInitialStateSucceededAction({
    this.homeState
  });
}

class HomeReloadInitialStateFailedAction { }

class HomeDrawerItemTappedAction {
  final BuildContext context;
  final DrawerItem drawerItem;

  HomeDrawerItemTappedAction({
    this.context,
    this.drawerItem
  });
}

class HomeActionItemPressedAction {
  final BuildContext context;
  final ActionItem actionItem;

  HomeActionItemPressedAction({
    this.context,
    this.actionItem
  });
}

class HomeActionChildItemPressedAction {
  final BuildContext context;
  final ActionChildItem actionChildItem;

  HomeActionChildItemPressedAction({
    this.context,
    this.actionChildItem
  });
}
