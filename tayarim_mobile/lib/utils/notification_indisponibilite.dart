import 'package:flutter/material.dart';
import '../models/notification_indisponibilite.dart';
import 'date_formatter.dart';

class NotificationIndisponibiliteWidget extends StatelessWidget {
  const NotificationIndisponibiliteWidget({super.key, required this.content});

  final NotificationIndisponibilite content;

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
                "Nouvelle indisponibilité",
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
              "Appartement : ${content.titre}",
            ),
          ],
        ),
        Row(
          children: [
            Text(
              style: const TextStyle(
                fontSize: 14,
              ),
              "${content.adresse}, ${content.ville}",
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
                    "Du ${DateFormatter.formatDate(content.dateDebut)}, au ${DateFormatter.formatDate(content.dateFin)}",
                  ),
                ]
            ),
          ]
      ),
    );
  }
}