import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocaleDetail {
  String label;
  Locale locale;

  LocaleDetail(this.label, this.locale);
}

List<LocaleDetail> appLocales = [
  LocaleDetail('हिंदी', Locale('hi', '')),
  LocaleDetail('English', Locale('en', '')),
  LocaleDetail('অসমীয়া', Locale('as', '')),
  LocaleDetail('বাংলা', Locale('bn', '')),
  LocaleDetail('বাংলা', Locale('bn', '')),
  LocaleDetail('ગુજરાતી', Locale('gu', '')),
  LocaleDetail('ಕನ್ನಡ', Locale('kn', '')),
  LocaleDetail('मराठी', Locale('mr', '')),
  LocaleDetail('ଓଡ଼ିଆ', Locale('or', '')),
  LocaleDetail('ਪੰਜਾਬੀ', Locale('pa', '')),
  LocaleDetail('ਪੰਜਾਬੀ', Locale('pa', '')),
  LocaleDetail('தமிழ்', Locale('ta', '')),
  LocaleDetail('తెలుగు', Locale('te', '')),
  LocaleDetail('اردو', Locale('ur', '')),
];

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key, {Map<String, String> args, String arg}) {
    if (args == null && arg == null) {
      return _localizedStrings[key];
    }

    if (args != null) {
      return args.entries.fold<String>(_localizedStrings[key], (acc, element) {
        acc = acc.replaceAll("{{${element.key}}}", element.value);
        return acc;
      });
    }

    return _localizedStrings[key].replaceAll("{{%s}}", arg);
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return [
      'en',
      'as',
      'bn',
      'gu',
      'hi',
      'kn',
      'mr',
      'or',
      'pa',
      'ta',
      'te',
      'ur',
    ].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
