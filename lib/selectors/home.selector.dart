import 'package:flutter/material.dart';

import 'package:quran/states/home.state.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/drawer.item.dart';
import 'package:quran/delegates/generator.delegate.dart';

HomeState homeStateSelector(RootState state) => state.homeState;
GeneratorWNP<String> homeOnGenerateTitleSelector(HomeState state) => state.homeOnGenerateTitle;
GeneratorWNP<String> homeOnGenerateAccountNameSelector(HomeState state) => state.homeOnGenerateAccountName;
GeneratorW1P<String, String> homeOnGenerateAccountEmailSelector(HomeState state) => state.homeOnGenerateAccountEmail;
String homeAccountBackgroundImageSelector(HomeState state) => state.homeAccountBackgroundImage;
GeneratorWNP<List<DrawerItem>> homeOnGenerateDrawerItemsSelector(HomeState state) => state.homeOnGenerateDrawerItems;
bool homeIsSearchingSelector(HomeState state) => state.homeIsSearching;
GeneratorWNP<String> homeOnGenerateSearchHintTextSelector(HomeState state) => state.homeOnGenerateSearchHintText;
String homeSearchQuerySelector(HomeState state) => state.homeSearchQuery;
GeneratorW3P<bool, double, int, List<ActionItem>> homeOnGenerateActionItemsSelector(HomeState state) => state.homeOnGenerateActionItems;
GeneratorWNP<Widget> homeOnGenerateBodySelector(HomeState state) => state.homeOnGenerateBody;