import 'package:flutter/material.dart';
import 'package:tayarim_mobile/models/notification.dart' as custom_notification;
import 'package:tayarim_mobile/models/notification_depense.dart';
import 'package:tayarim_mobile/models/notification_facture.dart';
import 'package:tayarim_mobile/models/notification_indisponibilite.dart';
import 'package:tayarim_mobile/models/notification_reservation.dart';
import 'package:tayarim_mobile/utils/notification_indisponibilite.dart';

import 'notification_depense.dart';
import 'notification_facture.dart';
import 'notification_reservation.dart';

class NotificationCard extends StatelessWidget {

  const NotificationCard({super.key, required this.notification});
  final custom_notification.Notification notification;

  Widget getNotificationContent() {
    switch (notification.type) {
      case 'Indisponibilite':
        NotificationIndisponibilite content = NotificationIndisponibilite.fromNotification(notification);
        return NotificationIndisponibiliteWidget(content: content);
      case 'Reservation':
        NotificationReservation content = NotificationReservation.fromNotification(notification);
        return NotificationReservationWidget(content: content);
      case 'Depense':
        // NotificationDepense content = NotificationDepense.fromNotification(notification);
        // return NotificationDepenseWidget(content: content);
      case 'facture':
        // NotificationFacture content = NotificationFacture.fromNotification(notification);
        // return NotificationFactureWidget(content: content);
      default:
        return Text(notification.type); // En cas de type inconnu, on retourne le message par défaut
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          getNotificationContent()
        ],
      ),
    );
  }
}