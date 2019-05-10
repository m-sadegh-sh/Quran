import 'package:redux/redux.dart';

import 'package:quran/states/root.state.dart';
import 'package:quran/selectors/settings.selector.dart';

class SettingsViewModel {
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleLanguageCode;
  final String settingsLocaleCountryCode;
  final int settingsTranslatorId;

  SettingsViewModel({
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleLanguageCode,
    this.settingsLocaleCountryCode,
    this.settingsTranslatorId
  });

  static SettingsViewModel fromStore(Store<RootState> store) {
    final settingsState = settingsStateSelector(store.state);

    return SettingsViewModel(
      settingsThemeQuraniFontFamily: settingsThemeQuraniFontFamilySelector(settingsState),
      settingsThemeFontSize: settingsThemeFontSizeSelector(settingsState),
      settingsLocaleLanguageCode: settingsLocaleLanguageCodeSelector(settingsState),
      settingsLocaleCountryCode: settingsLocaleCountryCodeSelector(settingsState),
      settingsTranslatorId: settingsTranslatorIdSelector(settingsState)
    );
  }
}
