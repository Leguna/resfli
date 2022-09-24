// To parse this JSON data, do
//
//     final getDetailRestaurant = getDetailRestaurantFromJson(jsonString);

import 'dart:convert';

GetDetailRestaurantResponse getDetailRestaurantFromJson(String str) =>
    GetDetailRestaurantResponse.fromJson(json.decode(str));

String getDetailRestaurantToJson(GetDetailRestaurantResponse data) =>
    json.encode(data.toJson());

class GetDetailRestaurantResponse {
  GetDetailRestaurantResponse({
    this.error,
    this.message,
    this.restaurant,
  });

  bool? error;
  String? message;
  RestaurantDetail? restaurant;

  GetDetailRestaurantResponse copyWith({
    bool? error,
    String? message,
    RestaurantDetail? restaurant,
  }) =>
      GetDetailRestaurantResponse(
        error: error ?? this.error,
        message: message ?? this.message,
        restaurant: restaurant ?? this.restaurant,
      );

  factory GetDetailRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      GetDetailRestaurantResponse(
        error: json["error"] == null ? null : json["error"] as bool?,
        message: json["message"] == null ? null : json["message"] ?? '',
        restaurant: json["restaurant"] == null
            ? null
            : RestaurantDetail.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error ?? "",
        "message": message == null ? null : message ?? "",
        "restaurant": restaurant == null ? null : restaurant?.toJson() ?? "",
      };
}

class RestaurantDetail {
  RestaurantDetail({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.categories,
    this.menus,
    this.rating,
    this.customerReviews,
  });

  String? id;
  String? name;
  String? description;
  String? city;
  String? address;
  String? pictureId;
  List<Category>? categories;
  Menus? menus;
  double? rating;
  List<CustomerReview?>? customerReviews;

  RestaurantDetail copyWith({
    String? id,
    String? name,
    String? description,
    String? city,
    String? address,
    String? pictureId,
    List<Category>? categories,
    Menus? menus,
    double? rating,
    List<CustomerReview>? customerReviews,
  }) =>
      RestaurantDetail(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        city: city ?? this.city,
        address: address ?? this.address,
        pictureId: pictureId ?? this.pictureId,
        categories: categories ?? this.categories,
        menus: menus ?? this.menus,
        rating: rating ?? this.rating,
        customerReviews: customerReviews ?? this.customerReviews,
      );

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      RestaurantDetail(
        id: json["id"] == null ? null : json["id"] ?? '',
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId:
            "https://restaurant-api.dicoding.dev/images/small/${json["pictureId"]}",
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        menus: json["menus"] == null ? Menus() : Menus.fromJson(json["menus"]),
        rating:
            json["rating"] == null ? null : json["rating"].toDouble() ?? 0.0,
        customerReviews: json["customerReviews"] == null
            ? null
            : List<CustomerReview>.from(
                json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "menus": menus?.toJson() ?? Menus().toJson(),
        "rating": rating,
        "customerReviews": customerReviews == null
            ? null
            : List<dynamic>.from(customerReviews!.map((x) => x!.toJson())),
      };
}

class Category {
  Category({
    this.name,
  });

  String? name;

  Category copyWith({
    String? name,
  }) =>
      Category(
        name: name ?? this.name,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class CustomerReview {
  CustomerReview({
    this.name,
    this.review,
    this.date,
  });

  String? name;
  String? review;
  String? date;

  CustomerReview copyWith({
    String? name,
    String? review,
    String? date,
  }) =>
      CustomerReview(
        name: name ?? this.name,
        review: review ?? this.review,
        date: date ?? this.date,
      );

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "review": review,
        "date": date,
      };
}

class Menus {
  Menus({
    this.foods,
    this.drinks,
  });

  List<Category?>? foods;
  List<Category?>? drinks;

  Menus copyWith({
    List<Category?>? foods,
    List<Category?>? drinks,
  }) =>
      Menus(
        foods: foods ?? this.foods,
        drinks: drinks ?? this.drinks,
      );

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: json["foods"] == null
            ? null
            : List<Category>.from(
                json["foods"].map((x) => Category.fromJson(x))),
        drinks: json["drinks"] == null
            ? null
            : List<Category>.from(
                json["drinks"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": foods == null
            ? null
            : List<dynamic>.from(foods!.map((x) => x!.toJson())),
        "drinks": drinks == null
            ? null
            : List<dynamic>.from(drinks!.map((x) => x!.toJson())),
      };
}
