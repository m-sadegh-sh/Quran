import 'package:flutter/material.dart';

import 'package:quran/app_localizations.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/list.item.dart';

class SettingsScreen extends StatelessWidget {  
  final String settingsTitle;
  final List<ActionItem> settingsActionItems;
  final Function(BuildContext, ActionItem) settingsOnActionItemPressed;
  final List<ListItem<String>> settingThemeQuraniFontFamilyItems;
  final String settingsThemeQuraniFontFamily;
  final List<ListItem<double>> settingThemeFontSizeItems;
  final double settingsThemeFontSize;
  final List<ListItem<String>> settingLocaleItems;
  final String settingsLocaleCode;
  final List<ListItem<int>> settingTranslatorItems;
  final int settingsTranslatorId;
  final Function(String, double, String, int) settingsOnPersist;

  SettingsScreen({
    Key key,
    this.settingsTitle,
    this.settingsActionItems,
    this.settingsOnActionItemPressed,
    this.settingThemeQuraniFontFamilyItems,
    this.settingsThemeQuraniFontFamily,
    this.settingThemeFontSizeItems,
    this.settingsThemeFontSize,
    this.settingLocaleItems,
    this.settingsLocaleCode,
    this.settingTranslatorItems,
    this.settingsTranslatorId,
    this.settingsOnPersist
  }) : super(key: key);

  List<Widget> _buildActions(BuildContext context) {
    return settingsActionItems
      .map<Widget>((item) =>
        IconButton(
          icon: Icon(item.icon),
          tooltip: item.tooltip,
          onPressed: () => settingsOnActionItemPressed(context, item)
        )
      ).toList();
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        settingsTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline
      ),
      actions: _buildActions(context)
    );
  }

  Widget _createSectionTitle(BuildContext context, String title){
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 7.5,
        horizontal: 15.0
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.display2
      )
    );
  }

  List<Widget> _buildThemeQuraniFontFamilyItems(BuildContext context) {
    return settingThemeQuraniFontFamilyItems
      .map<Widget>((item) =>
        RadioListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          value: item.value,
          groupValue: settingsThemeQuraniFontFamily,
          title: Text(
            item.title,
            style: Theme.of(context).textTheme.display3
          ),
          onChanged: (bool) => settingsOnPersist(
            item.value,
            settingsThemeFontSize,
            settingsLocaleCode,
            settingsTranslatorId
          )
        )
      ).toList();
  }

  List<Widget> _buildThemeFontSizeItems(BuildContext context) {
    return settingThemeFontSizeItems
      .map<Widget>((item) =>
        RadioListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          value: item.value,
          groupValue: settingsThemeFontSize,
          title: Text(
            item.title,
            style: Theme.of(context).textTheme.display3
          ),
          onChanged: (bool) => settingsOnPersist(
            settingsThemeQuraniFontFamily,
            item.value,
            settingsLocaleCode,
            settingsTranslatorId
          )
        )
      ).toList();
  }

  List<Widget> _buildLocaleCodeItems(BuildContext context) {
    return settingLocaleItems
      .map<Widget>((item) =>
        RadioListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          value: item.value,
          groupValue: settingsLocaleCode,
          title: Text(
            item.title,
            style: Theme.of(context).textTheme.display3
          ),
          onChanged: (bool) => settingsOnPersist(
            settingsThemeQuraniFontFamily,
            settingsThemeFontSize,
            item.value,
            settingsTranslatorId
          )
        )
      ).toList();
  }

  List<Widget> _buildTranslatorItems(BuildContext context) {
    return settingTranslatorItems
      .map<Widget>((item) =>
        RadioListTile(
          controlAffinity: ListTileControlAffinity.trailing,
          value: item.value,
          groupValue: settingsTranslatorId,
          title: Text(
            item.title,
            style: Theme.of(context).textTheme.display3
          ),
          onChanged: (bool) => settingsOnPersist(
            settingsThemeQuraniFontFamily,
            settingsThemeFontSize,
            settingsLocaleCode,
            item.value
          )
        )
      ).toList();
  }

  ListView _buildListView(BuildContext context) {
    return ListView(
      children: [
        _createSectionTitle(
          context,
          AppLocalizations.of(context).translate('settings-theme-qurani-font-family'),
        ),
        ..._buildThemeQuraniFontFamilyItems(context),
        _createSectionTitle(
          context,
          AppLocalizations.of(context).translate('settings-theme-font-size'),
        ),
        ..._buildThemeFontSizeItems(context),
        _createSectionTitle(
          context,
          AppLocalizations.of(context).translate('settings-locale-code'),
        ),
        ..._buildLocaleCodeItems(context),
        _createSectionTitle(
          context,
          AppLocalizations.of(context).translate('settings-translator-id'),
        ),
        ..._buildTranslatorItems(context)
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildListView(context)
    );
  }
}
