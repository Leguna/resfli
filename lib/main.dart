import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';
import 'package:resfli/network/restaurant_service.dart';
import 'package:resfli/widget/search/search_page.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initServices();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

initServices() async {
  Get.put(RestaurantService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Resfli',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Home(),
      getPages: [
        GetPage(
          name: homeRoute,
          page: () => Home(),
          transition: Transition.fade,
        ),
        GetPage(
          name: detailRoute,
          page: () => const DetailPage(),
          transition: Transition.fade,
        ),
        GetPage(
          name: searchRoute,
          page: () => SearchPage(),
          transition: Transition.fade,
        ),
      ],
    );
  }
}
