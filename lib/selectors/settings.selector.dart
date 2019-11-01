import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/states/settings.state.dart';
import 'package:quran/states/root.state.dart';

SettingsState settingsStateSelector(RootState state) => state.settingsState;
GeneratorWNP<String> settingsOnGenerateTitleSelector(SettingsState state) => state.settingsOnGenerateTitle;
GeneratorWNP<List<ActionItem>> settingsOnGenerateActionItemsSelector(SettingsState state) => state.settingsOnGenerateActionItems;
String settingsThemeQuraniFontFamilySelector(SettingsState state) => state.settingsThemeQuraniFontFamily;
double settingsThemeFontSizeSelector(SettingsState state) => state.settingsThemeFontSize;
String settingsLocaleLocaleCodeSelector(SettingsState state) => state.settingsLocaleLocaleCode;
int settingsTranslatorIdSelector(SettingsState state) => state.settingsTranslatorId;