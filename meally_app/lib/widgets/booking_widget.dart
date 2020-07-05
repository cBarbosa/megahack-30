import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/booking_controller.dart';
import 'package:meally_app/controllers/checkout_controller.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/controllers/restaurant_controller.dart';
import 'package:meally_app/models/product.dart';
import 'package:meally_app/pages/checkout_page.dart';
import 'package:meally_app/pages/login_page.dart';
import 'package:meally_app/pages/restaurant_page.dart';
import 'package:provider/provider.dart';

class BookingWidget extends StatefulWidget {
  const BookingWidget(
      {Key key,
      @required this.controllerLocation,
      @required this.controllerLogin,
      @required this.controllerRestaurant})
      : super(key: key);

  final ControllerLocation controllerLocation;
  final ControllerLogin controllerLogin;
  final ControllerRestaurant controllerRestaurant;

  @override
  _BookingWidgetState createState() => _BookingWidgetState();
}

List<Product> products = [];

class _BookingWidgetState extends State<BookingWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ControllerBooking controllerBooking =
        Provider.of<ControllerBooking>(context);
    ControllerCheckout controllerCheckout =
        Provider.of<ControllerCheckout>(context);
    ControllerLogin controllerLogin = Provider.of<ControllerLogin>(context);

    for (int i = 0; i < controllerBooking.carrinho.length; i++) {
      products.add(Product(
          id: controllerBooking.carrinho[i].code,
          title: controllerBooking.carrinho[i].name,
          currencyId: "BRL",
          pictureUrl: controllerBooking.carrinho[i].photo,
          description: controllerBooking.carrinho[i].description,
          categoryId: "Comida",
          quantity: 1,
          unitPrice: controllerBooking.carrinho[i].price));
    }
    return Observer(builder: (_) {
      return controllerBooking.restaurant == null
          ? Center(
              child: Text("Nenhuma Reserva"),
            )
          : Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0, left: 16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        controllerBooking.restaurant.name,
                        style: TextStyle(
                            color: Color.fromRGBO(254, 78, 78, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          controllerBooking.booking,
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "${controllerBooking.dateTime.day}/${controllerBooking.dateTime.month}/${controllerBooking.dateTime.year}",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.people,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          controllerBooking.qtdPessoas.toString(),
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Container(
                      height: 50,
                      width: 300,
                      child: RaisedButton(
                        color: Color.fromRGBO(254, 78, 78, 1),
                        child: Text(
                          "Checkout",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          print("Checkout");
                          controllerCheckout.getPreferenceId(
                              controllerLogin.user, products);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
