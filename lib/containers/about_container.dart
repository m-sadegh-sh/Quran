import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';

class AboutContainer extends StatefulWidget {
  String _getTitle(BuildContext context) => AppLocalizations.of(context).translate('about-title');

  @override
  _AboutContainerState createState() => _AboutContainerState();
}

class _AboutContainerState extends State<AboutContainer> {
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
        child: Text('About')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
