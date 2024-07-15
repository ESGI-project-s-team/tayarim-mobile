import 'package:flutter/material.dart';
import '../models/notification_facture.dart';

class NotificationFactureWidget extends StatelessWidget {
  const NotificationFactureWidget({super.key, required this.content});
  final NotificationFacture content;

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
        "texte",
      ),
    );
  }
}