import 'dart:convert';

import 'package:flutter/services.dart';

class DicoLoader {
  getErrorMessage(String errorCode) async {
    String jsonString = await rootBundle.loadString('assets/dico/Dico_EN.json');
    var map = jsonDecode(jsonString);
    return map[errorCode];
  }
}