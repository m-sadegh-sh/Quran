import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate = const _AppLocalizationsDelegate();

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _sentences;

  Future<bool> load() async {
    String data = await rootBundle.loadString('assets/resources/${this.locale.languageCode}-${this.locale.countryCode}.json');
    Map<String, dynamic> _result = json.decode(data);

    this._sentences = new Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });

    return true;
  }

  String translate(String key) {
    return this._sentences[key];
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['fa-IR'].contains('${locale.languageCode}-${locale.countryCode}');

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();

    print("Load ${locale.languageCode}-${locale.countryCode}");

    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => true;
}
