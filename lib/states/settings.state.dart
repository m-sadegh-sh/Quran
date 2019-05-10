class SettingsState {
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeFontSize;
  final String settingsLocaleLanguageCode;
  final String settingsLocaleCountryCode;
  final int settingsTranslatorId;
  
  SettingsState({
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeFontSize,
    this.settingsLocaleLanguageCode,
    this.settingsLocaleCountryCode,
    this.settingsTranslatorId
  });

  factory SettingsState.initial() {
    return SettingsState(
      settingsThemeQuraniFontFamily: 'Nabi',
      settingsThemeFontSize: 16.0,
      settingsLocaleLanguageCode: 'fa',
      settingsLocaleCountryCode: 'IR',
      settingsTranslatorId: 1
    );
  }
  
  SettingsState copyWith({
    String settingsThemeQuraniFontFamily,
    double settingsThemeFontSize,
    String settingsLocaleLanguageCode,
    String settingsLocaleCountryCode,
    int settingsTranslatorId
  }) => SettingsState(
    settingsThemeQuraniFontFamily: settingsThemeQuraniFontFamily ?? this.settingsThemeQuraniFontFamily,
    settingsThemeFontSize: settingsThemeFontSize ?? this.settingsThemeFontSize,
    settingsLocaleLanguageCode: settingsLocaleLanguageCode ?? this.settingsLocaleLanguageCode,
    settingsLocaleCountryCode: settingsLocaleCountryCode ?? this.settingsLocaleCountryCode,
    settingsTranslatorId: settingsTranslatorId ?? this.settingsTranslatorId
  );
}