import 'dart:ffi';

import 'package:tayarim_mobile/models/notification.dart';

class NotificationReservation extends Notification{
  final String titre;
  final String adresse;
  final String ville;
  final String urlImage;
  final String dateArrivee;
  final String dateDepart;
  final String nbPersonnes;

  const NotificationReservation({
    required this.titre,
    required this.adresse,
    required this.ville,
    required this.urlImage,
    required this.dateArrivee,
    required this.dateDepart,
    required this.nbPersonnes,
    required super.date,
    required super.message,
    required super.type,
  });

  factory NotificationReservation.fromNotification(Notification notification) {
    List<String> elements = notification.message.split(';');
    String titre = elements[0];
    String adresse = elements[1];
    String ville = elements[2];
    String urlImage = elements[3];
    String dateArrivee = elements[4];
    String dateDepart = elements[5];
    String nbPersonnes = elements[6];
    String date = notification.date;
    String message = notification.message;
    String type = notification.type;

    return NotificationReservation(
      titre: titre,
      adresse: adresse,
      ville: ville,
      urlImage: urlImage,
      dateArrivee: dateArrivee,
      dateDepart: dateDepart,
      nbPersonnes: nbPersonnes,
      date: date,
      message: message,
      type: type,
    );
  }
}