import 'notification.dart';

class NotificationDepense extends Notification{
  final String logementTitre;
  final String logementAdresse;
  final String ville;
  final String urlImage;
  final String libelleDepense;
  final String prix;

  const NotificationDepense({
    required this.logementTitre,
    required this.logementAdresse,
    required this.ville,
    required this.urlImage,
    required this.libelleDepense,
    required this.prix,
    required super.date,
    required super.message,
    required super.type,
  });

  factory NotificationDepense.fromNotification(Notification notification) {
    List<String> elements = notification.message.split(';');
    String logementTitre = elements[0];
    String logementAdresse = elements[1];
    String ville = elements[2];
    String urlImage = elements[3];
    String libelleDepense = elements[4];
    String prix = elements[5];
    String date = notification.date;
    String message = notification.message;
    String type = notification.type;

    return NotificationDepense(
      logementTitre: logementTitre,
      logementAdresse: logementAdresse,
      ville: ville,
      urlImage: urlImage,
      libelleDepense: libelleDepense,
      prix: prix,
      date: date,
      message: message,
      type: type,
    );
  }
}