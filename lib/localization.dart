import 'package:flutter/material.dart';

class AppLocalizations {
  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'search_hint': 'Search Movies',
      'no_movies': 'No movies found.',
      'retry': 'Retry',
    },
    'ru': {
      'search_hint': 'Искать фильмы',
      'no_movies': 'Фильмы не найдены.',
      'retry': 'Повторить',
    },
  };

  static String of(BuildContext context, String key) {
    Locale locale = Localizations.localeOf(context);
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}
