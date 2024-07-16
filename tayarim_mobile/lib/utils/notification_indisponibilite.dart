import 'package:flutter/material.dart';
import 'package:tayarim_mobile/utils/translation_loader.dart';
import '../models/notification_indisponibilite.dart';
import 'date_formatter.dart';

class NotificationIndisponibiliteWidget extends StatelessWidget {
  NotificationIndisponibiliteWidget({super.key, required this.content});

  final NotificationIndisponibilite content;

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
                i18n.getTranslation('new_unavailable'),
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
              "${i18n.getTranslation('new_unavailable')} : ${content.titre}",
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
                    "${i18n.getTranslation('from')} ${DateFormatter.formatDate(content.dateDebut)}, ${i18n.getTranslation('to')} ${DateFormatter.formatDate(content.dateFin)}",
                  ),
                ]
            ),
          ]
      ),
    );
  }
}