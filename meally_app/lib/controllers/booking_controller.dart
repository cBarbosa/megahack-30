import 'package:dio/dio.dart';
import 'package:meally_app/models/menu.dart';
import 'package:meally_app/models/restaurant.dart';
import 'package:mobx/mobx.dart';

part 'booking_controller.g.dart';

//flutter pub run build_runner build
//flutter pub run build_runner clean

class ControllerBooking = ControllerBookingBase with _$ControllerBooking;

abstract class ControllerBookingBase with Store {
  @observable
  Restaurant restaurant;
  @observable
  int qtdPessoas;
  @observable
  DateTime dateTime;
  @observable
  String booking;
  @observable
  String area;
  @observable
  bool fumantes;
  @observable
  List<Menu> carrinho;

  Dio dio;
  _init() {
    BaseOptions options = new BaseOptions(
      baseUrl: "https://megahack-30.azurewebsites.net/",
      connectTimeout: 5000,
    );
    dio = new Dio(options);
  }

  @action
  sendOrder() async {
    _init();

    try {
      Response response = await dio.post("/Order", data: {
        "transactionId": "string",
        "customerId": 1,
        "restaurantId": restaurant.restaurantId,
        "quantity": carrinho,
        "amount": 0,
        "status": 0,
        "items": [
          {"orderId": 0, "mealId": 0, "quantity": 0, "amount": 0}
        ]
      });

      print("LOG - SEND GET RESTAURANT - DATA -> ${response.data}");
      print("LOG - SEND GET RESTAURANT - CODE -> ${response.statusCode}");

      print(response.data[0]);

      List<Restaurant> itemsList = List<Restaurant>.from(
          response.data.map((i) => Restaurant.fromJson(i)));
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
