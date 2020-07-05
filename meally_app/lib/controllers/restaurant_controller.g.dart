// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerRestaurant on ControllerRestaurantBase, Store {
  final _$restaurantsAtom = Atom(name: 'ControllerRestaurantBase.restaurants');

  @override
  List<Restaurant> get restaurants {
    _$restaurantsAtom.reportRead();
    return super.restaurants;
  }

  @override
  set restaurants(List<Restaurant> value) {
    _$restaurantsAtom.reportWrite(value, super.restaurants, () {
      super.restaurants = value;
    });
  }

  final _$distancesAtom = Atom(name: 'ControllerRestaurantBase.distances');

  @override
  List<String> get distances {
    _$distancesAtom.reportRead();
    return super.distances;
  }

  @override
  set distances(List<String> value) {
    _$distancesAtom.reportWrite(value, super.distances, () {
      super.distances = value;
    });
  }

  final _$durationsAtom = Atom(name: 'ControllerRestaurantBase.durations');

  @override
  List<String> get durations {
    _$durationsAtom.reportRead();
    return super.durations;
  }

  @override
  set durations(List<String> value) {
    _$durationsAtom.reportWrite(value, super.durations, () {
      super.durations = value;
    });
  }

  final _$getRestaurantsAsyncAction =
      AsyncAction('ControllerRestaurantBase.getRestaurants');

  @override
  Future getRestaurants() {
    return _$getRestaurantsAsyncAction.run(() => super.getRestaurants());
  }

  @override
  String toString() {
    return '''
restaurants: ${restaurants},
distances: ${distances},
durations: ${durations}
    ''';
  }
}
