import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resfli/data/repository.dart';
import 'package:resfli/model/restaurant_list_mdl.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.repository}) : super(key: key);

  final Repository repository;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resfli')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Restaurant",
              style: Get.textTheme.titleLarge,
            ),
            Text(
              "Recommendation for you",
              style: Get.textTheme.titleMedium,
            ),
            FutureBuilder(
              future: widget.repository.getRestaurantList(),
              builder: (context, snap) {
                return Column(
                  children: [
                    if (snap.hasData)
                      for (var restaurant in (snap.data as RestaurantListModel)
                          .restaurants) ...[
                        RestaurantItemWidget(restaurant: restaurant)
                      ]
                    else
                      const Text("Loading..."),
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

class RestaurantItemWidget extends StatelessWidget {
  const RestaurantItemWidget({Key? key, required this.restaurant})
      : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "${restaurant.pictureId}",
                fit: BoxFit.cover,
                width: 120,
                height: 80,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${restaurant.name}"),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 16,
                  ),
                  Text("${restaurant.city}"),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 16,
                  ),
                  Text("${restaurant.rating}"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
