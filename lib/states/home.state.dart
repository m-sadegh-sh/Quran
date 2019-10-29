import 'package:flutter/material.dart';

import 'package:quran/enumerations/action_child_item_type.dart';
import 'package:quran/containers/about.container.dart';
import 'package:quran/containers/chapter_list.container.dart';
import 'package:quran/containers/bookmark_list.container.dart';
import 'package:quran/containers/settings.container.dart';
import 'package:quran/items/tab.item.dart';
import 'package:quran/containers/help_and_support.container.dart';
import 'package:quran/app_localizations.dart';
import 'package:quran/delegates/generator.delegate.dart';
import 'package:quran/items/drawer.item.dart';
import 'package:quran/items/action.item.dart';
import 'package:quran/items/action_child.item.dart';

class HomeState {
  final GeneratorWNP<String> homeOnGenerateTitle;
  final GeneratorWNP<String> homeOnGenerateAccountName;
  final GeneratorWNP<String> homeOnGenerateAccountEmail;
  final String homeAccountBackgroundImage;
  final bool homeIsSearching;
  final GeneratorWNP<String> homeOnGenerateSearchHintText;
  final String homeSearchQuery;
  final GeneratorWNP<List<DrawerItem>> homeOnGenerateDrawerItems;
  final GeneratorW2P<double, bool, List<ActionItem>> homeOnGenerateActionItems;
  final GeneratorWNP<List<TabItem>> homeOnGenerateTabItems;
  final GeneratorWNP<List<Widget>> homeOnGenerateTabContents;

  HomeState({
    this.homeOnGenerateTitle,
    this.homeOnGenerateAccountName,
    this.homeOnGenerateAccountEmail,
    this.homeAccountBackgroundImage,
    this.homeOnGenerateDrawerItems,
    this.homeIsSearching,
    this.homeOnGenerateSearchHintText,
    this.homeSearchQuery,
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
        onGenerateChild: (BuildContext context) => HelpAndSupportContainer(),
        title: AppLocalizations.of(context).translate('home-drawer-help-and-support'),
        icon: Icons.help
      ),
      DrawerItem(
        onGenerateChild: (BuildContext context) => SettingsContainer(),
        title: AppLocalizations.of(context).translate('home-drawer-settings'),
        icon: Icons.settings
      ),
      DrawerItem(
        onGenerateChild: (BuildContext context) => AboutContainer(),
        title: AppLocalizations.of(context).translate('home-drawer-about'),
        icon: Icons.info
      )
    ],
    homeIsSearching: false,
    homeOnGenerateSearchHintText: (BuildContext context) => AppLocalizations.of(context).translate('home-search-hint-text'),
    homeSearchQuery: null,
    homeOnGenerateActionItems: (BuildContext context, double fontSize, bool homeIsSearching) => [
      ActionItem<HomeState>(
        onUpdateState: (BuildContext context, HomeState state) => state.copyWith(
          homeIsSearching: !state.homeIsSearching,
          homeSearchResetQuery: true
        ),
        tooltip: AppLocalizations.of(context).translate('home-action-search'),
        icon: homeIsSearching ? Icons.close : Icons.search
      ),
      ActionItem(
        tooltip: AppLocalizations.of(context).translate('home-action-more'),
        icon: Icons.more_vert,
        children: [
          ActionChildItem(
            actionChildItemType: ActionChildItemType.ChangeFontSize,
            value: fontSize - 2.0,
            text: AppLocalizations.of(context).translate('home-action-decrease-font-size'),
            icon: Icons.exposure_neg_1,
            enabled: fontSize > 16.0
          ),
          ActionChildItem(
            actionChildItemType: ActionChildItemType.ChangeFontSize,
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

  HomeState copyWith({
    homeOnGenerateTitle,
    homeOnGenerateAccountName,
    homeOnGenerateAccountEmail,
    homeAccountBackgroundImage,
    homeIsSearching,
    homeOnGenerateSearchHintText,
    homeSearchQuery,
    homeSearchResetQuery,
    homeOnGenerateDrawerItems,
    homeOnGenerateActionItems,
    homeOnGenerateTabItems,
    homeOnGenerateTabContents
  }) => HomeState(
    homeOnGenerateTitle : homeOnGenerateTitle ?? this.homeOnGenerateTitle,
    homeOnGenerateAccountName : homeOnGenerateAccountName ?? this.homeOnGenerateAccountName,
    homeOnGenerateAccountEmail : homeOnGenerateAccountEmail ?? this.homeOnGenerateAccountEmail,
    homeAccountBackgroundImage : homeAccountBackgroundImage ?? this.homeAccountBackgroundImage,
    homeIsSearching : homeIsSearching ?? this.homeIsSearching,
    homeOnGenerateSearchHintText : homeOnGenerateSearchHintText ?? this.homeOnGenerateSearchHintText,
    homeSearchQuery : homeSearchResetQuery ?? false ? null : homeSearchQuery ?? this.homeSearchQuery,
    homeOnGenerateDrawerItems : homeOnGenerateDrawerItems ?? this.homeOnGenerateDrawerItems,
    homeOnGenerateActionItems : homeOnGenerateActionItems ?? this.homeOnGenerateActionItems,
    homeOnGenerateTabItems : homeOnGenerateTabItems ?? this.homeOnGenerateTabItems,
    homeOnGenerateTabContents : homeOnGenerateTabContents ?? this.homeOnGenerateTabContents
  );
}