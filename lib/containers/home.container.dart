import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:quran/screens/home.screen.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/view_models/home.view_model.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, HomeViewModel>(
      converter: HomeViewModel.fromStore,
      builder: (BuildContext context, HomeViewModel homeViewModel) => HomeScreen(
        homeTitle: homeViewModel.homeOnGenerateTitle(context),
        homeAccountName: homeViewModel.homeOnGenerateAccountName(context),
        homeAccountEmail: homeViewModel.homeOnGenerateAccountEmail(context),
        homeAccountBackgroundImage: homeViewModel.homeAccountBackgroundImage,
        homeDrawerItems: homeViewModel.homeOnGenerateDrawerItems(context),
        homeOnDrawerItemTapped: homeViewModel.homeOnDrawerItemTapped,
        homeIsSearching: homeViewModel.homeIsSearching,
        homeSearchQuery: homeViewModel.homeSearchQuery,
        homeActionItems: homeViewModel.homeOnGenerateActionItems(context, homeViewModel.settingsThemeFontSize),
        homeOnActionItemPressed: homeViewModel.homeOnActionItemPressed,
        homeOnActionChildItemPressed: homeViewModel.homeOnActionChildItemPressed,
        homeTabItems: homeViewModel.homeOnGenerateTabItems(context),
        homeTabContents: homeViewModel.homeOnGenerateTabContents(context),
        homeOnFloatingActionButtonPressed: homeViewModel.homeOnFloatingActionButtonPressed
      )
    );
  }
}