import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resfli/index.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  await initServices();
  runApp(const MyApp());
}

initServices() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await GetStorage.init();
  Get.lazyPut(() => RestaurantService());
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => FavoriteController());

  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();
  service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

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
          title: 'Resfli',
          navigatorKey: Get.key,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          initialRoute: homeRoute,
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
            GetPage(
              name: settingsRoute,
              page: () => SettingsPage(),
              transition: Transition.fade,
            ),
          ],
        );
      },
    );
  }
}
