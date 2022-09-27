import 'package:flutter/widgets.dart';
import 'package:resfli/index.dart';

class RestaurantListWidget extends StatelessWidget {
  const RestaurantListWidget({
    Key? key,
    this.restaurantList,
    required this.callback,
  }) : super(key: key);

  final Function(Restaurant restaurant) callback;
  final List<Restaurant>? restaurantList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var restaurant in restaurantList ?? []) ...[
          RestaurantItemWidget(
            restaurant: restaurant,
            callback: () => callback(restaurant),
          ),
        ],
      ],
    );
  }
}
