import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class TranslationLoader {
  getTranslation(String translationKey) async {
    String jsonString;
    final String defaultLocale = Platform.localeName;
    print(defaultLocale);
    if(defaultLocale == "FR"){
      jsonString = await rootBundle.loadString('assets/traductions/fr.json');
    } else {
      jsonString = await rootBundle.loadString('assets/traductions/en.json');
    }
    var map = jsonDecode(jsonString);
    return map[translationKey];
  }
}