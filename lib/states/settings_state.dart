class SettingsState {
  final String settingsThemeQuraniFontFamily;
  final double settingsThemeQuraniFontSize;
  final String settingsLocaleLanguageCode;
  final String settingsLocaleCountryCode;
  final int settingsTranslatorId;
  
  SettingsState({
    this.settingsThemeQuraniFontFamily,
    this.settingsThemeQuraniFontSize,
    this.settingsLocaleLanguageCode,
    this.settingsLocaleCountryCode,
    this.settingsTranslatorId
  });

  factory SettingsState.initial() {
    return SettingsState(
      settingsThemeQuraniFontFamily: 'Nabi',
      settingsThemeQuraniFontSize: 16.0,
      settingsLocaleLanguageCode: 'fa',
      settingsLocaleCountryCode: 'IR',
      settingsTranslatorId: 1
    );
  }
  
  SettingsState copyWith({
    String settingsThemeQuraniFontFamily,
    double settingsThemeQuraniFontSize,
    String settingsLocaleLanguageCode,
    String settingsLocaleCountryCode,
    int settingsTranslatorId
  }) => SettingsState(
    settingsThemeQuraniFontFamily: settingsThemeQuraniFontFamily ?? this.settingsThemeQuraniFontFamily,
    settingsThemeQuraniFontSize: settingsThemeQuraniFontSize ?? this.settingsThemeQuraniFontSize,
    settingsLocaleLanguageCode: settingsLocaleLanguageCode ?? this.settingsLocaleLanguageCode,
    settingsLocaleCountryCode: settingsLocaleCountryCode ?? this.settingsLocaleCountryCode,
    settingsTranslatorId: settingsTranslatorId ?? this.settingsTranslatorId
  );
}