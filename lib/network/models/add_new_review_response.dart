// To parse this JSON data, do
//
//     final addNewReviewResponse = addNewReviewResponseFromJson(jsonString);

import 'dart:convert';

AddNewReviewResponse addNewReviewResponseFromJson(String str) =>
    AddNewReviewResponse.fromJson(json.decode(str));

String addNewReviewResponseToJson(AddNewReviewResponse data) =>
    json.encode(data.toJson());

class AddNewReviewResponse {
  AddNewReviewResponse({
    this.error,
    this.message,
    this.customerReviews,
  });

  bool? error;
  String? message;
  List<CustomerReview>? customerReviews;

  AddNewReviewResponse copyWith({
    bool? error,
    String? message,
    List<CustomerReview>? customerReviews,
  }) =>
      AddNewReviewResponse(
        error: error ?? this.error,
        message: message ?? this.message,
        customerReviews: customerReviews ?? this.customerReviews,
      );

  factory AddNewReviewResponse.fromJson(Map<String, dynamic> json) =>
      AddNewReviewResponse(
        error: json["error"] ?? "",
        message: json["message"] ?? "",
        customerReviews: json["customerReviews"] == null
            ? null
            : List<CustomerReview>.from(
                json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error ?? "",
        "message": message ?? "",
        "customerReviews": customerReviews == null
            ? null
            : List<dynamic>.from(customerReviews!.map((x) => x.toJson())),
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
        name: json["name"] ?? "",
        review: json["review"] ?? "",
        date: json["date"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? "",
        "review": review ?? "",
        "date": date ?? "",
      };
}
