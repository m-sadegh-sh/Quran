import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final String appTitle;
  final ThemeData appTheme;
  final String appInitialRoute;
  final Map<String, WidgetBuilder> appRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;

  App({
    Key key,
    this.appTitle,
    this.appTheme,
    this.appInitialRoute,
    this.appRoutes,
    this.appLocalizationsDelegates,
    this.appSupportedLocales
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: appTitle,
      theme: appTheme,
      initialRoute: appInitialRoute,
      routes: appRoutes,
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales
    );
  }
}
