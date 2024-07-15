import 'package:intl/intl.dart';

class DateFormatter {
  static
  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('dd MMMM yyyy', 'fr_FR').format(date);
  }
}