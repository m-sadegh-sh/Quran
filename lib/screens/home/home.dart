import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget getAppBarWidget(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: _incrementCounter,
        ),
        IconButton(
          icon: Icon(Icons.security),
          onPressed: _incrementCounter,
        )
      ],
      bottom: TabBar(
        tabs: [
          Tab(text: AppLocalizations.of(context).translate('home-appbar-bottom-surahs')),
          Tab(text: AppLocalizations.of(context).translate('home-appbar-bottom-parts')),
          Tab(text: AppLocalizations.of(context).translate('home-appbar-bottom-bookmarks'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: getAppBarWidget(context),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ));
  }
}
