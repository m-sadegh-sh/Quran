import 'package:flutter/widgets.dart';
import 'package:quran/items/list.item.dart';
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
  final GeneratorWNP<List<ListItem<String>>> settingsOnGenerateThemeQuraniFontFamilyItems;
  final String settingsThemeQuraniFontFamily;
  final GeneratorWNP<List<ListItem<double>>> settingsOnGenerateThemeFontSizeItems;
  final double settingsThemeFontSize;
  final GeneratorWNP<List<ListItem<String>>> settingsOnGenerateLocaleItems;
  final String settingsLocaleCode;
  final GeneratorWNP<List<ListItem<int>>> settingsOnGenerateTranslatorItems;
  final int settingsTranslatorId;
  final Function(String, double, String, int) settingsOnPersist;
  
  SettingsViewModel({
    this.settingsOnGenerateTitle,
    this.settingsOnGenerateActionItems,
    this.settingsOnActionItemPressed,
    this.settingsOnGenerateThemeQuraniFontFamilyItems,
    this.settingsThemeQuraniFontFamily,
    this.settingsOnGenerateThemeFontSizeItems,
    this.settingsThemeFontSize,
    this.settingsOnGenerateLocaleItems,
    this.settingsLocaleCode,
    this.settingsOnGenerateTranslatorItems,
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
      settingsOnGenerateThemeQuraniFontFamilyItems: settingsOnGenerateThemeQuraniFontFamilyItemsSelector(settingsState),
      settingsThemeQuraniFontFamily: settingsThemeQuraniFontFamilySelector(settingsState),
      settingsOnGenerateThemeFontSizeItems: settingsOnGenerateThemeFontSizeItemsSelector(settingsState),
      settingsThemeFontSize: settingsThemeFontSizeSelector(settingsState),
      settingsOnGenerateLocaleItems: settingsOnGenerateLocaleItemsSelector(settingsState),
      settingsLocaleCode: settingsLocaleCodeSelector(settingsState),
      settingsOnGenerateTranslatorItems: settingsOnGenerateTranslatorItemsSelector(settingsState),
      settingsTranslatorId: settingsTranslatorIdSelector(settingsState),
      settingsOnPersist: (String settingsThemeQuraniFontFamily, double settingsThemeFontSize, String settingsLocaleCode, int settingsTranslatorId) {
        store.dispatch(SettingsPersistAction(
          settingsThemeQuraniFontFamily: settingsThemeQuraniFontFamily,
          settingsThemeFontSize: settingsThemeFontSize,
          settingsLocaleCode: settingsLocaleCode,
          settingsTranslatorId: settingsTranslatorId
        ));
      }
    );
  }
}
