import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:Quran/states/root_state.dart';
import 'package:Quran/presentation/app.dart';
import 'package:Quran/view_models/app_view_model.dart';

class AppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, AppViewModel>(
      converter: AppViewModel.fromStore,
      builder: (BuildContext context, AppViewModel appViewModel)  => App(
        appTitle: appViewModel.appOnGenerateTitle(context),
        appTheme: appViewModel.appTheme,
        appInitialRoute: appViewModel.appInitialRoute,
        appRoutes: appViewModel.appOnGenerateRoutes(context),
        appLocalizationsDelegates: appViewModel.appLocalizationsDelegates,
        appSupportedLocales: appViewModel.appSupportedLocales
      )
    );
  }
}
