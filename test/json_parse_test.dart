import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:resfli/index.dart';

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

void main() {
  group("Test Restaurant Parser", () {
    test(
      'should return restaurant type when run fromMap',
      () {
        var result = Restaurant.fromJson(jsonDecode(dummyJsonRestaurant));
        expect(result.id, 'rqdv5juczeskfw1e867');
        expect(result.runtimeType, Restaurant);
      },
    );

    test('should return list restaurant when run fromMap', () {
      var result = GetListRestaurantResponse.fromJson(
          jsonDecode(dummyListRestaurantResponse));
      expect(result.restaurants.length, 2);
      expect(result.restaurants[0].runtimeType, Restaurant);
    });

    test('should return same restaurant when run fromMap', () {
      var result = Restaurant.fromJson(jsonDecode(dummyJsonRestaurant));
      expect(result, dummyRestaurant);
    });
  });
}
