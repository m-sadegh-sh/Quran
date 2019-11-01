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
        settingThemeQuraniFontFamilyItems: settingsViewModel.settingsOnGenerateThemeQuraniFontFamilyItems(context),
        settingsThemeQuraniFontFamily: settingsViewModel.settingsThemeQuraniFontFamily,
        settingThemeFontSizeItems: settingsViewModel.settingsOnGenerateThemeFontSizeItems(context),
        settingsThemeFontSize: settingsViewModel.settingsThemeFontSize,
        settingLocaleItems: settingsViewModel.settingsOnGenerateLocaleItems(context),
        settingsLocaleCode: settingsViewModel.settingsLocaleCode,
        settingTranslatorItems: settingsViewModel.settingsOnGenerateTranslatorItems(context),
        settingsTranslatorId: settingsViewModel.settingsTranslatorId,
        settingsOnPersist: settingsViewModel.settingsOnPersist
      )
    );
  }
}