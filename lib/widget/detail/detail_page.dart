import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';
import 'package:resfli/network/models/get_detail_restaurant_response.dart';
import 'package:resfli/network/models/get_list_restaurant_response.dart';
import 'package:resfli/network/restaurant_service.dart';
import 'package:resfli/widget/home/custom_error_widget.dart';

const detailRoute = '/details';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final restaurant = Get.arguments as Restaurant;
  final restaurantService = Get.find<RestaurantService>();
  final _isReadMore = false.obs;

  final _reviewTextController = TextEditingController();
  final _nameController = TextEditingController();

  final detailRestaurant = RestaurantDetail().obs;
  final customerReviews = <CustomerReview?>[].obs;
  final isLoading = false.obs;
  final isError = false.obs;
  final errorText = "Error! Check Your Connection.".obs;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    getDetailRestaurant(restaurant.id ?? "");
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () => getDetailRestaurant(restaurant.id ?? ''),
                icon: const Icon(Icons.refresh),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "${restaurant.name}",
                overflow: TextOverflow.ellipsis,
              ),
              background: Container(
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.3, 0.6, 1],
                  ),
                ),
                child: Hero(
                  tag: "${restaurant.pictureId}",
                  child: Image.network(
                    "${restaurant.pictureId}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
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
                  Obx(() {
                    if (isError.value) {
                      return CustomErrorWidget(
                        message: errorText.value,
                      );
                    } else {
                      if (isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Menu",
                                style: MyTypography.contentBoldNormal()),
                            const SizedBox(height: 8),
                            Text("Foods",
                                style: MyTypography.contentBoldNormal()),
                            const SizedBox(height: 8),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: detailRestaurant.value.menus?.foods
                                        ?.map(
                                          (e) => Container(
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text("${e?.name}"),
                                          ),
                                        )
                                        .toList() ??
                                    [],
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
                                children: detailRestaurant.value.menus?.drinks
                                        ?.map(
                                          (e) => Container(
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text("${e?.name}"),
                                          ),
                                        )
                                        .toList() ??
                                    [],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Customer Reviews",
                              style: MyTypography.contentBoldNormal(),
                            ),
                            const SizedBox(height: 8),
                            for (var review in customerReviews)
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${review?.name}",
                                      style: MyTypography.contentBoldNormal(),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "${review?.review}",
                                      style: MyTypography.contentNormal(),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "${review?.date}",
                                      style: MyTypography.contentSmall(),
                                    ),
                                  ],
                                ),
                              )
                          ],
                        );
                      }
                    }
                  }),
                  Obx(() {
                    if (!isError.value)
                      return Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              controller: _nameController..text = "Anonim",
                              decoration: const InputDecoration(
                                hintText: "Name",
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your review';
                                }
                                return null;
                              },
                              controller: _reviewTextController,
                              decoration: InputDecoration(
                                hintText: "Add Review",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      addReviewRestaurant(
                                        restaurant.id ?? "",
                                        _nameController.text,
                                        _reviewTextController.text,
                                      );
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      _reviewTextController.clear();
                                      _nameController.clear();
                                    }
                                  },
                                  icon: const Icon(Icons.send),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    return SizedBox();
                  }),
                  const SizedBox(height: 600),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getDetailRestaurant(String id) {
    isLoading.value = true;
    isError.value = false;
    restaurantService.getDetailRestaurant(id: id).then(
      (value) {
        if (value.error != null) {
          if (value.error!) {
            isError.value = true;
            errorText.value = value.message ?? "";
            detailRestaurant.value = RestaurantDetail();
          } else {
            isError.value = false;
            detailRestaurant.value = value.restaurant ?? RestaurantDetail();
            customerReviews.value = value.restaurant?.customerReviews ?? [];
          }
        }
        isLoading.value = false;
      },
    ).onError((error, stackTrace) {
      isError.value = true;
      errorText.value = "";
      detailRestaurant.value = RestaurantDetail();
      isLoading.value = false;
    });
  }

  void addReviewRestaurant(
    String id,
    String name,
    String review,
  ) {
    isLoading.value = true;
    isError.value = false;
    restaurantService.addNewReview(id: id, name: name, review: review).then(
      (value) {
        if (value.error != null) {
          if (value.error!) {
            isError.value = true;
            errorText.value = value.message ?? "";
          } else {
            isError.value = false;
            customerReviews.value = value.customerReviews ?? [];
          }
        }
        isLoading.value = false;
      },
    ).onError((error, stackTrace) {
      isError.value = true;
      errorText.value = "";
      isLoading.value = false;
    });
  }
}
