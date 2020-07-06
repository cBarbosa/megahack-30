import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/controllers/restaurant_controller.dart';
import 'package:meally_app/models/restaurant.dart';
import 'package:meally_app/pages/checkout_page.dart';
import 'package:meally_app/pages/login_page.dart';

import 'orderPage_widget.dart';

ControllerRestaurant controllerRestaurant = ControllerRestaurant();

class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage({
    Key key,
    // @required this.controllerLogin,
    @required this.restaurant,
    @required this.qtdPessoas,
    @required this.dateTime,
    @required this.booking,

    // @required this.distance
  }) : super(key: key);

  // final ControllerLogin controllerLogin;

  final Restaurant restaurant;
  final int qtdPessoas;
  final DateTime dateTime;
  final String booking;
  // final String distance;

  @override
  _BookingDetailsPageState createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String area;
  bool fumantes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 78, 78, 1),
        title: Text("Reserva - ${widget.restaurant.name}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    "Qual área?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(254, 78, 78, 1),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            color: area == "interna"
                                ? Color.fromRGBO(254, 78, 78, 1)
                                : Colors.white,
                            border: Border.all(
                                color: Color.fromRGBO(254, 78, 78, 1),
                                width: 0.6),
                          ),
                          child: Container(
                            child: Center(
                              child: Text(
                                "Interna",
                                style: TextStyle(
                                    color: area == "interna"
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            area = "interna";
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            color: area == "externa"
                                ? Color.fromRGBO(254, 78, 78, 1)
                                : Colors.white,
                            border: Border.all(
                                color: Color.fromRGBO(254, 78, 78, 1),
                                width: 0.6),
                          ),
                          child: Container(
                            child: Center(
                              child: Text(
                                "Externa",
                                style: TextStyle(
                                    color: area == "externa"
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            area = "externa";
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    "Local para fumantes?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(254, 78, 78, 1),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            color: fumantes == true
                                ? Color.fromRGBO(254, 78, 78, 1)
                                : Colors.white,
                            border: Border.all(
                                color: Color.fromRGBO(254, 78, 78, 1),
                                width: 0.6),
                          ),
                          child: Container(
                            child: Center(
                              child: Text(
                                "Sim",
                                style: TextStyle(
                                    color: fumantes == true
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            fumantes = true;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            color: fumantes == false
                                ? Color.fromRGBO(254, 78, 78, 1)
                                : Colors.white,
                            border: Border.all(
                                color: Color.fromRGBO(254, 78, 78, 1),
                                width: 0.6),
                          ),
                          child: Container(
                            child: Center(
                              child: Text(
                                "Não",
                                style: TextStyle(
                                    color: fumantes == false
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            fumantes = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                area == null || fumantes == null
                    ? Center()
                    : Container(
                        height: 50,
                        width: 300,
                        child: RaisedButton(
                          color: Color.fromRGBO(254, 78, 78, 1),
                          child: Text(
                            "Fazer pedido",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderPage(
                                  booking: widget.booking,
                                  dateTime: widget.dateTime,
                                  qtdPessoas: widget.qtdPessoas,
                                  restaurant: widget.restaurant,
                                  area: area,
                                  fumantes: fumantes,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
