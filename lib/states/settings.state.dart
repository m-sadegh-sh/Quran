import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

import 'package:quran/actions/settings.action.dart';
import 'package:quran/app_localizations.dart';
import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/states/root.state.dart';
import 'package:quran/items/list.item.dart';

class SettingsState {
  final GeneratorWNP<String> settingsOnGenerateTitle;
  final GeneratorWNP<List<ActionItem>> settingsOnGenerateActionItems;
  final GeneratorWNP<List<ListItem<String>>> settingsOnGenerateThemeQuraniFontFamilyItems;
  final String settingsThemeQuraniFontFamily;
  final GeneratorWNP<List<ListItem<double>>> settingsOnGenerateThemeFontSizeItems;
  final double settingsThemeFontSize;
  final GeneratorWNP<List<ListItem<String>>> settingsOnGenerateLocaleItems;
  final String settingsLocaleCode;
  final GeneratorWNP<List<ListItem<int>>> settingsOnGenerateTranslatorItems;
  final int settingsTranslatorId;
  
  SettingsState({
    this.settingsOnGenerateTitle,
    this.settingsOnGenerateActionItems,
    this.settingsOnGenerateThemeQuraniFontFamilyItems,
    this.settingsThemeQuraniFontFamily,
    this.settingsOnGenerateThemeFontSizeItems,
    this.settingsThemeFontSize,
    this.settingsOnGenerateLocaleItems,
    this.settingsLocaleCode,
    this.settingsOnGenerateTranslatorItems,
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
      settingsOnGenerateThemeQuraniFontFamilyItems: (BuildContext context) => [
        ListItem<String>(
          title: AppLocalizations.of(context).translate('settings-theme-qurani-font-family-nabi'),
          value: 'Nabi'
        ),
        ListItem<String>(
          title: AppLocalizations.of(context).translate('settings-theme-qurani-font-family-neirizi'),
          value: 'Neirizi'
        ),
        ListItem<String>(
          title: AppLocalizations.of(context).translate('settings-theme-qurani-font-family-taha'),
          value: 'Taha'
        )
      ],
      settingsThemeQuraniFontFamily: 'Nabi',
      settingsOnGenerateThemeFontSizeItems: (BuildContext context) => [
        ListItem<double>(
          title: AppLocalizations.of(context).translate('settings-theme-font-size-16-0'),
          value: 16.0
        ),
        ListItem<double>(
          title: AppLocalizations.of(context).translate('settings-theme-font-size-18-0'),
          value: 18.0
        ),
        ListItem<double>(
          title: AppLocalizations.of(context).translate('settings-theme-font-size-20-0'),
          value: 20.0
        ),
        ListItem<double>(
          title: AppLocalizations.of(context).translate('settings-theme-font-size-22-0'),
          value: 22.0
        ),
        ListItem<double>(
          title: AppLocalizations.of(context).translate('settings-theme-font-size-24-0'),
          value: 24.0
        ),
      ],
      settingsThemeFontSize: 16.0,
      settingsOnGenerateLocaleItems: (BuildContext context) => [
        ListItem<String>(
          title: AppLocalizations.of(context).translate('settings-locale-code-fa-ir'),
          value: 'fa-IR'
        )
      ],
      settingsLocaleCode: 'fa-IR',
      settingsOnGenerateTranslatorItems: (BuildContext context) => [
        ListItem<int>(
          title: AppLocalizations.of(context).translate('settings-theme-qurani-font-family-nabi'),
          value: 1
        )
      ],
      settingsTranslatorId: 1
    );
  }

  SettingsState copyWith({
    settingsOnGenerateTitle,
    settingsOnGenerateActionItems,
    settingsThemeQuraniFontFamily,
    settingsThemeFontSize,
    settingsLocaleCode,
    settingsTranslatorId
  }) => SettingsState(
    settingsOnGenerateTitle: settingsOnGenerateTitle ?? this.settingsOnGenerateTitle,
    settingsOnGenerateActionItems: settingsOnGenerateActionItems ?? this.settingsOnGenerateActionItems,
    settingsThemeQuraniFontFamily: settingsThemeQuraniFontFamily ?? this.settingsThemeQuraniFontFamily,
    settingsThemeFontSize: settingsThemeFontSize ?? this.settingsThemeFontSize,
    settingsLocaleCode: settingsLocaleCode ?? this.settingsLocaleCode,
    settingsTranslatorId: settingsTranslatorId ?? this.settingsTranslatorId
  );
}