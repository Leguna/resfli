import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';
import 'package:resfli/network/models/get_list_restaurant_response.dart';

class RestaurantItemWidget extends StatelessWidget {
  const RestaurantItemWidget({Key? key, required this.restaurant})
      : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(detailRoute, arguments: restaurant),
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: "${restaurant.pictureId}",
                  child: Image.network(
                    "${restaurant.pictureId}",
                    fit: BoxFit.cover,
                    width: 120,
                    height: 80,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("${restaurant.name}"),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 16,
                    ),
                    Text("${restaurant.city}"),
                  ],
                ),
                const SizedBox(height: 8),
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
      ),
    );
  }
}
