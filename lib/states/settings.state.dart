import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

import 'package:quran/actions/settings.action.dart';
import 'package:quran/app_localizations.dart';
import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/states/root.state.dart';

class SettingsState {
  final GeneratorWNP<String> settingsOnGenerateTitle;
  final GeneratorWNP<List<ActionItem>> settingsOnGenerateActionItems;
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleLanguageCode;
  final String settingsLocaleCountryCode;
  final int settingsTranslatorId;
  
  SettingsState({
    this.settingsOnGenerateTitle,
    this.settingsOnGenerateActionItems,
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleLanguageCode,
    this.settingsLocaleCountryCode,
    this.settingsTranslatorId
  });

  factory SettingsState.initial() {
    return SettingsState(
      settingsOnGenerateTitle: (BuildContext context) => AppLocalizations.of(context).translate('settings-title'),
      settingsOnGenerateActionItems: (BuildContext context) => [
        ActionItem(
          onDispatchAction: (BuildContext context, Store<RootState> store) =>
            store.dispatch(
              SettingsRestoreDefaultsAction()
            ),
          tooltip: AppLocalizations.of(context).translate('settings-action-restore-defaults'),
          icon: Icons.settings_backup_restore
        )
      ],
      settingsThemeQuraniFontFamily: 'Nabi',
      settingsThemeFontSize: 16.0,
      settingsLocaleLanguageCode: 'fa',
      settingsLocaleCountryCode: 'IR',
      settingsTranslatorId: 1
    );
  }
  
  SettingsState copyWith({
    settingsOnGenerateTitle,
    settingsOnGenerateActionItems,
    settingsThemeQuraniFontFamily,
    settingsThemeFontSize,
    settingsLocaleLanguageCode,
    settingsLocaleCountryCode,
    settingsTranslatorId
  }) => SettingsState(
    settingsOnGenerateTitle: settingsOnGenerateTitle ?? this.settingsOnGenerateTitle,
    settingsOnGenerateActionItems: settingsOnGenerateActionItems ?? this.settingsOnGenerateActionItems,
    settingsThemeQuraniFontFamily: settingsThemeQuraniFontFamily ?? this.settingsThemeQuraniFontFamily,
    settingsThemeFontSize: settingsThemeFontSize ?? this.settingsThemeFontSize,
    settingsLocaleLanguageCode: settingsLocaleLanguageCode ?? this.settingsLocaleLanguageCode,
    settingsLocaleCountryCode: settingsLocaleCountryCode ?? this.settingsLocaleCountryCode,
    settingsTranslatorId: settingsTranslatorId ?? this.settingsTranslatorId
  );
}