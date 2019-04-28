import 'package:flutter/material.dart';
import 'package:quran/containers/about_container.dart';

import 'package:quran/containers/chapter_list_container.dart';
import 'package:quran/containers/bookmark_list_container.dart';
import 'package:quran/containers/settings_container.dart';
import 'package:quran/items/tab_item.dart';
import 'package:quran/containers/help_and_support_container.dart';
import 'package:quran/app_localizations.dart';
import 'package:quran/delegates/generators.dart';
import 'package:quran/items/drawer_item.dart';
import 'package:quran/items/action_item.dart';
import 'package:quran/items/action_child_item.dart';

class HomeState {
  final GeneratorWNP<String> homeOnGenerateTitle;
  final GeneratorWNP<String> homeOnGenerateAccountName;
  final GeneratorWNP<String> homeOnGenerateAccountEmail;
  final String homeAccountBackgroundImage;
  final GeneratorWNP<List<DrawerItem>> homeOnGenerateDrawerItems;
  final GeneratorW1P<double, List<ActionItem>> homeOnGenerateActionItems;
  final GeneratorWNP<List<TabItem>> homeOnGenerateTabItems;
  final GeneratorWNP<List<Widget>> homeOnGenerateTabContents;

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
    homeOnGenerateActionItems: (BuildContext context, double fontSize) => [
      ActionItem(
        tooltip: AppLocalizations.of(context).translate('home-action-search'),
        icon: Icons.search
      ),
      ActionItem(
        tooltip: AppLocalizations.of(context).translate('home-action-more'),
        icon: Icons.more_vert,
        children: [
          ActionChildItem(
            actionName: 'change-font-size',
            value: fontSize - 2.0,
            text: AppLocalizations.of(context).translate('home-action-decrease-font-size'),
            icon: Icons.exposure_neg_1,
            enabled: fontSize > 16.0
          ),
          ActionChildItem(
            actionName: 'change-font-size',
            value: fontSize + 2.0,
            text: AppLocalizations.of(context).translate('home-action-increase-font-size'),
            icon: Icons.exposure_plus_1,
            enabled: fontSize < 24.0
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
        text: AppLocalizations.of(context).translate('home-tab-bookmarks'),
        icon: Icons.bookmark
      )
    ],
    homeOnGenerateTabContents: (BuildContext context) => [
      ChapterListContainer(),
      BookmarkListContainer()
    ]
  );
}