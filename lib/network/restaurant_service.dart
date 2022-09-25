import 'dart:core';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:resfli/network/api_service.dart';
import 'package:resfli/network/models/add_new_review_response.dart';
import 'package:resfli/network/models/get_detail_restaurant_response.dart';
import 'package:resfli/network/models/get_list_restaurant_response.dart';
import 'package:resfli/network/models/search_restaurant_response.dart';

class RestaurantService extends GetxService {
  final Dio _dio = ApiService.createDio();
  final _errorMessage = "Error! Check your Connection!";

  Future<GetListRestaurantResponse?> getListRestaurant({
    int page = 1,
  }) async {
    GetListRestaurantResponse? listRestaurant;
    try {
      Response<dynamic> response = await _dio.get(
        '/list',
      );
      listRestaurant = GetListRestaurantResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        return GetListRestaurantResponse.fromJson(e.response!.data);
      } else {
        return GetListRestaurantResponse(
          error: true,
          message: _errorMessage,
          restaurants: [],
        );
      }
    }
    return listRestaurant;
  }

  Future<GetDetailRestaurantResponse> getDetailRestaurant({
    required String id,
  }) async {
    GetDetailRestaurantResponse detailRestaurant;
    try {
      Response<dynamic> response = await _dio.get(
        '/detail/$id',
      );
      detailRestaurant = GetDetailRestaurantResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        return GetDetailRestaurantResponse();
      } else {
        return GetDetailRestaurantResponse(
          error: true,
          message: _errorMessage,
          restaurant: RestaurantDetail(),
        );
      }
    }
    return detailRestaurant;
  }

  Future<SearchRestaurantResponse> searchRestaurant({
    required String query,
  }) async {
    SearchRestaurantResponse searchRestaurant;
    try {
      Response<dynamic> response = await _dio.get(
        '/search?q=$query',
      );
      searchRestaurant = SearchRestaurantResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        return SearchRestaurantResponse.fromJson(e.response!.data);
      } else {
        return SearchRestaurantResponse(
          error: true,
          message: _errorMessage,
          restaurants: [],
        );
      }
    }
    return searchRestaurant;
  }

  Future<AddNewReviewResponse> addNewReview({
    required String id,
    required String name,
    required String review,
  }) async {
    AddNewReviewResponse addNewReview;
    try {
      Response<dynamic> response = await _dio.post(
        '/review',
        data: {
          'id': id,
          'name': name,
          'review': review,
        },
      );
      addNewReview = AddNewReviewResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        return AddNewReviewResponse.fromJson(e.response!.data);
      } else {
        return AddNewReviewResponse(
          error: true,
          message: _errorMessage,
          customerReviews: [],
        );
      }
    }
    return addNewReview;
  }
}
