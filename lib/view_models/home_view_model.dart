import 'package:Quran/actions/home_action.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/selectors/home_selector.dart';
import 'package:Quran/delegates/generate_app_action_items.dart';
import 'package:Quran/delegates/generate_app_drawer_items.dart';
import 'package:Quran/delegates/generate_app_tab_contents.dart';
import 'package:Quran/delegates/generate_app_tab_items.dart';
import 'package:Quran/delegates/generate_localized_string.dart';
import 'package:Quran/items/action_item.dart';
import 'package:Quran/items/drawer_item.dart';

class HomeViewModel {
  final GenerateLocalizedString homeOnGenerateTitle;
  final GenerateLocalizedString homeOnGenerateAccountName;
  final GenerateLocalizedString homeOnGenerateAccountEmail;
  final String homeAccountBackgroundImage;
  final GenerateAppDrawerItems homeOnGenerateDrawerItems;
  final Function(BuildContext, DrawerItem) homeOnDrawerItemTapped;
  final GenerateAppActionItems homeOnGenerateActionItems;
  final Function(BuildContext, ActionItem) homeOnActionItemPressed;
  final GenerateAppTabItems homeOnGenerateTabItems;
  final GenerateAppTabContents homeOnGenerateTabContents;
  
  HomeViewModel({
    this.homeOnGenerateTitle,
    this.homeOnGenerateAccountName,
    this.homeOnGenerateAccountEmail,
    this.homeAccountBackgroundImage,
    this.homeOnGenerateDrawerItems,
    this.homeOnDrawerItemTapped,
    this.homeOnGenerateActionItems,
    this.homeOnActionItemPressed,
    this.homeOnGenerateTabItems,
    this.homeOnGenerateTabContents
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
        store.dispatch(ChapterListDrawerItemTappedAction(
          context: context,
          drawerItem: drawerItem,
        ));        
      },
      homeOnGenerateActionItems: homeOnGenerateActionItemsSelector(homeState),
      homeOnActionItemPressed: (BuildContext context, ActionItem actionItem) {
        store.dispatch(ChapterListActionItemPressedAction(
          context: context,
          actionItem: actionItem,
        ));
      },
      homeOnGenerateTabItems: homeOnGenerateTabItemsSelector(homeState),
      homeOnGenerateTabContents: homeOnGenerateTabContentsSelector(homeState)
    );
  }
}
