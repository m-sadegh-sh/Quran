import 'package:flutter/material.dart';

import 'package:quran/states/home_state.dart';
import 'package:quran/states/root_state.dart';
import 'package:quran/items/action_item.dart';
import 'package:quran/items/drawer_item.dart';
import 'package:quran/items/tab_item.dart';
import 'package:quran/delegates/generate_with_context.dart';

HomeState homeStateSelector(RootState state) => state.homeState;
GenerateWithContext<String> homeOnGenerateTitleSelector(HomeState state) => state.homeOnGenerateTitle;
GenerateWithContext<String> homeOnGenerateAccountNameSelector(HomeState state) => state.homeOnGenerateAccountName;
GenerateWithContext<String> homeOnGenerateAccountEmailSelector(HomeState state) => state.homeOnGenerateAccountEmail;
String homeAccountBackgroundImageSelector(HomeState state) => state.homeAccountBackgroundImage;
GenerateWithContext<List<DrawerItem>> homeOnGenerateDrawerItemsSelector(HomeState state) => state.homeOnGenerateDrawerItems;
GenerateWithContext<List<ActionItem>> homeOnGenerateActionItemsSelector(HomeState state) => state.homeOnGenerateActionItems;
GenerateWithContext<List<TabItem>> homeOnGenerateTabItemsSelector(HomeState state) => state.homeOnGenerateTabItems;
GenerateWithContext<List<Widget>> homeOnGenerateTabContentsSelector(HomeState state) => state.homeOnGenerateTabContents;