import '../../../models/notification.dart';

abstract class NotificationDataSource {
  Future<List<Notification>> getNotifications();
}
