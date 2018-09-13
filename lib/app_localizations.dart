import 'dart:async';
import 'dart:convert';
import 'package:Quran/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:Quran/enumerations/chapter_classification.dart';

class AppLocalizations {
  final Locale _locale;
  Map<String, String> _sentences;

  static const LocalizationsDelegate<AppLocalizations> delegate = const _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  AppLocalizations(this._locale) {
    this._sentences = Map<String, String>();
  }

  Future<bool> load() async {
    final key = 'assets/resources/${this._locale.languageCode}_${this._locale.countryCode}.json'.toLowerCase();
    
    String data = await rootBundle.loadString(key);
    Map<String, dynamic> result = json.decode(data);

    result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });

    return true;
  }

  String translate(String key) {
    if (_sentences.containsKey(key))
      return this._sentences[key];

    return '$key not found.';
  }

  String translateFormatted(String key, Map<String, dynamic> params) {
    return StringUtils.format(
      translate(key),
      params
    );
  }

  String translateEnum(ChapterClassification value) {
    return translate(
      StringUtils.toAphenized(value)
    );
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
