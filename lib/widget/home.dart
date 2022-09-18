import 'package:flutter/material.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Restaurant"),
          const Text("Recommendation for you"),
          FutureBuilder(
            future: widget.repository.getRestaurantList(),
            builder: (context, snapshot) {
              print(snapshot);
              return Column(
                children: [
                  if (snapshot.hasData)
                    for (var restaurant
                        in (snapshot.data as RestaurantListModel).restaurants)
                      Text(restaurant.name.toString())
                  else
                    const Text("Loading..."),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class RestaurantItemWidget extends StatelessWidget {
  const RestaurantItemWidget({Key? key, required Restaurant restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.network(
            "https://restaurant-api.dicoding.dev/images/small/14",
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama Resto"),
              Text("Kota"),
              Text("Rating"),
            ],
          ),
        ],
      ),
    );
  }
}
