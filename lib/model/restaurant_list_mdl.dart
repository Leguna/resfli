import 'dart:convert';

RestaurantListModel restaurantListModelFromJson(String str) =>
    RestaurantListModel.fromJson(json.decode(str));

String restaurantListModelToJson(RestaurantListModel data) =>
    json.encode(data.toJson());

class RestaurantListModel {
  RestaurantListModel({
    required this.restaurants,
  });

  List<Restaurant> restaurants;

  RestaurantListModel copyWith({
    required List<Restaurant> restaurants,
  }) =>
      RestaurantListModel(
        restaurants: restaurants,
      );

  factory RestaurantListModel.fromJson(Map<String, dynamic> json) =>
      RestaurantListModel(
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
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
    this.menus,
  });

  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  Menus? menus;

  Restaurant copyWith({
    required String id,
    required String name,
    required String description,
    required String pictureId,
    required String city,
    required double rating,
    required Menus menus,
  }) =>
      Restaurant(
        id: id,
        name: name,
        description: description,
        pictureId: pictureId,
        city: city,
        rating: rating,
        menus: menus,
      );

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
        menus: Menus.fromJson(json["menus"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
        "menus": menus?.toJson(),
      };
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  List<Drink> foods;
  List<Drink> drinks;

  Menus copyWith({
    required List<Drink> foods,
    required List<Drink> drinks,
  }) =>
      Menus(
        foods: foods,
        drinks: drinks,
      );

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Drink>.from(json["foods"].map((x) => Drink.fromJson(x))),
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}

class Drink {
  Drink({
    required this.name,
  });

  String name;

  Drink copyWith({
    required String name,
  }) =>
      Drink(
        name: name,
      );

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
