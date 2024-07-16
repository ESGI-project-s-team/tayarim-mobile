import 'package:flutter/material.dart';
import '../models/notification_facture.dart';
import 'package:tayarim_mobile/utils/translation_loader.dart';
import 'date_formatter.dart';

class NotificationFactureWidget extends StatelessWidget {
  NotificationFactureWidget({super.key, required this.content});
  final NotificationFacture content;

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
                i18n.getTranslation('new_invoice'),
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
                  "${i18n.getTranslation('amount')} : ${content.montant} €",
                ),
              ]
            ),
          ]
      ),
    );
  }
}