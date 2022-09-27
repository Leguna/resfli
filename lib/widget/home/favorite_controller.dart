import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resfli/index.dart';

class FavoriteController extends GetxController {
  final _box = GetStorage();
  final _favoriteKey = 'favorite';
  final restaurants = <Restaurant>[].obs;
  final isLoading = false.obs;
  final isError = false.obs;
  final errorText = "Error! Something is wrong.".obs;
  final isFavorite = false.obs;

  toggleFavorite(Restaurant restaurant) {
    checkFavorite(restaurant);
    if (isFavorite.value) {
      removeFavorite(restaurant);
    } else {
      addFavorite(restaurant);
    }
    checkFavorite(restaurant);
  }

  @override
  void onInit() {
    super.onInit();
    getFavorite();
    _box.listen(() {
      restaurants.refresh();
    });
  }

  addFavorite(Restaurant restaurant) async {
    isLoading.value = true;
    isError.value = false;
    try {
      var favorite = _box.read(_favoriteKey) ?? [];
      favorite.add(restaurant.toJson());
      _box.write(_favoriteKey, favorite);
      restaurants.value = favorite;
      errorText.value = "";
      isError.value = false;
    } catch (e) {
      isError.value = true;
    }
    isLoading.value = false;
  }

  removeFavorite(Restaurant restaurant) async {
    isLoading.value = true;
    isError.value = false;
    try {
      var list = _box.read(_favoriteKey) ?? [];
      list.removeWhere((element) => element['id'] == restaurant.id);
      _box.write(_favoriteKey, list);
      restaurants.value = list;
    } catch (e) {
      isError.value = true;
    }
    isLoading.value = false;
  }

  getFavorite() async {
    isLoading.value = true;
    isError.value = false;
    try {
      List<dynamic> list = _box.read(_favoriteKey) ?? [];
      List<Restaurant> value = list.map((e) => Restaurant.fromJson(e)).toList();
      restaurants.value = value;
    } catch (e) {
      isError.value = true;
    }
    isLoading.value = false;
  }

  bool checkFavorite(Restaurant restaurant) {
    List<dynamic> list = _box.read(_favoriteKey) ?? [];
    final value = list.map((e) => Restaurant.fromJson(e)).toList();
    isFavorite.value = value.contains(restaurant);
    return value.contains(restaurant);
  }
}
