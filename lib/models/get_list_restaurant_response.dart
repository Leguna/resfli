// To parse this JSON data, do
//
//     final getListRestaurant = getListRestaurantFromJson(jsonString);

import 'dart:convert';

import 'package:resfli/models/index.dart';

GetListRestaurantResponse getListRestaurantFromJson(String str) =>
    GetListRestaurantResponse.fromJson(json.decode(str));

String getListRestaurantToJson(GetListRestaurantResponse data) =>
    json.encode(data.toJson());

class GetListRestaurantResponse {
  GetListRestaurantResponse({
    this.error,
    this.message,
    this.count,
    required this.restaurants,
  });

  bool? error;
  String? message;
  int? count;
  List<Restaurant> restaurants;

  GetListRestaurantResponse copyWith({
    bool? error,
    String? message,
    int? count,
    List<Restaurant>? restaurants,
  }) =>
      GetListRestaurantResponse(
        error: error ?? this.error,
        message: message ?? this.message,
        count: count ?? this.count,
        restaurants: restaurants ?? this.restaurants,
      );

  factory GetListRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      GetListRestaurantResponse(
        error: json["error"] ?? false,
        message: json["message"] ?? '',
        count: json["count"] ?? 0,
        restaurants: json["restaurants"] == null
            ? List<Restaurant>.empty()
            : List<Restaurant>.from(
                json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}
