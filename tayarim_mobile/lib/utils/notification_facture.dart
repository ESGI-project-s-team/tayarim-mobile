import 'package:flutter/material.dart';
import '../models/notification_facture.dart';
import 'date_formatter.dart';

class NotificationFactureWidget extends StatelessWidget {
  const NotificationFactureWidget({super.key, required this.content});
  final NotificationFacture content;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                style: TextStyle(
                  fontSize: 16,
                ),
                "Nouvelle facture disponible",
              ),
            ),
            Text(
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
              ),
              DateFormatter.formatDate(content.date)
            ),
          ],
        ),
      ]),
      subtitle: Column(
          children: [
            Row(
              children:[
                Text(
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  "N° ${content.numeroFacture}",
                ),
              ]
            ),
            Row(
              children:[
                Text(
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  "Montant : ${content.montant} €",
                ),
              ]
            ),
          ]
      ),
    );
  }
}