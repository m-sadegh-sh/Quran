
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

import 'package:quran/items/action.item.dart';
import 'package:quran/states/root.state.dart';

class SettingsLoadAction { }

class SettingsLoadSucceededAction {
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleCode;
  final int settingsTranslatorId;

  SettingsLoadSucceededAction({
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleCode,
    this.settingsTranslatorId
  });
}

class SettingsLoadFailedAction {}

class SettingsPersistAction {
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleCode;
  final int settingsTranslatorId;

  SettingsPersistAction({
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleCode,
    this.settingsTranslatorId
  });
}

class SettingsPersistSucceededAction {
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleCode;
  final int settingsTranslatorId;

  SettingsPersistSucceededAction({
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleCode,
    this.settingsTranslatorId
  });
}

class SettingsPersistFailedAction { }

class SettingsActionItemPressedAction {
  final BuildContext context;
  final Store<RootState> store;
  final ActionItem settingsActionItem;

  SettingsActionItemPressedAction({
    this.context,
    this.store,
    this.settingsActionItem
  });
}

class SettingsRestoreDefaultsAction { }
