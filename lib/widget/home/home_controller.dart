import 'package:get/get.dart';
import 'package:resfli/index.dart';

class HomeController extends GetxController {
  final RestaurantService restaurantService = Get.find();
  final restaurantList = <Restaurant>[].obs;
  final isError = false.obs;
  final isLoading = false.obs;
  final errorText = "Error! Check Your Connection.".obs;

  @override
  void onInit() {
    getRestaurant();
    super.onInit();
  }

  getRestaurant() async {
    restaurantList.value = [];
    isLoading.value = true;
    isError.value = false;
    try {
      var response = await restaurantService.getListRestaurant();
      restaurantList.value = response?.restaurants ?? [];
      errorText.value = response?.error ?? false ? response?.message ?? "" : "";
      isError.value = response?.error ?? false;
    } catch (e) {
      isError.value = true;
    }
    isLoading.value = false;
  }
}
