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
  final Function(BuildContext, String, int) homeOnSearchQueryChanging;
  final List<ActionItem> homeActionItems;
  final Function(BuildContext, ActionItem) homeOnActionItemPressed;
  final Function(BuildContext, ActionChildItem) homeOnActionChildItemPressed;
  final List<TabItem> homeTabItems;
  final List<Widget> homeTabContents;
  final int settingsTranslatorId;

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
    this.homeOnSearchQueryChanging,
    this.homeActionItems,
    this.homeOnActionItemPressed,
    this.homeOnActionChildItemPressed,
    this.homeTabItems,
    this.homeTabContents,
    this.settingsTranslatorId
  }) : super(key: key);

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
                  children: [
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
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.circular(10.0)
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 60.0
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0
          ),
          child: TextFormField(
            keyboardType: TextInputType.text,
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: homeSearchHintText,
              hintStyle: Theme.of(context).textTheme.headline.apply(
                color: Theme.of(context).textSelectionColor
              ),
            ),
            style: Theme.of(context).textTheme.headline,
            initialValue: homeSearchQuery,
            onFieldSubmitted: (String text) => homeOnSearchQueryChanging(context, text, settingsTranslatorId),
            textInputAction: TextInputAction.search
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
        children: [
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
