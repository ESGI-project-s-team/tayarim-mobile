import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tayarim_mobile/models/connexion_user.dart';
import 'package:tayarim_mobile/models/user.dart';
import 'package:tayarim_mobile/utils/dico_loader.dart';
import 'auth_data_source.dart';

class ApiAuthDataSource extends AuthDataSource {
  final dio = Dio(
    BaseOptions(baseUrl: '${dotenv.env['API_URL']}/auth'),
  );

  @override
  Future<String> doConnexion(ConnexionUser connexionUser) async {
    Map<String, dynamic> data = {
      'email': connexionUser.email,
      'motDePasse': connexionUser.password,
    };
    Response<dynamic> response =
        await dio.post('/login', data: data).catchError((error) {
      log(error.toString());
      print("ERROR");
      print(error.response.data["errors"][0]);
      var errorMessages = [];
      for (var i = 0; i < error.response.data["errors"].length; i++) {
        errorMessages.add(DicoLoader().getErrorMessage(error.response.data["errors"][i]));
      }
      print(errorMessages);
      throw errorMessages;
    });
    log("TOKEN // :  ${response.data['accessToken']}");
    return response.data['accessToken'];
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
