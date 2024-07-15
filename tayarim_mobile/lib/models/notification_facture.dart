import 'notification.dart';

class NotificationFacture extends Notification{
  final String numeroFacture;
  final String montant;
  final String contenu;

  const NotificationFacture({
    required this.numeroFacture,
    required this.montant,
    required this.contenu,
    required super.date,
    required super.message,
    required super.type,
  });

  factory NotificationFacture.fromNotification(Notification notification) {
    List<String> elements = notification.message.split(';');
    String numeroFacture = elements[0];
    String montant = elements[1];
    String contenu = elements[2];
    String date = notification.date;
    String message = notification.message;
    String type = notification.type;

    return NotificationFacture(
      numeroFacture: numeroFacture,
      montant: montant,
      contenu: contenu,
      date: date,
      message: message,
      type: type,
    );
  }
}