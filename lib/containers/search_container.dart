import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';

class SearchContainer extends StatefulWidget {
  String _getTitle(BuildContext context) => AppLocalizations.of(context).translate('search-title');

  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
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
        child: Text('Search')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
