import 'package:quran/states/settings_state.dart';
import 'package:quran/states/root_state.dart';

SettingsState settingsStateSelector(RootState state) => state.settingsState;
String settingsThemeQuraniFontFamilySelector(SettingsState state) => state.settingsThemeQuraniFontFamily;
double settingsThemeFontSizeSelector(SettingsState state) => state.settingsThemeFontSize;
String settingsLocaleCountryCodeSelector(SettingsState state) => state.settingsLocaleCountryCode;
String settingsLocaleLanguageCodeSelector(SettingsState state) => state.settingsLocaleLanguageCode;
int settingsTranslatorIdSelector(SettingsState state) => state.settingsTranslatorId;