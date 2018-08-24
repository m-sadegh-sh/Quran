import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';

class HelpAndSupportContainer extends StatefulWidget {
  String _getTitle(BuildContext context) => AppLocalizations.of(context).translate('help-and-support-title');

  @override
  _HelpAndSupportContainerState createState() => _HelpAndSupportContainerState();
}

class _HelpAndSupportContainerState extends State<HelpAndSupportContainer> {
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
        child: Text('Help & Support')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
