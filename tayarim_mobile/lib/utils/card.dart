import 'package:flutter/material.dart';
import 'package:tayarim_mobile/models/notification.dart' as custom_notification;

class NotificationCard extends StatelessWidget {

  const NotificationCard({super.key, required this.notification});
  final custom_notification.Notification notification;

  String getNotificationMessage() {
    switch (notification.message) {
      case 'notification_indisponibilite_creation':
        return 'De nouvelles dates indisponibles ont été ajoutées à votre logement.';
      case 'notification_reservation_creation':
        return 'Une nouvelle reservation a été ajoutée à votre logement.';
      case 'notification_expense_creation':
        return 'Une nouvelle dépense a été ajoutée à votre logement.';
      case 'notification_facture_send':
        return 'Une nouvelle facture a été ajoutée.';
      default:
        return notification.message; // En cas de type inconnu, on retourne le message par défaut
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 16,
              ),
              notification.date
            ),
            subtitle: Text(
              style: const TextStyle(
                fontSize: 16,
              ),
              getNotificationMessage()
            ),
          ),
        ],
      ),
    );
  }
}