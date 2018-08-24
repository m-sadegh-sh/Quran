import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';
import 'package:Quran/models/drawer_item_model.dart';
import 'package:Quran/models/action_item_model.dart';
import 'package:Quran/models/tab_item_model.dart';
import 'package:Quran/presentation/chapter_list.dart';
import 'package:Quran/presentation/part_list.dart';
import 'package:Quran/presentation/bookmark_list.dart';

class HomeContainer extends StatefulWidget {
  String _getTitle(BuildContext context) => AppLocalizations.of(context).translate('home-title');

  List<DrawerItemModel> _getDrawerItems(BuildContext context) => [
    DrawerItemModel(routeName: '/help-and-support', title: AppLocalizations.of(context).translate('home-drawer-help-and-support'), icon: Icons.help),
    DrawerItemModel(routeName: '/settings', title: AppLocalizations.of(context).translate('home-drawer-settings'), icon: Icons.settings),
    DrawerItemModel(routeName: '/about', title: AppLocalizations.of(context).translate('home-drawer-about'), icon: Icons.info)
  ];

  List<ActionItemModel> _getActionItems(BuildContext context) => [
    ActionItemModel(routeName: '/search', icon: Icons.search)
  ];

  List<TabItemModel> _getTabItems(BuildContext context) => [
    TabItemModel(text: AppLocalizations.of(context).translate('home-tab-chapters'), icon: Icons.list),
    TabItemModel(text: AppLocalizations.of(context).translate('home-tab-parts'), icon: Icons.view_module),
    TabItemModel(text: AppLocalizations.of(context).translate('home-tab-bookmarks'), icon: Icons.bookmark)
  ];

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
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
      .map<ListTile>((item) => ListTile(
        leading: item.icon != null ? Icon(item.icon) : null,
        title: Text(item.title),
        onTap: () => _onDrawerTap(item),
      )).toList();
  }

  List<IconButton> _createActions() {
    return widget._getActionItems(context)
      .map<IconButton>((item) => IconButton(
        icon: Icon(item.icon),
        onPressed: () => _onActionPressed(item)
      )).toList();
  }

  List<Tab> _createTabItems() {
    return widget._getTabItems(context)
      .map<Tab>((item) => Tab(
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
        ChapterList(),
        PartList(),
        BookmarkList()
      ]
    );
  }

  _onDrawerTap(DrawerItemModel item) {
    Navigator.pop(context);
    Navigator.pushNamed(context, item.routeName);
  }

  _onActionPressed(ActionItemModel item) {
    Navigator.pushNamed(context, item.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(      
      length: widget._getTabItems(context).length,
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
