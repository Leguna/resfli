import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';

const searchRoute = '/search';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final RestaurantService restaurantService = Get.find();
  final TextEditingController searchController = TextEditingController();

  final isLoading = false.obs;
  final isError = false.obs;
  final errorText = "Error! Check Your Connection.".obs;
  final searchResult = <Restaurant>[].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
              onPressed: () => searchRestaurant(searchController.value.text),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                onSubmitted: (value) => searchRestaurant(value),
                decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
            ),
            Obx(() => Column(
                  children: [
                    for (var restaurant in searchResult)
                      RestaurantItemWidget(
                        restaurant: restaurant,
                        callback: () {},
                      ),
                    if (searchResult.isEmpty &&
                        !isLoading.value &&
                        !isError.value)
                      const Center(child: Text("No Result")),
                    if (isLoading.value)
                      const Center(child: CircularProgressIndicator()),
                    if (isError.value)
                      CustomErrorWidget(message: errorText.value),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void searchRestaurant(String value) {
    isLoading.value = true;
    isError.value = false;
    restaurantService.searchRestaurant(query: value).then(
      (value) {
        if (value.error != null) {
          if (value.error!) {
            isError.value = true;
            errorText.value = value.message ?? "";
            searchResult.value = [];
          } else {
            isError.value = false;
            searchResult.value = value.restaurants ?? [];
          }
        }
        isLoading.value = false;
      },
    ).onError((error, stackTrace) {
      isError.value = true;
      errorText.value = "";
      searchResult.value = [];
      isLoading.value = false;
    });
  }
}
