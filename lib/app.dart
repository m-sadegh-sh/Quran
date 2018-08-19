import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:Quran/app_localizations.dart';
import 'package:Quran/screens/home_screen.dart';

class QuranApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{'/': (BuildContext context) => HomeScreen()};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context).translate('app-title'),
        theme: ThemeData(primarySwatch: Colors.teal, accentColor: Colors.tealAccent, fontFamily: 'IranSans'),
        initialRoute: '/',
        routes: routes,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('fa', 'IR'),
        ]);
  }
}
