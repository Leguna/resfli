// ignore_for_file: unnecessary_import

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
@GenerateNiceMocks([MockSpec<RestaurantService>()])
import 'package:resfli/database/api/restaurant_service.dart';
import 'package:resfli/index.dart';

import 'controller_test.mocks.dart';

const String dummyJsonRestaurant = '''
{
        "id": "rqdv5juczeskfw1e867",
        "name": "Melting Pot",
        "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...",
        "city": "Medan",
        "address": "Jln. Pandeglang no 19",
        "pictureId": "14",
        "categories": [
            {
                "name": "Italia"
            },
            {
                "name": "Modern"
            }
        ],
        "menus": {
            "foods": [
                {
                    "name": "Paket rosemary"
                },
                {
                    "name": "Toastie salmon"
                }
            ],
            "drinks": [
                {
                    "name": "Es krim"
                },
                {
                    "name": "Sirup"
                }
            ]
        },
        "rating": 4.2,
        "customerReviews": [
            {
                "name": "Ahmad",
                "review": "Tidak rekomendasi untuk pelajar!",
                "date": "13 November 2019"
            }
        ]
    }''';
const String dummyListRestaurantResponse = '''{
    "error": false,
    "message": "success",
    "count": 20,
    "restaurants": [
        {
            "id": "rqdv5juczeskfw1e867",
            "name": "Melting Pot",
            "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
            "pictureId": "14",
            "city": "Medan",
            "rating": 4.2
        },
        {
            "id": "s1knt6za9kkfw1e867",
            "name": "Kafe Kita",
            "description": "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
            "pictureId": "25",
            "city": "Gorontalo",
            "rating": 4
        }
    ]
}
''';
final Restaurant dummyRestaurant = Restaurant(
  id: 'rqdv5juczeskfw1e867',
  name: 'Melting Pot',
  description:
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...',
  city: 'Medan',
  address: 'Jln. Pandeglang no 19',
  pictureId: '14',
  categories: [
    Category(name: 'Italia'),
    Category(name: 'Modern'),
  ],
  menus: Menus(
    foods: [
      Category(name: 'Paket rosemary'),
      Category(name: 'Toastie salmon'),
    ],
    drinks: [
      Category(name: 'Es krim'),
      Category(name: 'Sirup'),
    ],
  ),
  rating: 4.2,
  customerReviews: [
    CustomerReview(
      name: 'Ahmad',
      review: 'Tidak rekomendasi untuk pelajar!',
      date: '13 November 2019',
    ),
  ],
);
const String dummyJsonGetDetailRestaurantResponse = '''{
    "error": false,
    "message": "success",
    "restaurant": {
        "id": "rqdv5juczeskfw1e867",
        "name": "Melting Pot",
        "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...",
        "city": "Medan",
        "address": "Jln. Pandeglang no 19",
        "pictureId": "14",
        "categories": [
            {
                "name": "Italia"
            },
            {
                "name": "Modern"
            }
        ],
        "menus": {
            "foods": [
                {
                    "name": "Paket rosemary"
                },
                {
                    "name": "Toastie salmon"
                }
            ],
            "drinks": [
                {
                    "name": "Es krim"
                },
                {
                    "name": "Sirup"
                }
            ]
        },
        "rating": 4.2,
        "customerReviews": [
            {
                "name": "Ahmad",
                "review": "Tidak rekomendasi untuk pelajar!",
                "date": "13 November 2019"
            }
        ]
    }
}''';

void main() {
  final MockRestaurantService restaurantService = MockRestaurantService();

  group("Test Controller", () {
    group("Detail Restaurant Controller", () {
      test("Test Get Detail Restaurant", () async {
        when(restaurantService.getDetailRestaurant(id: "rqdv5juczeskfw1e867"))
            .thenAnswer(
          (_) async => Future.value(
            GetDetailRestaurantResponse.fromJson(
              jsonDecode(dummyJsonGetDetailRestaurantResponse),
            ),
          ),
        );
        final DetailRestaurantController detailController =
            DetailRestaurantController(
          restaurantService: restaurantService,
          restaurant: dummyRestaurant,
        );
        await detailController.getDetailRestaurant("rqdv5juczeskfw1e867");
        expect(detailController.restaurant, dummyRestaurant);
      });
    });
  });
}
