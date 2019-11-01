import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:quran/app_localizations.dart';
import 'package:quran/delegates/generator.delegate.dart';

class HelpAndSupportState {
  final GeneratorWNP<String> helpAndSupportOnGenerateTitle;
  final String helpAndSupportBackgroundImage;
  
  HelpAndSupportState({
    this.helpAndSupportOnGenerateTitle,
    this.helpAndSupportBackgroundImage
  });

  factory HelpAndSupportState.initial() {
    return HelpAndSupportState(
      helpAndSupportOnGenerateTitle: (BuildContext context) => AppLocalizations.of(context).translate('help-and-support-title'),
      helpAndSupportBackgroundImage: 'assets/images/quran_background.png'
    );
  }

  HelpAndSupportState copyWith({
    helpAndSupportOnGenerateTitle,
    helpAndSupportBackgroundImage
  }) => HelpAndSupportState(
    helpAndSupportOnGenerateTitle: helpAndSupportOnGenerateTitle ?? this.helpAndSupportOnGenerateTitle,
    helpAndSupportBackgroundImage: helpAndSupportBackgroundImage ?? this.helpAndSupportBackgroundImage
  );
}