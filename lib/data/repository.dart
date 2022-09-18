import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:resfli/model/restaurant_list_mdl.dart';

class Repository {
  Future<RestaurantListModel> getRestaurantList() {
    return getJsonFromFile();
  }

  Future<RestaurantListModel> getJsonFromFile() {
    return readJsonFile('assets/json/local_restaurant.json');
  }

  Future<RestaurantListModel> readJsonFile(String filePath) async {
    final String response = await rootBundle.loadString(filePath);
    final data = await json.decode(response);
    return RestaurantListModel.fromJson(data);
  }
}
