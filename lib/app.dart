import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:Quran/states/app_state.dart';
import 'package:Quran/app_localizations.dart';
import 'package:Quran/containers/home_container.dart';
import 'package:Quran/containers/search_container.dart';
import 'package:Quran/containers/help_and_support_container.dart';
import 'package:Quran/containers/settings_container.dart';
import 'package:Quran/containers/about_container.dart';

class QuranApp extends StatelessWidget {
  final Store<AppState> store;

  QuranApp({Key key, this.store}) : super(key: key);

  Map<String, WidgetBuilder> _getRoutes(BuildContext context) => <String, WidgetBuilder>{
    '/': (BuildContext context) => HomeContainer(),
    '/home': (BuildContext context) => HomeContainer(),
    '/search': (BuildContext context) => SearchContainer(),
    '/help-and-support': (BuildContext context) => HelpAndSupportContainer(),
    '/settings': (BuildContext context) => SettingsContainer(),
    '/about': (BuildContext context) => AboutContainer()
  };

  ThemeData _createTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.teal,
    accentColor: Colors.tealAccent,
    fontFamily: 'IranSans'
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        onGenerateTitle: (context) => AppLocalizations.of(context).translate('app-title'),
        theme: _createTheme(context),
        initialRoute: '/',
        routes: _getRoutes(context),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('fa', 'IR'),
        ]
      )
    );
  }
}
