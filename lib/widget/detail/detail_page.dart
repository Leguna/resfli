import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resfli/network/models/get_detail_restaurant_response.dart';
import 'package:resfli/network/models/get_list_restaurant_response.dart';
import 'package:resfli/network/restaurant_service.dart';
import 'package:resfli/utils/my_typography.dart';

const detailRoute = '/details';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final restaurant = Get.arguments as Restaurant;
  final _isReadMore = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "${restaurant.name}",
                overflow: TextOverflow.ellipsis,
              ),
              background: Hero(
                tag: "${restaurant.pictureId}",
                child: Image.network(
                  "${restaurant.pictureId}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: Get.find<RestaurantService>()
                  .getDetailRestaurant(id: restaurant.id ?? ""),
              builder: (context, snap) {
                if (snap.hasData) {
                  var restaurant =
                      (snap.data as GetDetailRestaurantResponse).restaurant!;
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(width: 8),
                            Text("${restaurant.city}"),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star),
                            const SizedBox(width: 8),
                            Text('${restaurant.rating}'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Obx(
                          () => Text(
                            "${restaurant.description}",
                            maxLines: _isReadMore.value ? null : 5,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        Obx(
                          () => TextButton(
                            onPressed: () {
                              _isReadMore.value = !_isReadMore.value;
                            },
                            child: Text(
                              _isReadMore.value ? "Read less" : "Read more",
                              style: MyTypography.buttonSmall(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text("Menu", style: MyTypography.contentBoldNormal()),
                        const SizedBox(height: 8),
                        Text("Foods", style: MyTypography.contentBoldNormal()),
                        const SizedBox(height: 8),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: restaurant.menus.foods!
                                .map(
                                  (e) => Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text("${e?.name}"),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Drinks",
                          style: MyTypography.contentBoldNormal(),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: restaurant.menus.drinks!
                                .map(
                                  (e) => Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text("${e?.name}"),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 400),
                      ],
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
