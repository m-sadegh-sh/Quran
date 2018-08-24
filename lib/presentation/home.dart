import 'package:flutter/material.dart';

import 'package:Quran/items/drawer_item.dart';
import 'package:Quran/items/action_item.dart';
import 'package:Quran/items/tab_item.dart';

class Home extends StatelessWidget {  
  final String title;
  final String accountName;
  final String accountEmail;
  final String accountBackgroundImage;
  final List<DrawerItem> drawerItems;
  final List<ActionItem> actionItems;
  final List<TabItem> tabItems;
  final List<Widget> tabContents;

  Home({
    Key key,
    this.title,
    this.accountName,
    this.accountEmail,
    this.accountBackgroundImage,
    this.drawerItems,
    this.actionItems,
    this.tabItems,
    this.tabContents
  }) : super(key: key);

  UserAccountsDrawerHeader _createAccountHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(accountName),
      accountEmail: Text(accountEmail),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(accountBackgroundImage),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter
        )
      ),
    );
  }

  List<ListTile> _createDrawerItems(BuildContext context) {
    return drawerItems
      .map<ListTile>((item) => ListTile(
        leading: item.icon != null ? Icon(item.icon) : null,
        title: Text(item.title),
        onTap: () => _onDrawerTap(context, item),
      )).toList();
  }

  List<IconButton> _createActions(BuildContext context) {
    return actionItems
      .map<IconButton>((item) => IconButton(
        icon: Icon(item.icon),
        onPressed: () => _onActionPressed(context, item)
      )).toList();
  }

  List<Tab> _createTabItems(BuildContext context) {
    return tabItems
      .map<Tab>((item) => Tab(
        icon: item.icon != null ? Icon(item.icon) : null,
        text: item.text,
      )).toList();
  }

  AppBar _getAppBarWidget(BuildContext context) {
    return AppBar(
      title: Text(title),
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
          _createAccountHeader(),
          Column(
            children: _createDrawerItems(context)
          )
        ],
      ),
    );
  }

  TabBarView _getTabBarViewWidget() {
    return TabBarView(
      children: tabContents
    );
  }

  _onDrawerTap(BuildContext context, DrawerItem item) {
    Navigator.pop(context);
    Navigator.pushNamed(context, item.routeName);
  }

  _onActionPressed(BuildContext context, ActionItem item) {
    Navigator.pushNamed(context, item.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(      
      length: tabItems.length,
      child: Scaffold(
        appBar: _getAppBarWidget(context),
        drawer: _getDrawerWidget(context),
        body: _getTabBarViewWidget()
      )
    );
  }
}
