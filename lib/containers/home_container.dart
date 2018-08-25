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
        homeOnGenerateTitle: homeViewModel.homeOnGenerateTitle,
        homeOnGenerateAccountName: homeViewModel.homeOnGenerateAccountName,
        homeOnGenerateAccountEmail: homeViewModel.homeOnGenerateAccountEmail,
        homeAccountBackgroundImage: homeViewModel.homeAccountBackgroundImage,
        homeOnGenerateDrawerItems: homeViewModel.homeOnGenerateDrawerItems,
        homeOnDrawerItemTapped: homeViewModel.homeOnDrawerItemTapped,
        homeOnGenerateActionItems: homeViewModel.homeOnGenerateActionItems,
        homeOnActionItemPressed: homeViewModel.homeOnActionItemPressed,
        homeOnGenerateTabItems: homeViewModel.homeOnGenerateTabItems,
        homeOnGenerateTabContents: homeViewModel.homeOnGenerateTabContents
      )
    );
  }
}