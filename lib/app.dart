import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:Quran/app_localizations.dart';
import 'package:Quran/screens/home_screen.dart';
import 'package:Quran/screens/search_screen.dart';
import 'package:Quran/screens/help_and_support_screen.dart';
import 'package:Quran/screens/settings_screen.dart';
import 'package:Quran/screens/about_screen.dart';

class QuranApp extends StatelessWidget {
  Map<String, WidgetBuilder> _getRoutes(BuildContext context) => <String, WidgetBuilder>{
    '/': (BuildContext context) => HomeScreen(),
    '/search': (BuildContext context) => SearchScreen(),
    '/help-and-support': (BuildContext context) => HelpAndSupportScreen(),
    '/settings': (BuildContext context) => SettingsScreen(),
    '/about': (BuildContext context) => AboutScreen()
  };

  ThemeData _createTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.teal,
    accentColor: Colors.tealAccent,
    fontFamily: 'IranSans'
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
