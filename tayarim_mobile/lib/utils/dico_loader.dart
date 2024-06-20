import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class DicoLoader {
  Future<String> getErrorMessage(String errorCode) async {
    String jsonString = await rootBundle.loadString('assets/Dico_EN.json');
    var map = jsonDecode(jsonString);
    return map[errorCode];
  }
}