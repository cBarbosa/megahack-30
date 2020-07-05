import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meally_app/models/restaurant.dart';
import 'package:mobx/mobx.dart';

part 'restaurant_controller.g.dart';

//flutter pub run build_runner build
//flutter pub run build_runner clean

class ControllerRestaurant = ControllerRestaurantBase
    with _$ControllerRestaurant;

abstract class ControllerRestaurantBase with Store {
  Dio dio;
  _init() {
    BaseOptions options = new BaseOptions(
      baseUrl: "https://megahack-30.azurewebsites.net/",
      connectTimeout: 5000,
    );
    dio = new Dio(options);
  }

  @observable
  List<Restaurant> restaurants;

  @observable
  List<String> distances = [];

  @observable
  List<String> durations = [];

  @action
  getRestaurants() async {
    _init();

    try {
      Response response = await dio.get("/Restaurant");

      print("LOG - SEND GET RESTAURANT - DATA -> ${response.data}");
      print("LOG - SEND GET RESTAURANT - CODE -> ${response.statusCode}");

      print(response.data[0]);

      List<Restaurant> itemsList = List<Restaurant>.from(
          response.data.map((i) => Restaurant.fromJson(i)));

      restaurants = itemsList;

      print(restaurants);
    } on DioError catch (e) {
      print(
          "LOG - SEND GET RESTAURANT - ERROR CODE -> ${e.response.statusCode}");
      print("LOG - SEND GET RESTAURANT - ERROR MESSAGE -> ${e.message}");

      if (e.response.statusCode == 404) {
        print(
            "LOG - SEND GET RESTAURANT - ERROR RESPONSE -> ${e.response.data}");
      } else {
        print("LOG - SEND GET RESTAURANT - ERROR REQUEST -> ${e.request.data}");
      }
    }
  }
}
