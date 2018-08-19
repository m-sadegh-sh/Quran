import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';
import 'package:Quran/models/drawer_item_model.dart';
import 'package:Quran/models/action_item_model.dart';
import 'package:Quran/models/tab_item_model.dart';

class HomeScreen extends StatefulWidget {
  String _getTitle(BuildContext context) => AppLocalizations.of(context).translate('home-title');

  List<DrawerItemModel> _getDrawerItems(BuildContext context) => [
    DrawerItemModel.withTitle(AppLocalizations.of(context).translate('home-appbar-bottom-surahs')),
    DrawerItemModel.withTitle(AppLocalizations.of(context).translate('home-appbar-bottom-parts')),
    DrawerItemModel.withTitle(AppLocalizations.of(context).translate('home-appbar-bottom-bookmarks'))
  ];

  List<ActionItemModel> _getActionItems(BuildContext context) => [
    ActionItemModel(Icons.search)
  ];

  List<TabItemModel> _getTabItems(BuildContext context) => [
    TabItemModel.withText(AppLocalizations.of(context).translate('home-appbar-bottom-surahs')),
    TabItemModel.withText(AppLocalizations.of(context).translate('home-appbar-bottom-parts')),
    TabItemModel.withText(AppLocalizations.of(context).translate('home-appbar-bottom-bookmarks'))
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItemModel _drawerSelectedItem;

  UserAccountsDrawerHeader _createAccountHeader() {
    return new UserAccountsDrawerHeader(
      accountName: new Text('محمد صادق شاد'),
      accountEmail: new Text('m.sadegh.sh@gmail.com')
    );
  }

  List<ListTile> _createDrawerItems() {
    return widget._getDrawerItems(context)
      .map((item) => ListTile(
        leading: item.icon != null ? new Icon(item.icon) : null,
        title: new Text(item.title),
        selected: item == _drawerSelectedItem,
        onTap: () => _onDrawerTap(item),
      )).toList();
  }

  List<IconButton> _createActions() {
    return widget._getActionItems(context)
      .map((item) => IconButton(
        icon: new Icon(item.icon),
        onPressed: () => _onActionPressed(item)
      )).toList();
  }

  List<Tab> _createTabItems() {
    return widget._getTabItems(context)
      .map((item) => Tab(
        icon: item.icon != null ? new Icon(item.icon) : null,
        text: item.text
      )).toList();
  }

  Widget _getDrawerCurrentWidget() {
    switch (_drawerSelectedItem) {
      // case 0:
      //   return new FirstFragment();
      // case 1:
      //   return new SecondFragment();
      // case 2:
      //   return new ThirdFragment();

      default:
        return new Text('Error');
    }
  }

  AppBar getAppBarWidget() {
    return AppBar(
      title: Text(widget._getTitle(context)),
      actions: _createActions(),
      bottom: TabBar(
        tabs: _createTabItems(),
      ),
    );
  }

  _onDrawerTap(DrawerItemModel item) {
    setState(() => _drawerSelectedItem = item);

    Navigator.of(context).pop();
  }

  _onActionPressed(ActionItemModel item) {
    // setState(() => _selectedDrawerIndex = index);

    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget._getDrawerItems(context).length,
      child: Scaffold(
        appBar: getAppBarWidget(),
        drawer: new Drawer(
          child: new Column(
            children: <Widget>[
              _createAccountHeader(),
              new Column(
                children: _createDrawerItems()
              )
            ],
          ),
        ),
        body: _getDrawerCurrentWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      )
    );
  }
}
