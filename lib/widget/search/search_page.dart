import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resfli/network/models/get_list_restaurant_response.dart';
import 'package:resfli/network/restaurant_service.dart';
import 'package:resfli/widget/home/restaurant_item_widget.dart';

const searchRoute = '/search';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final RestaurantService restaurantService = Get.find();
  final TextEditingController searchController = TextEditingController();

  final bool isLoading = false.obs();

  @override
  Widget build(BuildContext context) {
    var searchResult = <Restaurant>[].obs;
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                onSubmitted: (value) {
                  restaurantService.searchRestaurant(query: value).then(
                      (value) => searchResult.value = value.restaurants ?? []);
                },
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)))),
              ),
            ),
            Obx(() => Column(
                  children: [
                    for (var restaurant in searchResult)
                      RestaurantItemWidget(restaurant: restaurant)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
