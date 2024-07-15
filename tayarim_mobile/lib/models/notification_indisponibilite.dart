import 'notification.dart';

class NotificationIndisponibilite extends Notification{
  final String titre;
  final String adresse;
  final String ville;
  final String urlImage;
  final String dateDebut;
  final String dateFin;

  const NotificationIndisponibilite({
    required this.titre,
    required this.adresse,
    required this.ville,
    required this.urlImage,
    required this.dateDebut,
    required this.dateFin,
    required super.date,
    required super.message,
    required super.type,
  });

  factory NotificationIndisponibilite.fromNotification(Notification notification) {
    List<String> elements = notification.message.split(';');
    String titre = elements[0];
    String adresse = elements[1];
    String ville = elements[2];
    String urlImage = elements[3];
    String dateDebut = elements[4];
    String dateFin = elements[5];
    String date = notification.date;
    String message = notification.message;
    String type = notification.type;

    return NotificationIndisponibilite(
      titre: titre,
      adresse: adresse,
      ville: ville,
      urlImage: urlImage,
      dateDebut: dateDebut,
      dateFin: dateFin,
      date: date,
      message: message,
      type: type,
    );
  }
}
