import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resfli/index.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initServices();
  runApp(const MyApp());
}

initServices() async {
  await GetStorage.init();
  Get.lazyPut(() => RestaurantService());
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => FavoriteController());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: ApiService.alice.getNavigatorKey(),
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
              page: () => DetailPage(),
              transition: Transition.fade,
            ),
            GetPage(
              name: searchRoute,
              page: () => SearchPage(),
              transition: Transition.fade,
            ),
          ],
        );
      },
    );
  }
}
