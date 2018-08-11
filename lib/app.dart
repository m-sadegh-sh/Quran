import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/home/index.dart';

class QuranApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => new Home()
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'قرآن',
      theme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        accentColor: Colors.tealAccent,
        fontFamily: 'IranSans'
      ),
      initialRoute: 'Home',
      routes: routes,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fa', 'IR'),
      ]
    );
  }
}
