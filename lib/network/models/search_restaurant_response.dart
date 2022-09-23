// To parse this JSON data, do
//
//     final searchRestaurantResponse = searchRestaurantResponseFromJson(jsonString);

import 'dart:convert';

import 'package:resfli/network/models/get_list_restaurant_response.dart';

SearchRestaurantResponse searchRestaurantResponseFromJson(String str) =>
    SearchRestaurantResponse.fromJson(json.decode(str));

String searchRestaurantResponseToJson(SearchRestaurantResponse data) =>
    json.encode(data.toJson());

class SearchRestaurantResponse {
  SearchRestaurantResponse({
    this.error,
    this.founded,
    this.restaurants,
  });

  bool? error;
  int? founded;
  List<Restaurant>? restaurants;

  SearchRestaurantResponse copyWith({
    bool? error,
    int? founded,
    List<Restaurant>? restaurants,
  }) =>
      SearchRestaurantResponse(
        error: error ?? this.error,
        founded: founded ?? this.founded,
        restaurants: restaurants ?? this.restaurants,
      );

  factory SearchRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      SearchRestaurantResponse(
        error: json["error"] ?? '',
        founded: json["founded"] ?? '',
        restaurants: json["restaurants"] == null
            ? null
            : List<Restaurant>.from(
                json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error ?? "",
        "founded": founded ?? "",
        "restaurants": restaurants == null
            ? null
            : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
      };
}
