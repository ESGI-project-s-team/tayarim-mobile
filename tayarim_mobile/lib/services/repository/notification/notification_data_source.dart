import 'package:flutter/cupertino.dart';

abstract class NotificationDataSource {
  Future<List<Notification>> getNotifications(String token);
}