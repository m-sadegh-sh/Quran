import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';

class SettingsContainer extends StatefulWidget {
  String _getTitle(BuildContext context) => AppLocalizations.of(context).translate('settings-title');

  @override
  _SettingsContainerState createState() => _SettingsContainerState();
}

class _SettingsContainerState extends State<SettingsContainer> {
  AppBar _getAppBarWidget() {
    return AppBar(
      title: Text(widget._getTitle(context)),      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBarWidget(),
      body: Center(
        child: Text('Settings')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
