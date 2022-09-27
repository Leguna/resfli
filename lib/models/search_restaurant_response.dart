// To parse this JSON data, do
//
//     final searchRestaurantResponse = searchRestaurantResponseFromJson(jsonString);

import 'dart:convert';

import 'package:resfli/models/index.dart';

SearchRestaurantResponse searchRestaurantResponseFromJson(String str) =>
    SearchRestaurantResponse.fromJson(json.decode(str));

String searchRestaurantResponseToJson(SearchRestaurantResponse data) =>
    json.encode(data.toJson());

class SearchRestaurantResponse {
  SearchRestaurantResponse({
    this.error,
    this.founded,
    this.message,
    this.restaurants,
  });

  bool? error;
  int? founded;
  String? message;
  List<Restaurant>? restaurants;

  SearchRestaurantResponse copyWith({
    bool? error,
    int? founded,
    String? message,
    List<Restaurant>? restaurants,
  }) =>
      SearchRestaurantResponse(
        error: error ?? this.error,
        founded: founded ?? this.founded,
        message: message ?? this.message,
        restaurants: restaurants ?? this.restaurants,
      );

  factory SearchRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      SearchRestaurantResponse(
        error: json["error"] ?? '',
        founded: json["founded"] ?? 0,
        message: json["message"] ?? '',
        restaurants: json["restaurants"] == null
            ? null
            : List<Restaurant>.from(
                json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error ?? "",
        "message": message ?? "",
        "founded": founded ?? "",
        "restaurants": restaurants == null
            ? null
            : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
      };
}
