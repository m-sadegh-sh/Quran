import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this._locale) {
    this._sentences = Map();
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = const _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  final Locale _locale;
  Map<String, String> _sentences;

  Future<bool> load() async {
    final key = 'assets/resources/${this._locale.languageCode}_${this._locale.countryCode}.json';
    String data = await rootBundle.loadString(key);
    Map<String, String> _result = json.decode(data);

    _result.forEach((String key, String value) {
      this._sentences[key] = value;
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
    var localizations = AppLocalizations(locale);
    
    await localizations.load();

    print('Load ${locale.languageCode}-${locale.countryCode}');

    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => true;
}
