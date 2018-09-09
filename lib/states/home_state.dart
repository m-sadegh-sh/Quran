import 'package:Quran/containers/chapter_list_container.dart';
import 'package:Quran/items/tab_item.dart';
import 'package:Quran/presentation/bookmark_list.dart';
import 'package:Quran/presentation/part_list.dart';
import 'package:flutter/material.dart';

import 'package:Quran/app_localizations.dart';
import 'package:Quran/delegates/generate_with_context.dart';
import 'package:Quran/items/drawer_item.dart';
import 'package:Quran/items/action_item.dart';

class HomeState {
  final GenerateWithContext<String> homeOnGenerateTitle;
  final GenerateWithContext<String> homeOnGenerateAccountName;
  final GenerateWithContext<String> homeOnGenerateAccountEmail;
  final String homeAccountBackgroundImage;
  final GenerateWithContext<List<DrawerItem>> homeOnGenerateDrawerItems;
  final GenerateWithContext<List<ActionItem>> homeOnGenerateActionItems;
  final GenerateWithContext<List<TabItem>> homeOnGenerateTabItems;
  final GenerateWithContext<List<Widget>> homeOnGenerateTabContents;

  HomeState({
    this.homeOnGenerateTitle,
    this.homeOnGenerateAccountName,
    this.homeOnGenerateAccountEmail,
    this.homeAccountBackgroundImage,
    this.homeOnGenerateDrawerItems,
    this.homeOnGenerateActionItems,
    this.homeOnGenerateTabItems,
    this.homeOnGenerateTabContents
  });

  factory HomeState.initial() => HomeState(
    homeOnGenerateTitle: (BuildContext context) => AppLocalizations.of(context).translate('home-title'),
    homeOnGenerateAccountName: (BuildContext context) => AppLocalizations.of(context).translate('home-drawer-account-name'),
    homeOnGenerateAccountEmail: (BuildContext context) => AppLocalizations.of(context).translate('home-drawer-account-email'),
    homeAccountBackgroundImage: 'assets/images/drawer_background.jpg',
    homeOnGenerateDrawerItems: (BuildContext context) => [
      DrawerItem(
        routeName: '/help-and-support',
        title: AppLocalizations.of(context).translate('home-drawer-help-and-support'),
        icon: Icons.help
      ),
      DrawerItem(
        routeName: '/settings',
        title: AppLocalizations.of(context).translate('home-drawer-settings'),
        icon: Icons.settings
      ),
      DrawerItem(
        routeName: '/about',
        title: AppLocalizations.of(context).translate('home-drawer-about'),
        icon: Icons.info
      )
    ],
    homeOnGenerateActionItems: (BuildContext context) => [
      ActionItem(
        routeName: '/search',
        tooltip: AppLocalizations.of(context).translate('home-action-search'),
        icon: Icons.search
      )
    ],
    homeOnGenerateTabItems: (BuildContext context) => [
      TabItem(
        text: AppLocalizations.of(context).translate('home-tab-chapters'),
        icon: Icons.list
      ),
      TabItem(
        text: AppLocalizations.of(context).translate('home-tab-parts'),
        icon: Icons.view_module
      ),
      TabItem(
        text: AppLocalizations.of(context).translate('home-tab-bookmarks'),
        icon: Icons.bookmark
      )
    ],
    homeOnGenerateTabContents: (BuildContext context) => [
      ChapterListContainer(),
      PartList(),
      BookmarkList()
    ]
  );
}