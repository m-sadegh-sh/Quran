import 'package:flutter/material.dart';

import 'package:quran/states/home_state.dart';
import 'package:quran/states/root_state.dart';
import 'package:quran/items/action_item.dart';
import 'package:quran/items/drawer_item.dart';
import 'package:quran/items/tab_item.dart';
import 'package:quran/delegates/generators.dart';

HomeState homeStateSelector(RootState state) => state.homeState;
GeneratorWNP<String> homeOnGenerateTitleSelector(HomeState state) => state.homeOnGenerateTitle;
GeneratorWNP<String> homeOnGenerateAccountNameSelector(HomeState state) => state.homeOnGenerateAccountName;
GeneratorWNP<String> homeOnGenerateAccountEmailSelector(HomeState state) => state.homeOnGenerateAccountEmail;
String homeAccountBackgroundImageSelector(HomeState state) => state.homeAccountBackgroundImage;
GeneratorWNP<List<DrawerItem>> homeOnGenerateDrawerItemsSelector(HomeState state) => state.homeOnGenerateDrawerItems;
GeneratorW1P<double, List<ActionItem>> homeOnGenerateActionItemsSelector(HomeState state) => state.homeOnGenerateActionItems;
GeneratorWNP<List<TabItem>> homeOnGenerateTabItemsSelector(HomeState state) => state.homeOnGenerateTabItems;
GeneratorWNP<List<Widget>> homeOnGenerateTabContentsSelector(HomeState state) => state.homeOnGenerateTabContents;