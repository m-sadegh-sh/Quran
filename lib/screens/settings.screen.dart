import 'package:flutter/material.dart';
import 'package:quran/app_localizations.dart';

import 'package:quran/items/action.item.dart';
import 'package:quran/items/list.item.dart';
import 'package:quran/items/translator.item.dart';

class SettingsScreen extends StatelessWidget {  
  final String settingsTitle;
  final List<ActionItem> settingsActionItems;
  final Function(BuildContext, ActionItem) settingsOnActionItemPressed;
  final List<ListItem<String>> settingThemeQuraniFontFamilyItems;
  final String settingsThemeQuraniFontFamily;
  final List<ListItem<double>> settingThemeFontSizeItems;
  final double settingsThemeFontSize;
  final List<ListItem<String>> settingLocaleCodeItems;
  final String settingsLocaleLocaleCode;
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
    this.settingLocaleCodeItems,
    this.settingsLocaleLocaleCode,
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

  ListView _buildListView(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text(
          AppLocalizations.of(context).translate('settings-theme-qurani-font-family'),
          style: Theme.of(context).textTheme.title
        ),
        CheckboxListTile(
          value: true,
          title: Text("This is a CheckBoxPreference"),
          onChanged: (value) {},
        ),
        SwitchListTile(
          value: false,
          title: Text("This is a SwitchPreference"),
          onChanged: (value) {},
        ),
        ListTile(
          title: Text("This is a ListPreference"),
          subtitle: Text("Subtitle goes here"),
          onTap: () {},
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
