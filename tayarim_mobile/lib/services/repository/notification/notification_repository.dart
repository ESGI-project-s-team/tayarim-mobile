import 'package:tayarim_mobile/models/notification.dart';
import 'notification_data_source.dart';

class NotificationRepository {
  final NotificationDataSource notificationDataSource;

  NotificationRepository({required this.notificationDataSource});

  Future<List<Notification>> getNotifications(Notification notification) async {
    return notificationDataSource.getNotifications();
  }
}
