import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final GenerateAppTitle appOnGenerateTitle;
  final ThemeData appTheme;
  final String appInitialRoute;
  final Map<String, WidgetBuilder> appRoutes;
  final List<LocalizationsDelegate> appLocalizationsDelegates;
  final List<Locale> appSupportedLocales;
  final Locale appLocale;

  App({
      Key key,
      this.appOnGenerateTitle,
      this.appTheme,
      this.appInitialRoute,
      this.appRoutes,
      this.appLocalizationsDelegates,
      this.appSupportedLocales,
      this.appLocale
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      onGenerateTitle: appOnGenerateTitle,
      theme: appTheme,
      initialRoute: appInitialRoute,
      routes: appRoutes,
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales,
      locale: appLocale,
    );
  }
}
