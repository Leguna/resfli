import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';

const detailRoute = '/details';

class DetailPage extends GetView<DetailRestaurantController> {
  DetailPage({Key? key}) : super(key: key);

  final _reviewTextController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _isReadMore = false.obs;

  @override
  Widget build(BuildContext context) {
    Get.put(DetailRestaurantController());
    final FavoriteController favoriteController = Get.put(FavoriteController());
    favoriteController.checkFavorite(controller.restaurant);
    getDetailRestaurant(controller.restaurant.id ?? "");
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () =>
                    getDetailRestaurant(controller.restaurant.id ?? ''),
                icon: const Icon(Icons.refresh),
              ),
              Obx(
                () => IconButton(
                  onPressed: () {
                    favoriteController
                        .toggleFavorite(controller.detailRestaurant.value);
                  },
                  icon: Icon(
                    favoriteController.isFavorite.value
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(controller.restaurant.name ?? ""),
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
                  tag: "${controller.restaurant.pictureId}",
                  child: Image.network(
                    "https://restaurant-api.dicoding.dev/images/medium/${controller.restaurant.pictureId}",
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
                      Text("${controller.restaurant.city}"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star),
                      const SizedBox(width: 8),
                      Text('${controller.restaurant.rating}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => Text(
                      "${controller.restaurant.description}",
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
                    if (controller.isError.value) {
                      return CustomErrorWidget(
                        message: controller.errorText.value,
                      );
                    } else {
                      if (controller.isLoading.value) {
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
                                children: controller
                                        .detailRestaurant.value.menus?.foods
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
                                children: controller
                                        .detailRestaurant.value.menus?.drinks
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
                            for (var review in controller.customerReviews)
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
                    if (!controller.isError.value) {
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
                                        controller.restaurant.id ?? "",
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
                    }
                    return const SizedBox();
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
    controller.isLoading.value = true;
    controller.isError.value = false;
    controller.restaurantService.getDetailRestaurant(id: id).then(
      (value) {
        if (value.error != null) {
          if (value.error!) {
            controller.isError.value = true;
            controller.errorText.value = value.message ?? "";
            controller.detailRestaurant.value = Restaurant();
          } else {
            controller.isError.value = false;
            controller.detailRestaurant.value =
                value.restaurant ?? Restaurant();
            controller.customerReviews.value =
                value.restaurant?.customerReviews ?? [];
          }
        }
        controller.isLoading.value = false;
      },
    ).onError((error, stackTrace) {
      controller.isError.value = true;
      controller.errorText.value = "";
      controller.detailRestaurant.value = Restaurant();
      controller.isLoading.value = false;
    });
  }

  void addReviewRestaurant(
    String id,
    String name,
    String review,
  ) {
    controller.isLoading.value = true;
    controller.isError.value = false;
    controller.restaurantService
        .addNewReview(id: id, name: name, review: review)
        .then(
      (value) {
        if (value.error != null) {
          if (value.error!) {
            controller.isError.value = true;
            controller.errorText.value = value.message ?? "";
          } else {
            controller.isError.value = false;
            controller.customerReviews.value = value.customerReviews ?? [];
          }
        }
        controller.isLoading.value = false;
      },
    ).onError((error, stackTrace) {
      controller.isError.value = true;
      controller.errorText.value = "";
      controller.isLoading.value = false;
    });
  }
}
