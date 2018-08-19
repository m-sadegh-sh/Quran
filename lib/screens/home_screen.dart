import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';
import 'package:Quran/models/drawer_item_model.dart';
import 'package:Quran/models/action_item_model.dart';
import 'package:Quran/models/tab_item_model.dart';

class HomeScreen extends StatefulWidget {
  getTitle(BuildContext context) => AppLocalizations.of(context).translate('home-title');

  getDrawerItems(BuildContext context) => [
    DrawerItemModel.withTitle(AppLocalizations.of(context).translate('home-appbar-bottom-surahs')),
    DrawerItemModel.withTitle(AppLocalizations.of(context).translate('home-appbar-bottom-parts')),
    DrawerItemModel.withTitle(AppLocalizations.of(context).translate('home-appbar-bottom-bookmarks'))
  ];

  getActionItems(BuildContext context) => [
    ActionItemModel(Icons.search)
  ];

  getTabItems(BuildContext context) => [
    TabItemModel.withText(AppLocalizations.of(context).translate('home-appbar-bottom-surahs')),
    TabItemModel.withText(AppLocalizations.of(context).translate('home-appbar-bottom-parts')),
    TabItemModel.withText(AppLocalizations.of(context).translate('home-appbar-bottom-bookmarks'))
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItemModel _drawerSelectedItem;

  Widget _createAccountHeader() {
    return new UserAccountsDrawerHeader(
      accountName: new Text("John Doe"),
      accountEmail: null
    );
  }

  List<Widget> _createDrawerItems() {
    return widget.getDrawerItems(context)
      .map((item) => ListTile(
        leading: item.icon != null ? new Icon(item.icon) : null,
        title: new Text(item.title),
        selected: item == _drawerSelectedItem,
        onTap: () => _onDrawerTap(item),
      )).toList();
  }

  List<Widget> _createActions() {
    return widget
      .getActionItems(context)
      .map((item) => IconButton(
        icon: new Icon(item.icon),
        onPressed: () => _onActionPressed(item)
      )).toList();
  }

  List<Widget> _createTabItems() {
    return widget.getTabItems(context)
      .map((item) => Tab(
        icon: item.icon != null ? new Icon(item.icon) : null,
        text: item.text
      )).toList();
  }

  _getDrawerCurrentWidget() {
    switch (_drawerSelectedItem) {
      // case 0:
      //   return new FirstFragment();
      // case 1:
      //   return new SecondFragment();
      // case 2:
      //   return new ThirdFragment();

      default:
        return new Text("Error");
    }
  }

  _onDrawerTap(DrawerItemModel item) {
    setState(() => _drawerSelectedItem = item);

    Navigator.of(context).pop();
  }

  _onActionPressed(ActionItemModel item) {
    // setState(() => _selectedDrawerIndex = index);

    // Navigator.of(context).pop();
  }

  Widget getAppBarWidget() {
    return AppBar(
      title: Text(widget.getTitle(context)),
      actions: _createActions(),
      bottom: TabBar(
        tabs: _createTabItems(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.getDrawerItems(context).length,
      child: Scaffold(
        appBar: getAppBarWidget(),
        drawer: new Drawer(
          child: new Column(
            children: <Widget>[
              _createAccountHeader(),
              new Column(children: _createDrawerItems())
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
