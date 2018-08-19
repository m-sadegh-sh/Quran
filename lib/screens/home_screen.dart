import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';
import 'package:Quran/models/drawer_item_model.dart';
import 'package:Quran/models/action_item_model.dart';
import 'package:Quran/models/tab_item_model.dart';
import 'package:Quran/fragments/surahs_list_fragment.dart';
import 'package:Quran/fragments/parts_list_fragment.dart';
import 'package:Quran/fragments/bookmarks_list_fragment.dart';

class HomeScreen extends StatefulWidget {
  String _getTitle(BuildContext context) => AppLocalizations.of(context).translate('home-title');

  List<DrawerItemModel> _getDrawerItems(BuildContext context) => [
    DrawerItemModel('/help-and-support', AppLocalizations.of(context).translate('home-drawer-help-and-support'), Icons.help),
    DrawerItemModel('/settings', AppLocalizations.of(context).translate('home-drawer-settings'), Icons.settings),
    DrawerItemModel('/about', AppLocalizations.of(context).translate('home-drawer-about'), Icons.info)
  ];

  List<ActionItemModel> _getActionItems(BuildContext context) => [
    ActionItemModel('/search', Icons.search)
  ];

  List<TabItemModel> _getTabItems(BuildContext context) => [
    TabItemModel(AppLocalizations.of(context).translate('home-tab-surahs'), Icons.list),
    TabItemModel(AppLocalizations.of(context).translate('home-tab-parts'), Icons.view_module),
    TabItemModel(AppLocalizations.of(context).translate('home-tab-bookmarks'), Icons.bookmark)
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserAccountsDrawerHeader _createAccountHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(AppLocalizations.of(context).translate('home-drawer-account-name')),
      accountEmail: Text(AppLocalizations.of(context).translate('home-drawer-account-email')),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/drawer_background.jpg'
          ),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter
        )
      ),
    );
  }

  List<ListTile> _createDrawerItems() {
    return widget._getDrawerItems(context)
      .map((item) => ListTile(
        leading: item.icon != null ? Icon(item.icon) : null,
        title: Text(item.title),
        onTap: () => _onDrawerTap(item),
      )).toList();
  }

  List<IconButton> _createActions() {
    return widget._getActionItems(context)
      .map((item) => IconButton(
        icon: Icon(item.icon),
        onPressed: () => _onActionPressed(item)
      )).toList();
  }

  List<Tab> _createTabItems() {
    return widget._getTabItems(context)
      .map((item) => Tab(
        icon: item.icon != null ? Icon(item.icon) : null,
        text: item.text,
      )).toList();
  }

  AppBar _getAppBarWidget() {
    return AppBar(
      title: Text(widget._getTitle(context)),
      actions: _createActions(),
      bottom: TabBar(
        tabs: _createTabItems(),
      ),
    );
  }

  Drawer _getDrawerWidget() {
    return Drawer(
      child: Column(
        children: <Widget>[
          _createAccountHeader(),
          Column(
            children: _createDrawerItems()
          )
        ],
      ),
    );
  }

  TabBarView _getTabBarViewWidget() {
    return TabBarView(
      children: <Widget>[
        SurahsListFragment(),
        PartsListFragment(),
        BookmarksListFragment()
      ]
    );
  }

  _onDrawerTap(DrawerItemModel item) {
    Navigator.pushNamed(context, item.routeName);
  }

  _onActionPressed(ActionItemModel item) {
    Navigator.pushNamed(context, item.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(      
      length: widget._getActionItems(context).length,
      child: Scaffold(
        appBar: _getAppBarWidget(),
        drawer: _getDrawerWidget(),
        body: _getTabBarViewWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      )
    );
  }
}