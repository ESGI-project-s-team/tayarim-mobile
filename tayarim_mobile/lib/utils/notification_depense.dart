import 'package:flutter/material.dart';
import 'package:tayarim_mobile/utils/translation_loader.dart';

import '../models/notification_depense.dart';
import 'date_formatter.dart';

class NotificationDepenseWidget extends StatelessWidget {
  NotificationDepenseWidget({super.key, required this.content});
  final NotificationDepense content;

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
                i18n.getTranslation('password_hint'),
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
              "${i18n.getTranslation('house')} : ${content.logementTitre}",
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
                    "${i18n.getTranslation('label')} : ${content.libelleDepense}",
                  ),
                ]
            ),
            Row(
              children: [
                Text(
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  "${i18n.getTranslation('price')} : ${content.prix} €",
                ),
              ],
            ),
          ]
      ),
    );
  }
}