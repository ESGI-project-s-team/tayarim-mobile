import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class TranslationLoader {
  
  getTranslation(String translationKey) async {
    String jsonString;
    final String defaultLocale = Platform.localeName;
    print(defaultLocale);
    if(defaultLocale == "fr_FR"){
      jsonString = await rootBundle.loadString('assets/translations/fr.json');
    } else {
      jsonString = await rootBundle.loadString('assets/translations/en.json');
    }
    var map = await jsonDecode(jsonString);
    return map[translationKey];
  }
}