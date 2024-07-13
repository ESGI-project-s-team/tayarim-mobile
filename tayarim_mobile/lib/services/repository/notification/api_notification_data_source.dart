import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tayarim_mobile/models/notification.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'notification_data_source.dart';

class ApiNotificationDataSource extends NotificationDataSource {
  final _storage = const FlutterSecureStorage();
  final dio = Dio(
    BaseOptions(baseUrl: '${dotenv.env['API_URL']}/auth'),
  );

  @override
  Future<List<Notification>> getNotifications() async {
    final String? accessToken = await _storage.read(key: 'accessToken');

    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    Response<dynamic> response =
      await dio.post('/notifications').catchError((error) {
      log(error.toString());
      throw error.response.data['message'];
    });
    List<Notification> notifications = response.data.map((x) => Notification.fromJson(x)).toList();
    return notifications;
  }
}
