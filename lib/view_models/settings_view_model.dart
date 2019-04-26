import 'package:redux/redux.dart';

import 'package:quran/states/root_state.dart';
import 'package:quran/selectors/settings_selector.dart';

class SettingsViewModel {
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeQuraniFontSize;
  final String settingsLocaleLanguageCode;
  final String settingsLocaleCountryCode;
  final int settingsTranslatorId;

  SettingsViewModel({
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeQuraniFontSize,
    this.settingsLocaleLanguageCode,
    this.settingsLocaleCountryCode,
    this.settingsTranslatorId
  });

  static SettingsViewModel fromStore(Store<RootState> store) {
    final settingsState = settingsStateSelector(store.state);

    return SettingsViewModel(
      settingsThemeQuraniFontFamily: settingsThemeQuraniFontFamilySelector(settingsState),
      settingsThemeQuraniFontSize: settingsThemeQuraniFontSizeSelector(settingsState),
      settingsLocaleLanguageCode: settingsLocaleLanguageCodeSelector(settingsState),
      settingsLocaleCountryCode: settingsLocaleCountryCodeSelector(settingsState),
      settingsTranslatorId: settingsTranslatorIdSelector(settingsState)
    );
  }
}
