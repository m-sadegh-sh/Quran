import 'package:flutter/material.dart';

import 'package:quran/items/drawer.item.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/action_child.item.dart';
import 'package:quran/items/tab.item.dart';

class HomeScreen extends StatelessWidget {  
  final String homeTitle;
  final String homeAccountName;
  final String homeAccountEmail;
  final String homeAccountBackgroundImage;
  final List<DrawerItem> homeDrawerItems;
  final Function(BuildContext, DrawerItem) homeOnDrawerItemTapped;
  final bool homeIsSearching;
  final String homeSearchHintText;
  final String homeSearchQuery;
  final Function(BuildContext, String) homeOnSearchQueryChanged;
  final TextEditingController homeSearchQueryController;
  final List<ActionItem> homeActionItems;
  final Function(BuildContext, ActionItem) homeOnActionItemPressed;
  final Function(BuildContext, ActionChildItem) homeOnActionChildItemPressed;
  final List<TabItem> homeTabItems;
  final List<Widget> homeTabContents;
  final Function(BuildContext) homeOnFloatingActionButtonPressed;

  HomeScreen({
    Key key,
    this.homeTitle,
    this.homeAccountName,
    this.homeAccountEmail,
    this.homeAccountBackgroundImage,
    this.homeDrawerItems,
    this.homeOnDrawerItemTapped,
    this.homeIsSearching,
    this.homeSearchHintText,
    this.homeSearchQuery,
    this.homeOnSearchQueryChanged,
    this.homeSearchQueryController,
    this.homeActionItems,
    this.homeOnActionItemPressed,
    this.homeOnActionChildItemPressed,
    this.homeTabItems,
    this.homeTabContents,
    this.homeOnFloatingActionButtonPressed
  }) : super(key: key) {
    homeSearchQueryController.addListener(_homeSearchQueryControllerOnChange);
  }

  void _homeSearchQueryControllerOnChange() {
    homeOnSearchQueryChanged(null, homeSearchQueryController.text);
  }

  UserAccountsDrawerHeader _buildAccountHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        homeAccountName,
        style: Theme.of(context).textTheme.headline
      ),
      accountEmail: Text(
        homeAccountEmail,
        style: Theme.of(context).textTheme.display2
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
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
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.display3,
        ),
        onTap: () => homeOnDrawerItemTapped(context, item),
      )).toList();
  }

  List<Widget> _buildActions(BuildContext context) {
    return homeActionItems
      .map<Widget>((item) {
        if (item.children == null)
          return IconButton(
            icon: Icon(item.icon),
            tooltip: item.tooltip,
            onPressed: () => homeOnActionItemPressed(context, item)
          );

        return PopupMenuButton(
          offset: Offset(0, kToolbarHeight),
          icon: Icon(item.icon),
          tooltip: item.tooltip,
          itemBuilder: (BuildContext context) {
            return item.children.map((ActionChildItem child) {
              return PopupMenuItem<ActionChildItem>(
                enabled: child.enabled,
                value: child,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 15.0),
                      child: Icon(
                        child.icon,
                        color: Theme.of(context).textTheme.display3.color.withOpacity(0.45)
                      )
                    ),
                    Text(
                      child.text,
                      style: Theme.of(context).textTheme.display3,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center
                    )
                  ]
                )
              );
            }).toList();
          },
          onSelected: (ActionChildItem item) => homeOnActionChildItemPressed(context, item),
        );
      }).toList();
  }

  List<Tab> _buildTabItems(BuildContext context) {
    return homeTabItems
      .map<Tab>((item) => Tab(
        icon: item.icon != null ? Icon(item.icon) : null,
        text: item.text,
      )).toList();
  }

  AppBar _buildAppBar(BuildContext context) {
    if (homeIsSearching) {
      return AppBar(
        title: Container(
          alignment: Alignment.center,
          color: Theme.of(context).appBarTheme.color,
          child: TextField(
            keyboardType: TextInputType.text,
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: homeSearchHintText,
              hintStyle: Theme.of(context).textTheme.headline,
            ),
            controller: homeSearchQueryController,
            //onChanged: (String text) => homeOnSearchQueryChanged(context, text),
            textInputAction: TextInputAction.search,
            cursorRadius: Radius.circular(5.0),
          )
        ),
        actions: _buildActions(context),
        bottom: TabBar(
          tabs: _buildTabItems(context),
        ),
      );
    }

    return AppBar(
      title: Text(
        homeTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline
      ),
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

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.refresh),
      onPressed: () => homeOnFloatingActionButtonPressed(context)
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: homeTabItems.length,
      child: Scaffold(
        appBar: _buildAppBar(context),
        drawer: _buildDrawer(context),
        body: _buildTabBarView(context),
        floatingActionButton: _buildFloatingActionButton(context)
      )
    );
  }
}
