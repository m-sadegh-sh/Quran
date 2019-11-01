import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:quran/app_localizations.dart';
import 'package:quran/delegates/generator.delegate.dart';

class AboutState {
  final GeneratorWNP<String> aboutOnGenerateTitle;
  final String aboutBackgroundImage;
  
  AboutState({
    this.aboutOnGenerateTitle,
    this.aboutBackgroundImage
  });

  factory AboutState.initial() {
    return AboutState(
      aboutOnGenerateTitle: (BuildContext context) => AppLocalizations.of(context).translate('about-title'),
      aboutBackgroundImage: 'assets/images/quran_background.png'
    );
  }

  AboutState copyWith({
    aboutOnGenerateTitle,
    aboutBackgroundImage
  }) => AboutState(
    aboutOnGenerateTitle: aboutOnGenerateTitle ?? this.aboutOnGenerateTitle,
    aboutBackgroundImage: aboutBackgroundImage ?? this.aboutBackgroundImage
  );
}