import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';
import 'package:resfli/network/models/get_list_restaurant_response.dart';
import 'package:resfli/network/restaurant_service.dart';
import 'package:resfli/widget/home/custom_error_widget.dart';
import 'package:resfli/widget/search/search_page.dart';

const homeRoute = '/';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final RestaurantService restaurantService = Get.find();
  final restaurantList = <Restaurant>[].obs;
  final isError = false.obs;
  final isLoading = false.obs;
  final errorText = "Error! Check Your Connection.".obs;

  @override
  Widget build(BuildContext context) {
    getAllRestaurant();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resfli'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.toNamed(searchRoute);
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              getAllRestaurant();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Restaurant",
                  style: Get.textTheme.titleLarge,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Text(
                  "Recommendation for you",
                  style: Get.textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 16),
              for (var restaurant in restaurantList) ...[
                RestaurantItemWidget(restaurant: restaurant),
              ],
              if (isError.value)
                CustomErrorWidget(message: errorText.value)
              else if (isLoading.value) ...[
                const Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void getAllRestaurant() {
    isLoading.value = true;
    isError.value = false;
    restaurantService.getListRestaurant().then(
      (value) {
        if (value?.error != null) {
          if (value!.error!) {
            isError.value = true;
            errorText.value = value.message ?? "";
            restaurantList.value = [];
          } else {
            isError.value = false;
            restaurantList.value = value.restaurants;
          }
        }
        isLoading.value = false;
      },
    ).onError((error, stackTrace) {
      isError.value = true;
      errorText.value = "";
      restaurantList.value = [];
      isLoading.value = false;
    });
  }
}
