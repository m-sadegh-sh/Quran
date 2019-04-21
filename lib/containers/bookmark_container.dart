import 'package:flutter/material.dart';

import 'package:quran/app_localizations.dart';

class BookmarkContainer extends StatefulWidget {
  static const String routeName = '/bookmark';

  String _getTitle(BuildContext context) => AppLocalizations.of(context).translate('bookmark-title');

  @override
  _BookmarkContainerState createState() => _BookmarkContainerState();
}

class _BookmarkContainerState extends State<BookmarkContainer> {
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
        child: Text('Bookmark')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
