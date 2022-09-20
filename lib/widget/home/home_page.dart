import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';

const homeRoute = '/';

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Restaurant",
                style: Get.textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Recommendation for you",
                style: Get.textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
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
