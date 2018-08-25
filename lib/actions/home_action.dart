import 'package:flutter/material.dart';

import 'package:Quran/items/drawer_item.dart';
import 'package:Quran/items/action_item.dart';

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