import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TranslationKey {
  static const MapEntry homePageLabel = MapEntry('home', 'label');
  static const MapEntry homePageTooltip = MapEntry('home', 'tooltip');
}

class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();

  static AppLocalization of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization);

  Map<String, Map<String, String>> _localizedStrings;

  Future<bool> load() async {
    var jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap
        .map((key, value) => MapEntry(key, Map<String, String>.from(value)));

    return true;
  }

  String translate(MapEntry translationKey) =>
      _localizedStrings[translationKey.key][translationKey.value];
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  // TODO: Change with supported locales
  @override
  bool isSupported(Locale locale) => ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) async {
    var localization = AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}
