import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:quran/app_localizations.dart';
import 'package:quran/delegates/generator.delegate.dart';

class HelpAndSupportState {
  final GeneratorWNP<String> helpAndSupportOnGenerateTitle;
  
  HelpAndSupportState({
    this.helpAndSupportOnGenerateTitle
  });

  factory HelpAndSupportState.initial() {
    return HelpAndSupportState(
      helpAndSupportOnGenerateTitle: (BuildContext context) => AppLocalizations.of(context).translate('helpAndSupport-title')
    );
  }

  HelpAndSupportState copyWith({
    helpAndSupportOnGenerateTitle
  }) => HelpAndSupportState(
    helpAndSupportOnGenerateTitle: helpAndSupportOnGenerateTitle ?? this.helpAndSupportOnGenerateTitle
  );
}