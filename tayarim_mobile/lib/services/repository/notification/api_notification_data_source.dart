import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tayarim_mobile/models/notification.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'notification_data_source.dart';

class ApiNotificationDataSource extends NotificationDataSource {
  final _storage = const FlutterSecureStorage();
  final dio = Dio(
    BaseOptions(baseUrl: '${dotenv.env['API_URL']}'),
  );

  @override
  Future<List<Notification>> getNotifications() async {
    final String? accessToken = await _storage.read(key: 'accessToken');

    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    Response<dynamic> response =
      await dio.get('/notifications').catchError((error) {
      log(error.toString());
      throw error.response.data['message'];
    });
    if (response.data is List) {
      List<dynamic> data = response.data;
      List<Notification> notifications = data.map((x) => Notification.fromJson(x)).toList();
      return notifications.reversed.toList();
    } else {
      throw response.data['message'];
    }
  }
}
