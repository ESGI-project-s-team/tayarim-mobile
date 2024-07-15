import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/notification_reservation.dart';

class NotificationReservationWidget extends StatelessWidget {
  const NotificationReservationWidget({super.key, required this.content});

  final NotificationReservation content;

  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('dd MMMM yyyy', 'fr_FR').format(date);
  }

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
                "Nouvelle réservation",
              ),
            ),
            Text(
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 14,
                ),
                formatDate(content.date)
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
                "Du ${formatDate(content.dateArrivee)}, au ${formatDate(content.dateDepart)}",
              ),
            ]
          ),
          Row(
            children: [
              Text(
                style: const TextStyle(
                  fontSize: 14,
                ),
                int.parse(content.nbPersonnes) > 1  ? "${content.nbPersonnes} voyageurs" : "${content.nbPersonnes} voyageur",
              ),
            ],
          ),
        ]
      ),
    );
  }
}
