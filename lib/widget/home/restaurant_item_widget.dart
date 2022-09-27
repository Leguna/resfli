import 'package:flutter/material.dart';
import 'package:resfli/index.dart';

class RestaurantItemWidget extends StatelessWidget {
  const RestaurantItemWidget({
    Key? key,
    required this.restaurant,
    required this.callback,
  }) : super(key: key);

  final Function() callback;
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
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
                    "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
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
