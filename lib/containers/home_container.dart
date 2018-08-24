import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';
import 'package:Quran/items/drawer_item.dart';
import 'package:Quran/items/action_item.dart';
import 'package:Quran/items/tab_item.dart';
import 'package:Quran/containers/chapter_list_container.dart';
import 'package:Quran/presentation/part_list.dart';
import 'package:Quran/presentation/bookmark_list.dart';
import 'package:Quran/presentation/home.dart';

class HomeContainer extends StatelessWidget {
  String _getTitle(BuildContext context) => AppLocalizations.of(context).translate('home-title');

  List<DrawerItem> _getDrawerItems(BuildContext context) => [
    DrawerItem(routeName: '/help-and-support', title: AppLocalizations.of(context).translate('home-drawer-help-and-support'), icon: Icons.help),
    DrawerItem(routeName: '/settings', title: AppLocalizations.of(context).translate('home-drawer-settings'), icon: Icons.settings),
    DrawerItem(routeName: '/about', title: AppLocalizations.of(context).translate('home-drawer-about'), icon: Icons.info)
  ];

  List<ActionItem> _getActionItems(BuildContext context) => [
    ActionItem(routeName: '/search', icon: Icons.search)
  ];

  List<TabItem> _getTabItems(BuildContext context) => [
    TabItem(text: AppLocalizations.of(context).translate('home-tab-chapters'), icon: Icons.list),
    TabItem(text: AppLocalizations.of(context).translate('home-tab-parts'), icon: Icons.view_module),
    TabItem(text: AppLocalizations.of(context).translate('home-tab-bookmarks'), icon: Icons.bookmark)
  ];
  
  List<Widget> _getTabContents() => [
    ChapterListContainer(),
    PartList(),
    BookmarkList()
  ];

  // _onDrawerTap(DrawerItem item) {
  //   Navigator.pop(context);
  //   Navigator.pushNamed(context, item.routeName);
  // }

  // _onActionPressed(ActionItem item) {
  //   Navigator.pushNamed(context, item.routeName);
  // }

  @override
  Widget build(BuildContext context) {
    return Home(
      title: _getTitle(context),
      accountName: AppLocalizations.of(context).translate('home-drawer-account-name'),
      accountEmail: AppLocalizations.of(context).translate('home-drawer-account-email'),
      accountBackgroundImage: 'assets/images/drawer_background.jpg',
      drawerItems: _getDrawerItems(context),
      actionItems: _getActionItems(context),
      tabItems: _getTabItems(context),
      tabContents : _getTabContents()
    );
  }
}