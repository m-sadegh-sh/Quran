import 'package:flutter/material.dart';

import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/enumerations/action_child_item_type.dart';
import 'package:quran/states/home.state.dart';
import 'package:quran/items/drawer.item.dart';
import 'package:quran/items/action.item.dart';

class HomeReloadInitialStateAction { }

class HomeReloadInitialStateSucceededAction {
  final HomeState homeState;

  HomeReloadInitialStateSucceededAction({
    this.homeState
  });
}

class HomeReloadInitialStateFailedAction { }

class HomeSearchQueryChangingAction {
  final BuildContext context;
  final int settingTranslatorId;
  final String homeSearchChangingQuery;

  HomeSearchQueryChangingAction({
    this.context,
    this.settingTranslatorId,
    this.homeSearchChangingQuery
  });
}

class HomeSearchQueryChangeSucceededAction {
  final String homeSearchChangedQuery;

  HomeSearchQueryChangeSucceededAction({
    this.homeSearchChangedQuery
  });
}

class HomeSearchQueryChangeFailedAction { }

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
  final ActionItem<HomeState> homeActionItem;

  HomeActionItemPressedAction({
    this.context,
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
