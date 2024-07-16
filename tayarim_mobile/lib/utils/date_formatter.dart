import 'dart:io';

import 'package:intl/intl.dart';

class DateFormatter {
  static
  String formatDate(String dateString) {
    final String defaultLocale = Platform.localeName;
    DateTime date = DateTime.parse(dateString);
    return DateFormat('dd MMMM yyyy', defaultLocale).format(date);
  }
}