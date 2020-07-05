import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meally_app/models/product.dart';
import 'package:meally_app/models/user.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';
import 'package:mobx/mobx.dart';

part 'checkout_controller.g.dart';

//flutter pub run build_runner build
//flutter pub run build_runner clean

class ControllerCheckout = ControllerCheckoutBase with _$ControllerCheckout;

abstract class ControllerCheckoutBase with Store {
  @observable
  String publicKey = "TEST-3b644d23-32cb-4f1d-890a-4fe8c836b9a6";

  @observable
  String preferenceId = "";

  @observable
  bool isLoading = false;

  @observable
  String status = "";

  Dio dio;

  _init() {
    BaseOptions options = new BaseOptions(
      baseUrl: "https://api.mercadopago.com/checkout",
      connectTimeout: 5000,
    );
    dio = new Dio(options);
  }

  @action
  getPreferenceId(User user, List<Product> products) async {
    isLoading = true;

    _init();

    String encodedProducts = jsonEncode(products);

    print(encodedProducts);

    try {
      Response response = await dio.post(
        "/preferences?access_token=TEST-3552230799701880-062520-301baed14ac48c9571936d197aabaf8c-13171557",
        data: {
          "items": products,
          "payer": {
            "name": user.name,
            //"surname": user.name,
            "email": user.email,
            // "phone": {"area_code": "11", "number": "4444-4444"},
            // "identification": {"type": "CPF", "number": "19119119100"},
            // "address": {
            //   "street_name": "Street",
            //   "street_number": 123,
            //   "zip_code": "06233200"
            // }
          },
          "back_urls": {
            "success": "https://www.success.com",
            "failure": "http://www.failure.com",
            "pending": "http://www.pending.com"
          },
          "auto_return": "approved",
          "payment_methods": {
            // "excluded_payment_methods": [
            //   {"id": "master"}
            // ],
            "excluded_payment_types": [
              {"id": "ticket"}
            ],
            "installments": 1
          },
        },
      );

      preferenceId = response.data['id'];
      if (response.statusCode == 201) {
        checkout();
        isLoading = false;
      }

      print("LOG - SEND GET ID - DATA -> ${response.data['id']}");
      print("LOG - SEND GET ID - CODE -> ${response.statusCode}");
    } on DioError catch (e) {
      print("LOG - SEND GET ID - ERROR CODE -> ${e.response.statusCode}");
      print("LOG - SEND GET ID - ERROR MESSAGE -> ${e.message}");
      isLoading = false;

      if (e.response.statusCode == 404) {
        print("LOG - SEND GET ID - ERROR RESPONSE -> ${e.response.data}");
      } else {
        print("LOG - SEND GET ID - ERROR REQUEST -> ${e.request.data}");
      }
    }
  }

  @action
  checkout() async {
    var result = await MercadoPagoMobileCheckout.startCheckout(
      publicKey,
      preferenceId,
    );
    print(result);
    status = result.status;

    print("========= $status");
  }
}
