// To parse this JSON data, do
//
//     final addNewReviewResponse = addNewReviewResponseFromJson(jsonString);

import 'dart:convert';

import 'package:resfli/network/models/get_detail_restaurant_response.dart';

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
