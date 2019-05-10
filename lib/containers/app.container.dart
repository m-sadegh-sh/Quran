import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/presentation/app.dart';
import 'package:quran/view_models/app.view_model.dart';

class AppContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, AppViewModel>(
      converter: AppViewModel.fromStore,
      builder: (BuildContext context, AppViewModel appViewModel) => App(
        appOnGenerateTitle: appViewModel.appOnGenerateTitle,
        appOnGenerateThemeData: appViewModel.appOnGenerateThemeData,
        appLocalizationsDelegates: appViewModel.appLocalizationsDelegates,
        appSupportedLocales: appViewModel.appSupportedLocales,
        settingsThemeQuraniFontFamily: appViewModel.settingsThemeQuraniFontFamily,
        settingsThemeFontSize: appViewModel.settingsThemeFontSize,
        settingsLocaleLanguageCode: appViewModel.settingsLocaleLanguageCode,
        settingsLocaleCountryCode: appViewModel.settingsLocaleCountryCode
      )
    );
  }
}
