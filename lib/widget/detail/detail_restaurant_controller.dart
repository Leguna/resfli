import 'package:get/get.dart';
import 'package:resfli/index.dart';

class DetailRestaurantController extends GetxController {
  final RestaurantService restaurantService = Get.find();
  final restaurant = Get.arguments as Restaurant;

  final detailRestaurant = Restaurant().obs;
  final customerReviews = <CustomerReview?>[].obs;
  final isLoading = false.obs;
  final isError = false.obs;
  final errorText = "Error! Check Your Connection.".obs;

  Future<GetDetailRestaurantResponse> getDetailRestaurant(String id) async {
    detailRestaurant.value = Restaurant();
    customerReviews.value = [];
    isLoading.value = true;
    isError.value = false;
    try {
      var response = await restaurantService.getDetailRestaurant(id: id);
      detailRestaurant.value = response.restaurant ?? Restaurant();
      customerReviews.value = response.restaurant?.customerReviews ?? [];
      errorText.value = response.error ?? false ? response.message ?? "" : "";
      isError.value = response.error ?? false;
      isLoading.value = false;
      return response;
    } catch (e) {
      isError.value = true;
      isLoading.value = false;
    }
    return GetDetailRestaurantResponse();
  }

  addNewReview(String id, String name, String review) async {
    isLoading.value = true;
    isError.value = false;
    try {
      var response = await restaurantService.addNewReview(
        id: id,
        name: name,
        review: review,
      );
      errorText.value = response.error ?? false ? response.message ?? "" : "";
      isError.value = response.error ?? false;
      if (!isError.value) {
        getDetailRestaurant(id);
      }
    } catch (e) {
      isError.value = true;
    }
    isLoading.value = false;
  }
}
