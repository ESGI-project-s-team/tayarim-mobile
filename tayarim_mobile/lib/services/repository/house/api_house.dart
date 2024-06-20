import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../models/house.dart';
import 'house_data_source.dart';

class ApiHouse extends HouseDataSource {
  final dio = Dio(
    BaseOptions(baseUrl: '${dotenv.env['API_URL']}/house'),
  );

  // @override
  // Future<List<House>> getHouses(String token) async {
  //   Response<dynamic> response = await dio
  //       .get('/all',
  //           options: Options(headers: {
  //             "Content-Type": "application/json",
  //             "Authorization": "Bearer $token",
  //           }))
  //       .catchError((error) => throw error.response.data['message']);
  //   return (response.data);
  //       // .map((house) => House.fromJson(house))
  //       // .toList();
  // }

  Future<void> deleteHouse(String token, int id) async {
    await dio.delete('/delete/$id',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));
  }

  @override
  Future<List<House>> getHouses() {
    // TODO: implement getHouses
    throw UnimplementedError();
  }
}