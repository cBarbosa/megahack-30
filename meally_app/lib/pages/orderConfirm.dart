import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/booking_controller.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/controllers/restaurant_controller.dart';
import 'package:meally_app/models/menu.dart';
import 'package:meally_app/models/restaurant.dart';
import 'package:meally_app/pages/checkout_page.dart';
import 'package:meally_app/pages/home_page.dart';
import 'package:meally_app/pages/login_page.dart';
import 'package:provider/provider.dart';

import 'orderPage_widget.dart';

ControllerRestaurant controllerRestaurant = ControllerRestaurant();

class OrderConfirmPage extends StatefulWidget {
  const OrderConfirmPage({
    Key key,
    // @required this.controllerLogin,
    @required this.restaurant,
    @required this.qtdPessoas,
    @required this.dateTime,
    @required this.booking,
    @required this.area,
    @required this.fumantes,
    @required this.carrinho,

    // @required this.distance
  }) : super(key: key);

  // final ControllerLogin controllerLogin;

  final Restaurant restaurant;
  final int qtdPessoas;
  final DateTime dateTime;
  final String booking;
  final String area;
  final bool fumantes;
  final List<Menu> carrinho;

  @override
  _OrderConfirmPageState createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //controllerRestaurant.getMenu(widget.restaurant.restaurantId);

    for (int i = 0; i < widget.carrinho.length; i++) {
      total = total + widget.carrinho[i].price;
      print(total);
    }
  }

  List<Menu> carrinho = [];

  double total = 0;

  @override
  Widget build(BuildContext context) {
    ControllerBooking controllerBooking =
        Provider.of<ControllerBooking>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 78, 78, 1),
        title: Text("Reserva - ${widget.restaurant.name}"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Revisão da Reserva",
                    style: TextStyle(
                        color: Color.fromRGBO(254, 78, 78, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0, left: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Informações Gerais:",
                    style: TextStyle(
                        color: Color.fromRGBO(254, 78, 78, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Data: ${widget.dateTime.day}/${widget.dateTime.month}/${widget.dateTime.year}",
                    style: TextStyle(
                        color: Color.fromRGBO(254, 78, 78, 1), fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Hora: ${widget.booking}",
                    style: TextStyle(
                        color: Color.fromRGBO(254, 78, 78, 1), fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Quantidade de cadeiras: ${widget.qtdPessoas}",
                    style: TextStyle(
                        color: Color.fromRGBO(254, 78, 78, 1), fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Área: ${widget.area}",
                    style: TextStyle(
                        color: Color.fromRGBO(254, 78, 78, 1), fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0, left: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Itens do Pedido:",
                    style: TextStyle(
                        color: Color.fromRGBO(254, 78, 78, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                child: new ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: widget.carrinho.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return GestureDetector(
                        child: new Card(
                          elevation: 5,
                          child: ClipPath(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(254, 78, 78, 1),
                                      width: 0.3)),
                              child: Row(
                                children: [
                                  Image.network(
                                    widget.carrinho[index].photo,
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 150,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            widget.carrinho[index].name,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    254, 78, 78, 1),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            "R\$ ${widget.carrinho[index].price}",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    254, 78, 78, 1),
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => RestaurantPage(
                          //         controllerLogin: widget.controllerLogin,
                          //         restaurant: widget
                          //             .controllerRestaurant.restaurants[index],
                          //         distance:
                          //             widget.controllerRestaurant.distances[index],
                          //       ),
                          //     ));
                        },
                      );
                    }),
              ),
              carrinho.isEmpty
                  ? Center()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 50,
                        width: 300,
                        child: RaisedButton(
                          color: Color.fromRGBO(254, 78, 78, 1),
                          child: Text(
                            "Pedido - ${carrinho.length} itens",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => OrderPage(),
                            //   ),
                            // );
                          },
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, left: 16, top: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Total: R\$ $total",
                    style: TextStyle(
                        color: Color.fromRGBO(254, 78, 78, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
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
                      "Confirmar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      controllerBooking.area = widget.area;
                      controllerBooking.booking = widget.booking;
                      controllerBooking.carrinho = widget.carrinho;
                      controllerBooking.dateTime = widget.dateTime;
                      controllerBooking.fumantes = widget.fumantes;
                      controllerBooking.qtdPessoas = widget.qtdPessoas;
                      controllerBooking.restaurant = widget.restaurant;

                      showAlertDialog(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => OrderPage(
                      //       booking: widget.booking,
                      //       dateTime: widget.dateTime,
                      //       qtdPessoas: widget.qtdPessoas,
                      //       restaurant: widget.restaurant,
                      //       area: area,
                      //       fumantes: fumantes,
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Reservar Confirmada"),
    content: Text("Sua reserva foi confirmada. Obrigado!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
