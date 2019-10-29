import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/actions/app.action.dart';
import 'package:quran/actions/settings.action.dart';
import 'package:quran/actions/home.action.dart';
import 'package:quran/actions/chapter_details.action.dart';
import 'package:quran/selectors/settings.selector.dart';
import 'package:quran/selectors/home.selector.dart';
import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/drawer.item.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/action_child.item.dart';
import 'package:quran/items/tab.item.dart';

class HomeViewModel {
  final GeneratorWNP<String> homeOnGenerateTitle;
  final GeneratorWNP<String> homeOnGenerateAccountName;
  final GeneratorWNP<String> homeOnGenerateAccountEmail;
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
  final GeneratorWNP<List<TabItem>> homeOnGenerateTabItems;
  final GeneratorWNP<List<Widget>> homeOnGenerateTabContents;
  final Function(BuildContext) homeOnFloatingActionButtonPressed;
  final double settingsThemeFontSize;
  final int settingsTranslatorId;
  
  HomeViewModel({
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
    this.homeOnGenerateTabItems,
    this.homeOnGenerateTabContents,
    this.homeOnFloatingActionButtonPressed,
    this.settingsThemeFontSize,
    this.settingsTranslatorId
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
      homeOnGenerateTabItems: homeOnGenerateTabItemsSelector(homeState),
      homeOnGenerateTabContents: homeOnGenerateTabContentsSelector(homeState),
      homeOnFloatingActionButtonPressed: (BuildContext context) {
        store.dispatch(AppReloadInitialStateAction());
        store.dispatch(SettingsReloadInitialStateAction());
        store.dispatch(HomeReloadInitialStateAction());
        store.dispatch(ChapterDetailsReloadInitialStateAction());
      },
      settingsThemeFontSize: settingsThemeFontSizeSelector(settingsState),
      settingsTranslatorId: settingsTranslatorIdSelector(settingsState)
    );
  }
}
