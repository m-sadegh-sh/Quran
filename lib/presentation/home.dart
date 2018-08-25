import 'package:flutter/material.dart';

import 'package:Quran/items/drawer_item.dart';
import 'package:Quran/items/action_item.dart';
import 'package:Quran/items/tab_item.dart';

class Home extends StatelessWidget {  
  final String homeTitle;
  final String homeAccountName;
  final String homeAccountEmail;
  final String homeAccountBackgroundImage;
  final List<DrawerItem> homeDrawerItems;
  final Function(BuildContext, DrawerItem) homeOnDrawerItemTapped;
  final List<ActionItem> homeActionItems;
  final Function(BuildContext, ActionItem) homeOnActionItemPressed;
  final List<TabItem> homeTabItems;
  final List<Widget> homeTabContents;

  Home({
    Key key,
    this.homeTitle,
    this.homeAccountName,
    this.homeAccountEmail,
    this.homeAccountBackgroundImage,
    this.homeDrawerItems,
    this.homeOnDrawerItemTapped,
    this.homeActionItems,
    this.homeOnActionItemPressed,
    this.homeTabItems,
    this.homeTabContents
  }) : super(key: key);

  UserAccountsDrawerHeader _createAccountHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(homeAccountName),
      accountEmail: Text(homeAccountEmail),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(homeAccountBackgroundImage),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter
        )
      ),
    );
  }

  List<ListTile> _createDrawerItems(BuildContext context) {
    return homeDrawerItems
      .map<ListTile>((item) => ListTile(
        leading: item.icon != null ? Icon(item.icon) : null,
        title: Text(item.title),
        onTap: () => homeOnDrawerItemTapped(context, item),
      )).toList();
  }

  List<IconButton> _createActions(BuildContext context) {
    return homeActionItems
      .map<IconButton>((item) => IconButton(
        icon: Icon(item.icon),
        onPressed: () => homeOnActionItemPressed(context, item)
      )).toList();
  }

  List<Tab> _createTabItems(BuildContext context) {
    return homeTabItems
      .map<Tab>((item) => Tab(
        icon: item.icon != null ? Icon(item.icon) : null,
        text: item.text,
      )).toList();
  }

  AppBar _getAppBarWidget(BuildContext context) {
    return AppBar(
      title: Text(homeTitle),
      actions: _createActions(context),
      bottom: TabBar(
        tabs: _createTabItems(context),
      ),
    );
  }

  Drawer _getDrawerWidget(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          _createAccountHeader(context),
          Column(
            children: _createDrawerItems(context)
          )
        ],
      ),
    );
  }

  TabBarView _getTabBarViewWidget(BuildContext context) {
    return TabBarView(
      children: homeTabContents
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: homeTabItems.length,
      child: Scaffold(
        appBar: _getAppBarWidget(context),
        drawer: _getDrawerWidget(context),
        body: _getTabBarViewWidget(context)
      )
    );
  }
}
