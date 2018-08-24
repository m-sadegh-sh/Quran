import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final GenerateAppTitle onGenerateTitle;
  final ThemeData theme;
  final String initialRoute;
  final Map<String, WidgetBuilder> routes;
  final List<LocalizationsDelegate> localizationsDelegates;
  final List<Locale> supportedLocales;

  App({
    Key key,
    this.onGenerateTitle,
    this.theme,
    this.initialRoute,
    this.routes,
    this.localizationsDelegates,
    this.supportedLocales
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      onGenerateTitle: onGenerateTitle,
      theme: theme,
      initialRoute: initialRoute,
      routes: routes,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales
    );
  }
}
