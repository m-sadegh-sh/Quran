import 'package:flutter/material.dart';

import 'package:Quran/delegates/generate_app_action_items.dart';
import 'package:Quran/delegates/generate_app_drawer_items.dart';
import 'package:Quran/delegates/generate_app_tab_contents.dart';
import 'package:Quran/delegates/generate_app_tab_items.dart';
import 'package:Quran/delegates/generate_localized_string.dart';
import 'package:Quran/items/action_item.dart';
import 'package:Quran/items/drawer_item.dart';

class Home extends StatelessWidget {  
  final GenerateLocalizedString homeOnGenerateTitle;
  final GenerateLocalizedString homeOnGenerateAccountName;
  final GenerateLocalizedString homeOnGenerateAccountEmail;
  final String homeAccountBackgroundImage;
  final GenerateAppDrawerItems homeOnGenerateDrawerItems;
  final Function(BuildContext, DrawerItem) homeOnDrawerItemTapped;
  final GenerateAppActionItems homeOnGenerateActionItems;
  final Function(BuildContext, ActionItem) homeOnActionItemPressed;
  final GenerateAppTabItems homeOnGenerateTabItems;
  final GenerateAppTabContents homeOnGenerateTabContents;

  Home({
    Key key,
    this.homeOnGenerateTitle,
    this.homeOnGenerateAccountName,
    this.homeOnGenerateAccountEmail,
    this.homeAccountBackgroundImage,
    this.homeOnGenerateDrawerItems,
    this.homeOnDrawerItemTapped,
    this.homeOnGenerateActionItems,
    this.homeOnActionItemPressed,
    this.homeOnGenerateTabItems,
    this.homeOnGenerateTabContents
  }) : super(key: key);

  UserAccountsDrawerHeader _createAccountHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(homeOnGenerateAccountName(context)),
      accountEmail: Text(homeOnGenerateAccountEmail(context)),
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
    return homeOnGenerateDrawerItems(context)
      .map<ListTile>((item) => ListTile(
        leading: item.icon != null ? Icon(item.icon) : null,
        title: Text(item.title),
        onTap: () => homeOnDrawerItemTapped(context, item),
      )).toList();
  }

  List<IconButton> _createActions(BuildContext context) {
    return homeOnGenerateActionItems(context)
      .map<IconButton>((item) => IconButton(
        icon: Icon(item.icon),
        onPressed: () => homeOnActionItemPressed(context, item)
      )).toList();
  }

  List<Tab> _createTabItems(BuildContext context) {
    return homeOnGenerateTabItems(context)
      .map<Tab>((item) => Tab(
        icon: item.icon != null ? Icon(item.icon) : null,
        text: item.text,
      )).toList();
  }

  AppBar _getAppBarWidget(BuildContext context) {
    return AppBar(
      title: Text(homeOnGenerateTitle(context)),
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
      children: homeOnGenerateTabContents(context)
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: homeOnGenerateTabItems(context).length,
      child: Scaffold(
        appBar: _getAppBarWidget(context),
        drawer: _getDrawerWidget(context),
        body: _getTabBarViewWidget(context)
      )
    );
  }
}
