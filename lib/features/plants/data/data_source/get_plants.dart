import 'dart:convert';

import 'package:houseplants/core/constant/category.dart';
import 'package:houseplants/core/errors/exception.dart';
import 'package:houseplants/features/plants/data/model/plants.dart';
import 'package:http/http.dart' as http;

abstract interface class GetAllPlantsDataSource {
  Future<List<Plants>> getAllPlants();
}

class GetAllPlantsDataSourceImp implements GetAllPlantsDataSource {
  /// Function call api to fetch the response
  ///
  @override
  Future<List<Plants>> getAllPlants() async {
    http.Response res = await http.get(Uri.parse(Constants.uri));

    if (res.statusCode == 200) {
      // response decoded
      final jsonResponse = jsonDecode(res.body);

      final List<dynamic> data = jsonResponse['data'];
      
      // repsonse assign to plants model
      final List<Plants> platFeeds =
          data.map((dynamic e) => Plants.fromMap(e)).toList();

      return platFeeds;
    } else {
      throw ServerException('Failed to load plants');
    }
  }
}
