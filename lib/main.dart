import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var repo = Repository();
    return GetMaterialApp(
      title: 'Resfli',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Home(repository: repo),
      getPages: [
        GetPage(
            name: homeRoute,
            page: () => Home(repository: repo),
            transition: Transition.fade),
        GetPage(
            name: detailRoute,
            page: () => const DetailPage(),
            transition: Transition.fade),
      ],
    );
  }
}
