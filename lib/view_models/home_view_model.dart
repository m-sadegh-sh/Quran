import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/actions/app_action.dart';
import 'package:quran/actions/home_action.dart';
import 'package:quran/selectors/home_selector.dart';
import 'package:quran/delegates/generate_with_context.dart';
import 'package:quran/items/drawer_item.dart';
import 'package:quran/items/action_item.dart';
import 'package:quran/items/action_child_item.dart';
import 'package:quran/items/tab_item.dart';

class HomeViewModel {
  final GenerateWithContext<String> homeOnGenerateTitle;
  final GenerateWithContext<String> homeOnGenerateAccountName;
  final GenerateWithContext<String> homeOnGenerateAccountEmail;
  final String homeAccountBackgroundImage;
  final GenerateWithContext<List<DrawerItem>> homeOnGenerateDrawerItems;
  final Function(BuildContext, DrawerItem) homeOnDrawerItemTapped;
  final GenerateWithContext<List<ActionItem>> homeOnGenerateActionItems;
  final Function(BuildContext, ActionItem) homeOnActionItemPressed;
  final Function(BuildContext, ActionChildItem) homeOnActionChildItemPressed;
  final GenerateWithContext<List<TabItem>> homeOnGenerateTabItems;
  final GenerateWithContext<List<Widget>> homeOnGenerateTabContents;
  final Function(BuildContext) homeOnFloatingActionButtonPressed;
  
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
    this.homeOnFloatingActionButtonPressed
  });

  static HomeViewModel fromStore(Store<RootState> store) {
    final homeState = homeStateSelector(store.state);

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
        store.dispatch(HomeReloadInitialStateAction());
      }
    );
  }
}
