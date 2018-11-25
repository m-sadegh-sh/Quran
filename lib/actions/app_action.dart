class AppSharedPreferencesLoadAction { }

class AppSharedPreferencesLoadSucceededAction {
  final String appThemeFontFamily;
  final double appThemeFontSizeFactor;
  final String appLocaleLanguageCode;
  final String appLocaleCountryCode;
  final int appTranslatorId;

  AppSharedPreferencesLoadSucceededAction({
    this.appThemeFontFamily,
    this.appThemeFontSizeFactor,
    this.appLocaleLanguageCode,
    this.appLocaleCountryCode,
    this.appTranslatorId
  });
}

class AppSharedPreferencesPersistAction {
  final String appThemeFontFamily;
  final double appThemeFontSizeFactor;
  final String appLocaleLanguageCode;
  final String appLocaleCountryCode;
  final int appTranslatorId;

  AppSharedPreferencesPersistAction({
    this.appThemeFontFamily,
    this.appThemeFontSizeFactor,
    this.appLocaleLanguageCode,
    this.appLocaleCountryCode,
    this.appTranslatorId
  });
}

class AppSharedPreferencesPersistSucceededAction { }