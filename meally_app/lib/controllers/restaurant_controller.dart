import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meally_app/models/menu.dart';
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
  List<Restaurant> restaurants = [];

  @observable
  List<String> distances = [];

  @observable
  List<String> durations = [];

  @observable
  List<Menu> menu = [];

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

  @action
  getMenu(int id) async {
    _init();

    try {
      Response response = await dio.get("/Restaurant/$id");

      print("LOG - SEND GET MENU - DATA -> ${response.data['menu']['meals']}");
      print("LOG - SEND GET MENU - CODE -> ${response.statusCode}");

      List<Menu> itemsList = List<Menu>.from(
          response.data['menu']['meals'].map((i) => Menu.fromJson(i)));

      print(itemsList[0].name);

      menu = itemsList;
    } on DioError catch (e) {
      print("LOG - SEND GET MENU- ERROR CODE -> ${e.response.statusCode}");
      print("LOG - SEND GET MENU - ERROR MESSAGE -> ${e.message}");

      if (e.response.statusCode == 404) {
        print("LOG - SEND GET MENU - ERROR RESPONSE -> ${e.response.data}");
      } else {
        print("LOG - SEND GET MENU - ERROR REQUEST -> ${e.request.data}");
      }
    }
  }
}
