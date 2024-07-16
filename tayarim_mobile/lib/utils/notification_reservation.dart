import 'package:flutter/material.dart';
import 'package:tayarim_mobile/utils/translation_loader.dart';
import '../models/notification_reservation.dart';
import 'date_formatter.dart';

class NotificationReservationWidget extends StatelessWidget {
  NotificationReservationWidget({super.key, required this.content});

  final NotificationReservation content;

  final i18n = TranslationLoader();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(children: [
        Row(
          children: [
            Expanded(
              child: Text(
                style: const TextStyle(
                  fontSize: 16,
                ),
                i18n.getTranslation('new_reservation'),
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
              "${i18n.getTranslation('house')} : ${content.titre}",
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
                "${i18n.getTranslation('from')} ${DateFormatter.formatDate(content.dateArrivee)}, ${i18n.getTranslation('to')} ${DateFormatter.formatDate(content.dateDepart)}",
              ),
            ]
          ),
          Row(
            children: [
              Text(
                style: const TextStyle(
                  fontSize: 14,
                ),
                int.parse(content.nbPersonnes) > 1  ? "${content.nbPersonnes} ${i18n.getTranslation('travelers')}" : "${content.nbPersonnes} ${i18n.getTranslation('traveler')}",
              ),
            ],
          ),
        ]
      ),
    );
  }
}
