import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/actions/app_action.dart';
import 'package:quran/actions/settings_action.dart';
import 'package:quran/actions/home_action.dart';
import 'package:quran/actions/chapter_details_action.dart';
import 'package:quran/selectors/settings_selector.dart';
import 'package:quran/selectors/home_selector.dart';
import 'package:quran/delegates/generators.dart';
import 'package:quran/items/drawer_item.dart';
import 'package:quran/items/action_item.dart';
import 'package:quran/items/action_child_item.dart';
import 'package:quran/items/tab_item.dart';

class HomeViewModel {
  final GeneratorWNP<String> homeOnGenerateTitle;
  final GeneratorWNP<String> homeOnGenerateAccountName;
  final GeneratorWNP<String> homeOnGenerateAccountEmail;
  final String homeAccountBackgroundImage;
  final GeneratorWNP<List<DrawerItem>> homeOnGenerateDrawerItems;
  final Function(BuildContext, DrawerItem) homeOnDrawerItemTapped;
  final GeneratorW1P<double, List<ActionItem>> homeOnGenerateActionItems;
  final Function(BuildContext, ActionItem) homeOnActionItemPressed;
  final Function(BuildContext, ActionChildItem) homeOnActionChildItemPressed;
  final GeneratorWNP<List<TabItem>> homeOnGenerateTabItems;
  final GeneratorWNP<List<Widget>> homeOnGenerateTabContents;
  final Function(BuildContext) homeOnFloatingActionButtonPressed;
  final double settingsThemeFontSize;
  
  HomeViewModel({
    this.homeOnGenerateTitle,
    this.homeOnGenerateAccountName,
    this.homeOnGenerateAccountEmail,
    this.homeAccountBackgroundImage,
    this.homeOnGenerateDrawerItems,
    this.homeOnDrawerItemTapped,
    this.homeOnGenerateActionItems,
    this.homeOnActionItemPressed,
    this.homeOnActionChildItemPressed,
    this.homeOnGenerateTabItems,
    this.homeOnGenerateTabContents,
    this.homeOnFloatingActionButtonPressed,
    this.settingsThemeFontSize
  });

  static HomeViewModel fromStore(Store<RootState> store) {
    final homeState = homeStateSelector(store.state);
    final settingsState = settingsStateSelector(store.state);

    return HomeViewModel(
      homeOnGenerateTitle: homeOnGenerateTitleSelector(homeState),
      homeOnGenerateAccountName: homeOnGenerateAccountNameSelector(homeState),
      homeOnGenerateAccountEmail: homeOnGenerateAccountEmailSelector(homeState),
      homeAccountBackgroundImage: homeAccountBackgroundImageSelector(homeState),
      homeOnGenerateDrawerItems: homeOnGenerateDrawerItemsSelector(homeState),
      homeOnDrawerItemTapped: (BuildContext context, DrawerItem drawerItem) {
        store.dispatch(HomeDrawerItemTappedAction(
          context: context,
          drawerItem: drawerItem,
        ));
      },
      homeOnGenerateActionItems: homeOnGenerateActionItemsSelector(homeState),
      homeOnActionItemPressed: (BuildContext context, ActionItem actionItem) {
        store.dispatch(HomeActionItemPressedAction(
          context: context,
          actionItem: actionItem,
        ));
      },
      homeOnActionChildItemPressed: (BuildContext context, ActionChildItem actionChildItem) {
        store.dispatch(HomeActionChildItemPressedAction(
          context: context,
          actionChildItem: actionChildItem,
        ));
      },
      homeOnGenerateTabItems: homeOnGenerateTabItemsSelector(homeState),
      homeOnGenerateTabContents: homeOnGenerateTabContentsSelector(homeState),
      homeOnFloatingActionButtonPressed: (BuildContext context) {
        store.dispatch(AppReloadInitialStateAction());
        store.dispatch(SettingsReloadInitialStateAction());
        store.dispatch(HomeReloadInitialStateAction());
        store.dispatch(ChapterDetailsReloadInitialStateAction());
      },
      settingsThemeFontSize: settingsThemeFontSizeSelector(settingsState)
    );
  }
}
