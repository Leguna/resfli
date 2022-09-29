import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';

const homeRoute = '/';

class Home extends StatefulWidget {
  const Home({
    Key? key,
    required this.homeController,
    required this.favoriteController,
  }) : super(key: key);

  final HomeController homeController;
  final FavoriteController favoriteController;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    super.initState();
    _notificationHelper.configureSelectNotificationSubject(detailRoute);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Resfli'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Restaurant'),
              Tab(text: 'Favorite'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Get.toNamed(searchRoute);
              },
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                _refresh();
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Get.toNamed(settingsRoute);
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            RecommendedRestaurant(
              callback: _callback,
              controller: widget.homeController,
            ),
            FavoriteList(
              callback: _callback,
              controller: widget.favoriteController,
            ),
          ],
        ),
      ),
    );
  }

  _callback(Restaurant restaurant) async {
    await Get.toNamed(detailRoute, arguments: restaurant);
    _refresh();
  }

  _refresh() {
    widget.homeController.getRestaurant();
    widget.favoriteController.getFavorite();
  }
}

class FavoriteList extends StatelessWidget {
  const FavoriteList({
    Key? key,
    required this.callback,
    required this.controller,
  }) : super(key: key);

  final FavoriteController controller;
  final Function(Restaurant restaurant) callback;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.getFavorite(),
    );
    return HomePage(
      errorText: controller.errorText.value,
      isLoading: controller.isLoading.value,
      isError: controller.isError.value,
      body: Obx(() {
        if (controller.restaurants.isEmpty) {
          return SizedBox(
            height: 1.sh - 240,
            child: const Center(child: Text('No Favorite Restaurant')),
          );
        } else {
          return RestaurantListWidget(
            restaurantList: controller.restaurants,
            callback: callback,
          );
        }
      }),
    );
  }
}

class RecommendedRestaurant extends StatelessWidget {
  const RecommendedRestaurant({
    Key? key,
    required this.callback,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;
  final Function(Restaurant restaurant) callback;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return HomePage(
        body: RestaurantListWidget(
          restaurantList: controller.restaurantList,
          callback: callback,
        ),
        errorText: controller.errorText.value,
        isLoading: controller.isLoading.value,
        isError: controller.isError.value,
      );
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.body,
    this.isError = false,
    this.errorText = '',
    this.isLoading = false,
  }) : super(key: key);

  final Widget body;
  final bool isError;
  final bool isLoading;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          body,
          if (isLoading) const LoadingWidget(),
          if (isError) CustomErrorWidget(message: errorText),
        ],
      ),
    );
  }
}
