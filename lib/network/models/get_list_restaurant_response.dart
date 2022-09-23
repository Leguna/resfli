// To parse this JSON data, do
//
//     final getListRestaurant = getListRestaurantFromJson(jsonString);

import 'dart:convert';

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

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;

  Restaurant copyWith({
    String? id,
    String? name,
    String? description,
    String? pictureId,
    String? city,
    double? rating,
  }) =>
      Restaurant(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        pictureId: pictureId ?? this.pictureId,
        city: city ?? this.city,
        rating: rating ?? this.rating,
      );

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        pictureId:
            "https://restaurant-api.dicoding.dev/images/small/${json["pictureId"]}",
        city: json["city"] ?? "",
        rating:
            json["rating"] == null ? null : json["rating"].toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "name": name ?? "",
        "description": description ?? "",
        "pictureId": pictureId ?? "",
        "city": city ?? "",
        "rating": rating ?? 0.0,
      };
}
