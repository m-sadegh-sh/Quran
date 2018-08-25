import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:Quran/presentation/home.dart';
import 'package:Quran/states/root_state.dart';
import 'package:Quran/view_models/home_view_model.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, HomeViewModel>(
      converter: HomeViewModel.fromStore,
      builder: (context, homeViewModel)  => Home(
        homeTitle: homeViewModel.homeOnGenerateTitle(context),
        homeAccountName: homeViewModel.homeOnGenerateAccountName(context),
        homeAccountEmail: homeViewModel.homeOnGenerateAccountEmail(context),
        homeAccountBackgroundImage: homeViewModel.homeAccountBackgroundImage,
        homeDrawerItems: homeViewModel.homeOnGenerateDrawerItems(context),
        homeOnDrawerItemTapped: homeViewModel.homeOnDrawerItemTapped,
        homeActionItems: homeViewModel.homeOnGenerateActionItems(context),
        homeOnActionItemPressed: homeViewModel.homeOnActionItemPressed,
        homeTabItems: homeViewModel.homeOnGenerateTabItems(context),
        homeTabContents: homeViewModel.homeOnGenerateTabContents(context)
      )
    );
  }
}