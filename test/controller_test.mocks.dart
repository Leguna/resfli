// Mocks generated by Mockito 5.3.2 from annotations
// in resfli/test/controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:get/get.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:resfli/index.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeInternalFinalCallback_0<T> extends _i1.SmartFake
    implements _i2.InternalFinalCallback<T> {
  _FakeInternalFinalCallback_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetListRestaurantResponse_1 extends _i1.SmartFake
    implements _i3.GetListRestaurantResponse {
  _FakeGetListRestaurantResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetDetailRestaurantResponse_2 extends _i1.SmartFake
    implements _i3.GetDetailRestaurantResponse {
  _FakeGetDetailRestaurantResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSearchRestaurantResponse_3 extends _i1.SmartFake
    implements _i3.SearchRestaurantResponse {
  _FakeSearchRestaurantResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddNewReviewResponse_4 extends _i1.SmartFake
    implements _i3.AddNewReviewResponse {
  _FakeAddNewReviewResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RestaurantService].
///
/// See the documentation for Mockito's code generation for more information.
class MockRestaurantService extends _i1.Mock implements _i3.RestaurantService {
  @override
  _i2.InternalFinalCallback<void> get onStart => (super.noSuchMethod(
        Invocation.getter(#onStart),
        returnValue: _FakeInternalFinalCallback_0<void>(
          this,
          Invocation.getter(#onStart),
        ),
        returnValueForMissingStub: _FakeInternalFinalCallback_0<void>(
          this,
          Invocation.getter(#onStart),
        ),
      ) as _i2.InternalFinalCallback<void>);
  @override
  _i2.InternalFinalCallback<void> get onDelete => (super.noSuchMethod(
        Invocation.getter(#onDelete),
        returnValue: _FakeInternalFinalCallback_0<void>(
          this,
          Invocation.getter(#onDelete),
        ),
        returnValueForMissingStub: _FakeInternalFinalCallback_0<void>(
          this,
          Invocation.getter(#onDelete),
        ),
      ) as _i2.InternalFinalCallback<void>);
  @override
  bool get initialized => (super.noSuchMethod(
        Invocation.getter(#initialized),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i4.Future<_i3.GetListRestaurantResponse> getListRestaurant(
          {int? page = 1}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getListRestaurant,
          [],
          {#page: page},
        ),
        returnValue: _i4.Future<_i3.GetListRestaurantResponse>.value(
            _FakeGetListRestaurantResponse_1(
          this,
          Invocation.method(
            #getListRestaurant,
            [],
            {#page: page},
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i3.GetListRestaurantResponse>.value(
                _FakeGetListRestaurantResponse_1(
          this,
          Invocation.method(
            #getListRestaurant,
            [],
            {#page: page},
          ),
        )),
      ) as _i4.Future<_i3.GetListRestaurantResponse>);
  @override
  _i4.Future<_i3.GetDetailRestaurantResponse> getDetailRestaurant(
          {required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailRestaurant,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<_i3.GetDetailRestaurantResponse>.value(
            _FakeGetDetailRestaurantResponse_2(
          this,
          Invocation.method(
            #getDetailRestaurant,
            [],
            {#id: id},
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i3.GetDetailRestaurantResponse>.value(
                _FakeGetDetailRestaurantResponse_2(
          this,
          Invocation.method(
            #getDetailRestaurant,
            [],
            {#id: id},
          ),
        )),
      ) as _i4.Future<_i3.GetDetailRestaurantResponse>);
  @override
  _i4.Future<_i3.SearchRestaurantResponse> searchRestaurant(
          {required String? query}) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchRestaurant,
          [],
          {#query: query},
        ),
        returnValue: _i4.Future<_i3.SearchRestaurantResponse>.value(
            _FakeSearchRestaurantResponse_3(
          this,
          Invocation.method(
            #searchRestaurant,
            [],
            {#query: query},
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i3.SearchRestaurantResponse>.value(
                _FakeSearchRestaurantResponse_3(
          this,
          Invocation.method(
            #searchRestaurant,
            [],
            {#query: query},
          ),
        )),
      ) as _i4.Future<_i3.SearchRestaurantResponse>);
  @override
  _i4.Future<_i3.AddNewReviewResponse> addNewReview({
    required String? id,
    required String? name,
    required String? review,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addNewReview,
          [],
          {
            #id: id,
            #name: name,
            #review: review,
          },
        ),
        returnValue: _i4.Future<_i3.AddNewReviewResponse>.value(
            _FakeAddNewReviewResponse_4(
          this,
          Invocation.method(
            #addNewReview,
            [],
            {
              #id: id,
              #name: name,
              #review: review,
            },
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i3.AddNewReviewResponse>.value(
            _FakeAddNewReviewResponse_4(
          this,
          Invocation.method(
            #addNewReview,
            [],
            {
              #id: id,
              #name: name,
              #review: review,
            },
          ),
        )),
      ) as _i4.Future<_i3.AddNewReviewResponse>);
  @override
  void onInit() => super.noSuchMethod(
        Invocation.method(
          #onInit,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onReady() => super.noSuchMethod(
        Invocation.method(
          #onReady,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onClose() => super.noSuchMethod(
        Invocation.method(
          #onClose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void $configureLifeCycle() => super.noSuchMethod(
        Invocation.method(
          #$configureLifeCycle,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
