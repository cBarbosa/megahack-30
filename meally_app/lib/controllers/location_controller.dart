import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'location_controller.g.dart';

//flutter pub run build_runner build
//flutter pub run build_runner clean

class ControllerLocation = ControllerLocationBase with _$ControllerLocation;

abstract class ControllerLocationBase with Store {
  Dio dio;

  String apiKey = "AIzaSyB-BdZgKsrpI-ninSbpa07_1AMVEn6VhXA";

  @observable
  String origin = "";

  @observable
  String destination = "";

  @observable
  String distance = "";

  @observable
  String duration = "";

  _init() {
    BaseOptions options = new BaseOptions(
      baseUrl: "https://maps.googleapis.com/maps/api/directions/json?",
      connectTimeout: 5000,
    );
    dio = new Dio(options);
  }

  getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    origin = "${position.latitude},${position.longitude}";
    print("---------- ORIGIN ----> $origin");
  }

  @action
  calculateETA(String destination) async {
    await getLocation();

    _init();

    try {
      Response response =
          await dio.get("origin=$origin&destination=$destination&key=$apiKey");

      print("-> ${response.data['routes'][0]['legs'][0]['distance']['text']}");
      print("-> ${response.data['routes'][0]['legs'][0]['duration']['text']}");

      distance = response.data['routes'][0]['legs'][0]['distance']['text'];
      duration = response.data['routes'][0]['legs'][0]['duration']['text'];

      print("LOG - SEND GET ETA - DATA -> ${response.data}");
      print("LOG - SEND GET ETA - CODE -> ${response.statusCode}");
    } on DioError catch (e) {
      print("LOG - SEND GET ETA - ERROR CODE -> ${e.response.statusCode}");
      print("LOG - SEND GET ETA - ERROR MESSAGE -> ${e.message}");

      if (e.response.statusCode == 404) {
        print("LOG - SEND GET ETA - ERROR RESPONSE -> ${e.response.data}");
      } else {
        print("LOG - SEND GET ETA - ERROR REQUEST -> ${e.request.data}");
      }
    }
  }
}
