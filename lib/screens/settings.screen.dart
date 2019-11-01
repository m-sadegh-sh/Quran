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

  List<Widget> _buildThemeQuraniFontFamilyItems(BuildContext context) {
    return settingThemeQuraniFontFamilyItems
      .map<Widget>((item) =>
        ListTile(
          title: Text(item.title),
          onTap: () => settingsOnPersist(
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
        ListTile(
          title: Text(item.title),
          onTap: () => settingsOnPersist(
            settingsThemeQuraniFontFamily,
            item.value,
            settingsLocaleCode,
            settingsTranslatorId
          )
        )
      ).toList();
  }

  List<Widget> _buildLocaleCodeItems(BuildContext context) {
    return settingThemeQuraniFontFamilyItems
      .map<Widget>((item) =>
        ListTile(
          title: Text(item.title),
          onTap: () => settingsOnPersist(
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
        ListTile(
          title: Text(item.title),
          onTap: () => settingsOnPersist(
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
      children: <Widget>[
        Text(
          AppLocalizations.of(context).translate('settings-theme-qurani-font-family'),
          style: Theme.of(context).textTheme.title
        ),
        Stack(
          children: _buildThemeQuraniFontFamilyItems(context),
        ),
        Text(
          AppLocalizations.of(context).translate('settings-theme-font-size'),
          style: Theme.of(context).textTheme.title
        ),
        Stack(
          children: _buildThemeFontSizeItems(context),
        ),
        Text(
          AppLocalizations.of(context).translate('settings-locale-code'),
          style: Theme.of(context).textTheme.title
        ),
        Stack(
          children: _buildLocaleCodeItems(context),
        ),
        Text(
          AppLocalizations.of(context).translate('settings-translator-id'),
          style: Theme.of(context).textTheme.title
        ),
        Stack(
          children: _buildTranslatorItems(context),
        )
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
