import 'package:flutter/material.dart';
import '../models/notification_indisponibilite.dart';

class NotificationIndisponibiliteWidget extends StatelessWidget {
  const NotificationIndisponibiliteWidget({super.key, required this.content});

  final NotificationIndisponibilite content;

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