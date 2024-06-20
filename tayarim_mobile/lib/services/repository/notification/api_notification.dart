import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'notification_data_source.dart';

class ApiNotification extends NotificationDataSource {
  final dio = Dio(
    BaseOptions(baseUrl: '${dotenv.env['API_URL']}/notification'),
  );

  @override
  Future<List<Notification>> getNotifications(String token) async {
    Response<dynamic> response = await dio
        .get('/all',
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            }))
        .catchError((error) => throw error.response.data['message']);
    return (response.data);
        // .map((notification) => Notification.fromJson(notification))
        // .toList();
  }

  Future<void> deleteNotification(String token, int id) async {
    await dio.delete('/delete/$id',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));
  }
}