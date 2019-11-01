import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/selectors/settings.selector.dart';
import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/actions/settings.action.dart';

class SettingsViewModel {
  final GeneratorWNP<String> settingsOnGenerateTitle;
  final GeneratorWNP<List<ActionItem>> settingsOnGenerateActionItems;
  final Function(BuildContext, ActionItem) settingsOnActionItemPressed;
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleLanguageCode;
  final String settingsLocaleCountryCode;
  final int settingsTranslatorId;
  final Function(String, double, String, String, int) settingsOnPersist;
  
  SettingsViewModel({
    this.settingsOnGenerateTitle,
    this.settingsOnGenerateActionItems,
    this.settingsOnActionItemPressed,
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleLanguageCode,
    this.settingsLocaleCountryCode,
    this.settingsTranslatorId,
    this.settingsOnPersist
  });

  static SettingsViewModel fromStore(Store<RootState> store) {
    final settingsState = settingsStateSelector(store.state);

    return SettingsViewModel(
      settingsOnGenerateTitle: settingsOnGenerateTitleSelector(settingsState),
      settingsOnGenerateActionItems: settingsOnGenerateActionItemsSelector(settingsState),
      settingsOnActionItemPressed: (BuildContext context, ActionItem settingsActionItem) {
        store.dispatch(SettingsActionItemPressedAction(
          context: context,
          store: store,
          settingsActionItem: settingsActionItem,
        ));
      },
      settingsThemeQuraniFontFamily: settingsThemeQuraniFontFamilySelector(settingsState),
      settingsThemeFontSize: settingsThemeFontSizeSelector(settingsState),
      settingsLocaleLanguageCode: settingsLocaleLanguageCodeSelector(settingsState),
      settingsLocaleCountryCode: settingsLocaleCountryCodeSelector(settingsState),
      settingsTranslatorId: settingsTranslatorIdSelector(settingsState),
      settingsOnPersist: (String settingsThemeQuraniFontFamily, double settingsThemeFontSize, String settingsLocaleLanguageCode, String settingsLocaleCountryCode, int settingsTranslatorId) {
        store.dispatch(SettingsPersistAction(
          settingsThemeQuraniFontFamily: settingsThemeQuraniFontFamily,
          settingsThemeFontSize: settingsThemeFontSize,
          settingsLocaleLanguageCode: settingsLocaleLanguageCode,
          settingsLocaleCountryCode: settingsLocaleCountryCode,
          settingsTranslatorId: settingsTranslatorId
        ));
      }
    );
  }
}
