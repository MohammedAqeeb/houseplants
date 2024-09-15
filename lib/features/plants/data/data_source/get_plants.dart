import 'dart:convert';

import 'package:houseplants/core/errors/exception.dart';
import 'package:houseplants/features/plants/data/model/plants.dart';
import 'package:http/http.dart' as http;

abstract interface class GetAllPlantsDataSource {
  Future<List<Plants>> getAllPlants();
}

const uri = 'https://www.jsonkeeper.com/b/6Z9C';

class GetAllPlantsDataSourceImp implements GetAllPlantsDataSource {
  @override
  Future<List<Plants>> getAllPlants() async {
    http.Response res = await http.get(Uri.parse(uri));

    if (res.statusCode == 200) {
      final jsonResponse = jsonDecode(res.body);

      final List<dynamic> data = jsonResponse['data'];

      final List<Plants> platFeeds =
          data.map((dynamic e) => Plants.fromMap(e)).toList();

      return platFeeds;
    } else {
      throw ServerException('Failed to load plants');
    }
  }
}
