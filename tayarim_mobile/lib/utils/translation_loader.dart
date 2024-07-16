import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class TranslationLoader {

  static final TranslationLoader _instance = TranslationLoader._internal();
  Map<String, String> _translations = {};

  factory TranslationLoader() {
    return _instance;
  }

  TranslationLoader._internal();

  Future<void> loadTranslations() async {
    String jsonString;
    final String defaultLocale = Platform.localeName;
    print(defaultLocale);

    if (defaultLocale == "fr_FR") {
      jsonString = await rootBundle.loadString('assets/translations/fr.json');
    } else {
      jsonString = await rootBundle.loadString('assets/translations/en.json');
    }

    Map<String, dynamic> map = jsonDecode(jsonString);
    _translations = map.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslation(String key) {
    return _translations[key] ?? 'Translation not found';
  }

  // getTranslations(String translationKey) async {
  //   String jsonString;
  //   final String defaultLocale = Platform.localeName;
  //   print(defaultLocale);
  //   if(defaultLocale == "fr_FR"){
  //     jsonString = await rootBundle.loadString('assets/translations/fr.json');
  //   } else {
  //     jsonString = await rootBundle.loadString('assets/translations/en.json');
  //   }
  //   var map = jsonDecode(jsonString);
  //   return map[translationKey];
  // }
}