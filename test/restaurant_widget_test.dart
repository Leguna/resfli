import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:resfli/index.dart';

const List<Restaurant> dummyListRestaurant = [
  Restaurant(
    id: 'rqdv5juczeskfw1e867',
    name: 'Melting Pot',
    description:
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...',
    pictureId: '14',
    city: 'Medan',
    rating: 4.2,
  ),
  Restaurant(
    id: 's1knt6za9kkfw1e867',
    name: 'Kafe Kita',
    description:
        'Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...',
    pictureId: '25',
    city: 'Gorontalo',
    rating: 4,
  ),
  Restaurant(
    id: 'w9pga3s2tubkfw1e867',
    name: 'Kafe Kita',
    description:
        'Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...',
    pictureId: '25',
    city: 'Gorontalo',
    rating: 4,
  ),
];

void main() {
  group('Widget Test', () {
    Get.testMode = true;

    testWidgets('should have 1 list and 3 widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: RestaurantListWidget(
            restaurantList: dummyListRestaurant,
            callback: (restaurant) => {},
          ),
        ),
      );

      expect(find.byType(RestaurantListWidget), findsOneWidget);
      expect(find.byType(RestaurantItemWidget), findsNWidgets(3));
    });
  });
}
