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

  UserAccountsDrawerHeader _buildAccountHeader(BuildContext context) {
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

  List<ListTile> _buildDrawerItems(BuildContext context) {
    return homeDrawerItems
      .map<ListTile>((item) => ListTile(
        leading: item.icon != null ? Icon(item.icon) : null,
        title: Text(item.title),
        onTap: () => homeOnDrawerItemTapped(context, item),
      )).toList();
  }

  List<IconButton> _buildActions(BuildContext context) {
    return homeActionItems
      .map<IconButton>((item) => IconButton(
        icon: Icon(item.icon),
        onPressed: () => homeOnActionItemPressed(context, item)
      )).toList();
  }

  List<Tab> _buildTabItems(BuildContext context) {
    return homeTabItems
      .map<Tab>((item) => Tab(
        icon: item.icon != null ? Icon(item.icon) : null,
        text: item.text,
      )).toList();
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(homeTitle),
      actions: _buildActions(context),
      bottom: TabBar(
        tabs: _buildTabItems(context),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          _buildAccountHeader(context),
          Column(
            children: _buildDrawerItems(context)
          )
        ],
      ),
    );
  }

  TabBarView _buildTabBarView(BuildContext context) {
    return TabBarView(
      children: homeTabContents
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: homeTabItems.length,
      child: Scaffold(
        appBar: _buildAppBar(context),
        drawer: _buildDrawer(context),
        body: _buildTabBarView(context)
      )
    );
  }
}
