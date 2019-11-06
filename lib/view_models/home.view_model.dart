import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/actions/home.action.dart';
import 'package:quran/selectors/app.selector.dart';
import 'package:quran/selectors/settings.selector.dart';
import 'package:quran/selectors/home.selector.dart';
import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/drawer.item.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/action_child.item.dart';

class HomeViewModel {
  final String appVersionName;
  final GeneratorWNP<String> homeOnGenerateTitle;
  final GeneratorWNP<String> homeOnGenerateAccountName;
  final GeneratorW1P<String, String> homeOnGenerateAccountEmail;
  final String homeAccountBackgroundImage;
  final GeneratorWNP<List<DrawerItem>> homeOnGenerateDrawerItems;
  final Function(BuildContext, DrawerItem) homeOnDrawerItemTapped;
  final bool homeIsSearching;
  final GeneratorWNP<String> homeOnGenerateSearchHintText;
  final String homeSearchQuery;
  final Function(BuildContext, String, int) homeOnSearchQueryChanging;
  final GeneratorW3P<bool, double, int, List<ActionItem>> homeOnGenerateActionItems;
  final Function(BuildContext, ActionItem) homeOnActionItemPressed;
  final Function(BuildContext, ActionChildItem) homeOnActionChildItemPressed;
  final GeneratorWNP<Widget> homeOnGenerateBody;
  final double settingsThemeFontSize;
  final int settingsTranslatorId;
  
  HomeViewModel({
    this.appVersionName,
    this.homeOnGenerateTitle,
    this.homeOnGenerateAccountName,
    this.homeOnGenerateAccountEmail,
    this.homeAccountBackgroundImage,
    this.homeOnGenerateDrawerItems,
    this.homeOnDrawerItemTapped,
    this.homeIsSearching,
    this.homeOnGenerateSearchHintText,
    this.homeSearchQuery,
    this.homeOnSearchQueryChanging,
    this.homeOnGenerateActionItems,
    this.homeOnActionItemPressed,
    this.homeOnActionChildItemPressed,
    this.homeOnGenerateBody,
    this.settingsThemeFontSize,
    this.settingsTranslatorId
  });

  static HomeViewModel fromStore(Store<RootState> store) {
    final appState = appStateSelector(store.state);
    final homeState = homeStateSelector(store.state);
    final settingsState = settingsStateSelector(store.state);

    return HomeViewModel(
      appVersionName: appVersionNameSelector(appState),
      homeOnGenerateTitle: homeOnGenerateTitleSelector(homeState),
      homeOnGenerateAccountName: homeOnGenerateAccountNameSelector(homeState),
      homeOnGenerateAccountEmail: homeOnGenerateAccountEmailSelector(homeState),
      homeAccountBackgroundImage: homeAccountBackgroundImageSelector(homeState),
      homeOnGenerateDrawerItems: homeOnGenerateDrawerItemsSelector(homeState),
      homeOnDrawerItemTapped: (BuildContext context, DrawerItem drawerItem) {
        store.dispatch(HomeDrawerItemTappedAction(
          context: context,
          homeDrawerItem: drawerItem,
        ));
      },
      homeIsSearching: homeIsSearchingSelector(homeState),
      homeOnGenerateSearchHintText: homeOnGenerateSearchHintTextSelector(homeState),
      homeSearchQuery: homeSearchQuerySelector(homeState),
      homeOnSearchQueryChanging: (BuildContext context, String homeSearchChangingQuery, int settingsTranslatorId) =>
        store.dispatch(HomeSearchQueryChangingAction(
          context: context,
          homeSearchChangingQuery: homeSearchChangingQuery,
          settingsTranslatorId: settingsTranslatorId
        )
      ),
      homeOnGenerateActionItems: homeOnGenerateActionItemsSelector(homeState),
      homeOnActionItemPressed: (BuildContext context, ActionItem homeActionItem) {
        store.dispatch(HomeActionItemPressedAction(
          context: context,
          store: store,
          homeActionItem: homeActionItem,
        ));
      },
      homeOnActionChildItemPressed: (BuildContext context, ActionChildItem actionChildItem) {
        store.dispatch(HomeActionChildItemPressedAction(
          context: context,
          homeOnGenerateChild: actionChildItem.onGenerateChild,
          homeActionChildItemType: actionChildItem.actionChildItemType,
          homeValue: actionChildItem.value
        ));
      },
      homeOnGenerateBody: homeOnGenerateBodySelector(homeState),
      settingsThemeFontSize: settingsThemeFontSizeSelector(settingsState),
      settingsTranslatorId: settingsTranslatorIdSelector(settingsState)
    );
  }
}
