import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

import 'screens/home/index.dart';

class QuranApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => new Home(title: AppLocalizations.of(context).translate('home-title'))
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).translate('app-title'),
      theme: new ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.tealAccent,
        fontFamily: 'IranSans'
      ),
      initialRoute: '/',
      routes: routes,
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
