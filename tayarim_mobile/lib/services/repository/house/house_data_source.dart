import '../../../models/house.dart';

abstract class HouseDataSource {
  Future<List<House>> getHouses();
}