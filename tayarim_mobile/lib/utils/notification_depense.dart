import 'package:flutter/material.dart';

import '../models/notification_depense.dart';
import 'date_formatter.dart';

class NotificationDepenseWidget extends StatelessWidget {
  const NotificationDepenseWidget({super.key, required this.content});
  final NotificationDepense content;

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
                "Nouvelle dépense",
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
        Row(
          children: [
            Text(
              style: const TextStyle(
                fontSize: 14,
              ),
              "Appartement : ${content.logementTitre}",
            ),
          ],
        ),
        Row(
          children: [
            Text(
              style: const TextStyle(
                fontSize: 14,
              ),
              "${content.logementAdresse}, ${content.ville}",
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
                    "Libellé : ${content.libelleDepense}",
                  ),
                ]
            ),
            Row(
              children: [
                Text(
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  "Prix : ${content.prix} €",
                ),
              ],
            ),
          ]
      ),
    );
  }
}