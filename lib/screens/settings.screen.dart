import 'package:flutter/material.dart';

import 'package:quran/items/action.item.dart';

class SettingsScreen extends StatelessWidget {  
  final String settingsTitle;
  final List<ActionItem> settingsActionItems;
  final Function(BuildContext, ActionItem) settingsOnActionItemPressed;
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleLanguageCode;
  final String settingsLocaleCountryCode;
  final int settingsTranslatorId;
  final Function(String, double, String, String, int) settingsOnPersist;

  SettingsScreen({
    Key key,
    this.settingsTitle,
    this.settingsActionItems,
    this.settingsOnActionItemPressed,
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleLanguageCode,
    this.settingsLocaleCountryCode,
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
