import 'package:flutter/material.dart';

import 'package:quran/states/home.state.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/drawer.item.dart';
import 'package:quran/items/tab.item.dart';
import 'package:quran/delegates/generator.delegate.dart';

HomeState homeStateSelector(RootState state) => state.homeState;
GeneratorWNP<String> homeOnGenerateTitleSelector(HomeState state) => state.homeOnGenerateTitle;
GeneratorWNP<String> homeOnGenerateAccountNameSelector(HomeState state) => state.homeOnGenerateAccountName;
GeneratorWNP<String> homeOnGenerateAccountEmailSelector(HomeState state) => state.homeOnGenerateAccountEmail;
String homeAccountBackgroundImageSelector(HomeState state) => state.homeAccountBackgroundImage;
GeneratorWNP<List<DrawerItem>> homeOnGenerateDrawerItemsSelector(HomeState state) => state.homeOnGenerateDrawerItems;
bool homeIsSearchingSelector(HomeState state) => state.homeIsSearching;
String homeSearchQuerySelector(HomeState state) => state.homeSearchQuery;
GeneratorW1P<double, List<ActionItem>> homeOnGenerateActionItemsSelector(HomeState state) => state.homeOnGenerateActionItems;
GeneratorWNP<List<TabItem>> homeOnGenerateTabItemsSelector(HomeState state) => state.homeOnGenerateTabItems;
GeneratorWNP<List<Widget>> homeOnGenerateTabContentsSelector(HomeState state) => state.homeOnGenerateTabContents;