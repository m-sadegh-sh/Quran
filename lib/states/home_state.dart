import 'package:flutter/material.dart';
import 'package:quran/containers/about_container.dart';

import 'package:quran/containers/chapter_list_container.dart';
import 'package:quran/containers/search_container.dart';
import 'package:quran/containers/settings_container.dart';
import 'package:quran/containers/share_container.dart';
import 'package:quran/items/tab_item.dart';
import 'package:quran/presentation/bookmark_list.dart';
import 'package:quran/containers/help_and_support_container.dart';
import 'package:quran/presentation/part_list.dart';
import 'package:quran/app_localizations.dart';
import 'package:quran/delegates/generate_with_context.dart';
import 'package:quran/items/drawer_item.dart';
import 'package:quran/items/action_item.dart';
import 'package:quran/items/action_child_item.dart';

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
    homeAccountBackgroundImage: 'assets/images/quran_background.png',
    homeOnGenerateDrawerItems: (BuildContext context) => [
      DrawerItem(
        routeName: ShareContainer.routeName,
        title: AppLocalizations.of(context).translate('home-drawer-share'),
        icon: Icons.share
      ),
      DrawerItem(
        routeName: HelpAndSupportContainer.routeName,
        title: AppLocalizations.of(context).translate('home-drawer-help-and-support'),
        icon: Icons.help
      ),
      DrawerItem(
        routeName: SettingsContainer.routeName,
        title: AppLocalizations.of(context).translate('home-drawer-settings'),
        icon: Icons.settings
      ),
      DrawerItem(
        routeName: AboutContainer.routeName,
        title: AppLocalizations.of(context).translate('home-drawer-about'),
        icon: Icons.info
      )
    ],
    homeOnGenerateActionItems: (BuildContext context) => [
      ActionItem(
        routeName: SearchContainer.routeName,
        tooltip: AppLocalizations.of(context).translate('home-action-search'),
        icon: Icons.search
      ),
      ActionItem(
        tooltip: AppLocalizations.of(context).translate('home-action-more'),
        icon: Icons.more_vert,
        children: [
          ActionChildItem(
            value: SearchContainer.routeName,
            text: AppLocalizations.of(context).translate('home-action-decrease-font-size'),
            icon: Icons.exposure_neg_1
          ),
          ActionChildItem(
            value: SearchContainer.routeName,
            text: AppLocalizations.of(context).translate('home-action-increase-font-size'),
            icon: Icons.exposure_plus_1
          )
        ]
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