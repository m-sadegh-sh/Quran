import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/presentation/app.dart';
import 'package:quran/view_models/app_view_model.dart';

class AppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, AppViewModel>(
      converter: AppViewModel.fromStore,
      builder: (BuildContext context, AppViewModel appViewModel)  => App(
        appOnGenerateTitle: appViewModel.appOnGenerateTitle,
        appTheme: appViewModel.appTheme,
        appInitialRoute: appViewModel.appInitialRoute,
        appRoutes: appViewModel.appOnGenerateRoutes(context),
        appLocalizationsDelegates: appViewModel.appLocalizationsDelegates,
        appSupportedLocales: appViewModel.appSupportedLocales
      )
    );
  }
}
