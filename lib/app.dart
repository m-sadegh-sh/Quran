import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:Quran/app_localizations.dart';
import 'package:Quran/screens/home_screen.dart';

class QuranApp extends StatelessWidget {
  _getRoutes(BuildContext context) => <String, WidgetBuilder>{
    '/': (BuildContext context) => HomeScreen()
  };

  _createTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.teal,
    accentColor: Colors.tealAccent,
    fontFamily: 'IranSans'
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
