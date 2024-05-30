import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tayarim_mobile/models/connexion_user.dart';
import 'package:tayarim_mobile/models/user.dart';
import 'auth_data_source.dart';

class ApiAuthDataSource extends AuthDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: '${dotenv.env['API_URL']}/auth'
    ),
  );

  @override
  Future<String> doConnexion(ConnexionUser connexionUser) async {

    Map<String, dynamic> data = {
      'email': connexionUser.email,
      'password': connexionUser.password,
    };
    Response<dynamic> response = await dio
        .post('/login', data: data)
        .catchError((error) => throw error.response.data['message']);
    return response.data['token'];
  }

  @override
  Future<User> doIsConnected(String token) async {
    Response<dynamic> response = await dio
        .get('/me',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }))
        .catchError((error) => throw error.response.data['message']);
    return User.fromJson(response.data);
  }
}
