import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/actions/home_action.dart';
import 'package:Quran/selectors/home_selector.dart';
import 'package:Quran/delegates/generate_action_items.dart';
import 'package:Quran/delegates/generate_drawer_items.dart';
import 'package:Quran/delegates/generate_tab_contents.dart';
import 'package:Quran/delegates/generate_tab_items.dart';
import 'package:Quran/delegates/generate_localized_string.dart';
import 'package:Quran/items/action_item.dart';
import 'package:Quran/items/drawer_item.dart';

class HomeViewModel {
  final GenerateLocalizedString homeOnGenerateTitle;
  final GenerateLocalizedString homeOnGenerateAccountName;
  final GenerateLocalizedString homeOnGenerateAccountEmail;
  final String homeAccountBackgroundImage;
  final GenerateDrawerItems homeOnGenerateDrawerItems;
  final Function(BuildContext, DrawerItem) homeOnDrawerItemTapped;
  final GenerateActionItems homeOnGenerateActionItems;
  final Function(BuildContext, ActionItem) homeOnActionItemPressed;
  final GenerateTabItems homeOnGenerateTabItems;
  final GenerateTabContents homeOnGenerateTabContents;
  
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
      homeOnGenerateTabItems: homeOnGenerateTabItemsSelector(homeState),
      homeOnGenerateTabContents: homeOnGenerateTabContentsSelector(homeState)
    );
  }
}
