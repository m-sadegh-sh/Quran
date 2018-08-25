import 'package:flutter/material.dart';

import 'package:Quran/items/drawer_item.dart';
import 'package:Quran/items/action_item.dart';

class ChapterListDrawerItemTappedAction {
  final BuildContext context;
  final DrawerItem drawerItem;

  ChapterListDrawerItemTappedAction({
    this.context,
    this.drawerItem
  });
}

class ChapterListActionItemPressedAction {
  final BuildContext context;
  final ActionItem actionItem;

  ChapterListActionItemPressedAction({
    this.context,
    this.actionItem
  });
}