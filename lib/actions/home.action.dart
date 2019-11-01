import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/enumerations/action_child_item_type.dart';
import 'package:quran/items/drawer.item.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/states/root.state.dart';

class HomeSearchOpenAction { }

class HomeSearchCloseAction {
  final int settingsTranslatorId;

  HomeSearchCloseAction({
    this.settingsTranslatorId
  });
}

class HomeSearchQueryChangingAction {
  final BuildContext context;
  final String homeSearchChangingQuery;
  final int settingsTranslatorId;

  HomeSearchQueryChangingAction({
    this.context,
    this.homeSearchChangingQuery,
    this.settingsTranslatorId
  });
}

class HomeSearchQueryChangeSucceededAction {
  final String homeSearchChangedQuery;

  HomeSearchQueryChangeSucceededAction({
    this.homeSearchChangedQuery
  });
}

class HomeDrawerItemTappedAction {
  final BuildContext context;
  final DrawerItem homeDrawerItem;

  HomeDrawerItemTappedAction({
    this.context,
    this.homeDrawerItem
  });
}

class HomeActionItemPressedAction {
  final BuildContext context;
  final Store<RootState> store;
  final ActionItem homeActionItem;

  HomeActionItemPressedAction({
    this.context,
    this.store,
    this.homeActionItem
  });
}

class HomeActionChildItemPressedAction {
  final BuildContext context;
  final GeneratorWNP<Widget> homeOnGenerateChild;
  final ActionChildItemType homeActionChildItemType;
  final Object homeValue;

  HomeActionChildItemPressedAction({
    this.context,
    this.homeOnGenerateChild,
    this.homeActionChildItemType,
    this.homeValue
  });
}
