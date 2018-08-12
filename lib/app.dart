import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';
import 'app_localizations_delegate.dart';

import 'screens/home/index.dart';

class QuranApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => new Home()
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: AppLocalizations.of(context).title,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        accentColor: Colors.tealAccent,
        fontFamily: 'IranSans'
      ),
      initialRoute: '/',
      routes: routes,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fa', 'IR'),
        const Locale('en', 'US'),
      ]
    );
  }
}
