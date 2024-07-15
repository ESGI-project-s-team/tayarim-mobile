import 'package:flutter/material.dart';
import 'package:tayarim_mobile/models/notification.dart' as custom_notification;
import 'package:tayarim_mobile/models/notification_depense.dart';
import 'package:tayarim_mobile/models/notification_facture.dart';
import 'package:tayarim_mobile/models/notification_indisponibilite.dart';
import 'package:tayarim_mobile/models/notification_reservation.dart';

class NotificationCard extends StatelessWidget {

  const NotificationCard({super.key, required this.notification});
  final custom_notification.Notification notification;

  Object getNotificationContent() {
    switch (notification.type) {
      case 'Indisponibilite':
        NotificationIndisponibilite content = NotificationIndisponibilite.fromMessage(notification.message);
        return content;
      case 'Reservation':
        NotificationReservation content = NotificationReservation.fromMessage(notification.message);
        return content;
      case 'Depense':
        NotificationDepense content = NotificationDepense.fromMessage(notification.message);
        return content;
      case 'facture':
        NotificationFacture content = NotificationFacture.fromMessage(notification.message);
        return content;
      default:
        return notification.type; // En cas de type inconnu, on retourne le message par défaut
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
            subtitle:

            Text(
              style: const TextStyle(
                fontSize: 16,
              )
                getNotificationContent()
            ),
          ),
        ],
      ),
    );
  }
}