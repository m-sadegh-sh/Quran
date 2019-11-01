import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:quran/app_localizations.dart';
import 'package:quran/delegates/generator.delegate.dart';

class AboutState {
  final GeneratorWNP<String> aboutOnGenerateTitle;
  
  AboutState({
    this.aboutOnGenerateTitle
  });

  factory AboutState.initial() {
    return AboutState(
      aboutOnGenerateTitle: (BuildContext context) => AppLocalizations.of(context).translate('about-title')
    );
  }

  AboutState copyWith({
    aboutOnGenerateTitle
  }) => AboutState(
    aboutOnGenerateTitle: aboutOnGenerateTitle ?? this.aboutOnGenerateTitle
  );
}