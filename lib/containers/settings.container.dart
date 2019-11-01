import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:quran/screens/settings.screen.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/view_models/settings.view_model.dart';

class SettingsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<RootState, SettingsViewModel>(
      converter: SettingsViewModel.fromStore,
      builder: (BuildContext context, SettingsViewModel settingsViewModel) => SettingsScreen(
        settingsTitle: settingsViewModel.settingsOnGenerateTitle(context),
        settingsActionItems: settingsViewModel.settingsOnGenerateActionItems(context),
        settingsOnActionItemPressed: settingsViewModel.settingsOnActionItemPressed,
        settingsThemeQuraniFontFamily: settingsViewModel.settingsThemeQuraniFontFamily,
        settingsThemeFontSize: settingsViewModel.settingsThemeFontSize,
        settingsLocaleLanguageCode: settingsViewModel.settingsLocaleLanguageCode,
        settingsLocaleCountryCode: settingsViewModel.settingsLocaleCountryCode,
        settingsTranslatorId: settingsViewModel.settingsTranslatorId,
        settingsOnPersist: settingsViewModel.settingsOnPersist
      )
    );
  }
}