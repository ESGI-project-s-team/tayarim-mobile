import 'package:flutter/material.dart';

import '../models/notification_depense.dart';

class NotificationDepenseWidget extends StatelessWidget {
  const NotificationDepenseWidget({super.key, required this.content});
  final NotificationDepense content;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 16,
        ),
        content.date
      ),
      subtitle: const Text(
        style: TextStyle(
          fontSize: 16,
        ),
        'texte',
      ),
    );
  }
}