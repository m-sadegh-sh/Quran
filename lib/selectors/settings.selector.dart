import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/list.item.dart';
import 'package:quran/states/settings.state.dart';
import 'package:quran/states/root.state.dart';

SettingsState settingsStateSelector(RootState state) => state.settingsState;
GeneratorWNP<String> settingsOnGenerateTitleSelector(SettingsState state) => state.settingsOnGenerateTitle;
GeneratorWNP<List<ActionItem>> settingsOnGenerateActionItemsSelector(SettingsState state) => state.settingsOnGenerateActionItems;
GeneratorWNP<List<ListItem<String>>> settingsOnGenerateThemeQuraniFontFamilyItemsSelector(SettingsState state) => state.settingsOnGenerateThemeQuraniFontFamilyItems;
String settingsThemeQuraniFontFamilySelector(SettingsState state) => state.settingsThemeQuraniFontFamily;
GeneratorWNP<List<ListItem<double>>> settingsOnGenerateThemeFontSizeItemsSelector(SettingsState state) => state.settingsOnGenerateThemeFontSizeItems;
double settingsThemeFontSizeSelector(SettingsState state) => state.settingsThemeFontSize;
GeneratorWNP<List<ListItem<String>>> settingsOnGenerateLocaleItemsSelector(SettingsState state) => state.settingsOnGenerateLocaleItems;
String settingsLocaleCodeSelector(SettingsState state) => state.settingsLocaleCode;
GeneratorWNP<List<ListItem<int>>> settingsOnGenerateTranslatorItemsSelector(SettingsState state) => state.settingsOnGenerateTranslatorItems;
int settingsTranslatorIdSelector(SettingsState state) => state.settingsTranslatorId;