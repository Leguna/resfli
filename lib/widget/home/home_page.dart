import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';
import 'package:resfli/network/models/get_list_restaurant_response.dart';
import 'package:resfli/network/restaurant_service.dart';
import 'package:resfli/widget/search/search_page.dart';

const homeRoute = '/';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final RestaurantService restaurantService = Get.find();

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Text(
                "Recommendation for you",
                style: Get.textTheme.titleMedium,
              ),
            ),
            FutureBuilder(
              future: restaurantService.getListRestaurant(),
              builder: (context, snap) {
                return Column(
                  children: [
                    if (snap.hasData)
                      for (var restaurant
                          in (snap.data as GetListRestaurantResponse)
                              .restaurants) ...[
                        RestaurantItemWidget(restaurant: restaurant)
                      ]
                    else
                      const Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
