import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/controllers/restaurant_controller.dart';
import 'package:meally_app/models/restaurant.dart';
import 'package:meally_app/pages/bookingDetails_page.dart';
import 'package:meally_app/pages/checkout_page.dart';
import 'package:meally_app/pages/login_page.dart';

ControllerRestaurant controllerRestaurant = ControllerRestaurant();

class BookingDatePage extends StatefulWidget {
  const BookingDatePage({
    Key key,
    // @required this.controllerLogin,
    @required this.restaurant,
    @required this.qtdPessoas,

    // @required this.distance
  }) : super(key: key);

  // final ControllerLogin controllerLogin;

  final Restaurant restaurant;
  final int qtdPessoas; // final String distance;

  @override
  _BookingDatePageState createState() => _BookingDatePageState();
}

class _BookingDatePageState extends State<BookingDatePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  DateTime dateTime;
  String booking;

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
                    "Quando será a reserva?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(254, 78, 78, 1),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 50,
                    width: 300,
                    child: RaisedButton(
                      color: Color.fromRGBO(254, 78, 78, 1),
                      child: Text(
                        "Hoje",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        setState(() {
                          dateTime = DateTime.now();
                        });
                        print(dateTime);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 50,
                    width: 300,
                    child: RaisedButton(
                      color: Colors.orangeAccent,
                      child: Text(
                        "Outro dia",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                dateTime == null
                    ? Center()
                    : Column(
                        children: <Widget>[
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
                                      color: booking == "12:00 - 13:00"
                                          ? Color.fromRGBO(254, 78, 78, 1)
                                          : Colors.white,
                                      border: Border.all(
                                          color: Color.fromRGBO(254, 78, 78, 1),
                                          width: 0.6),
                                    ),
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "12:00 - 13:00",
                                          style: TextStyle(
                                              color: booking == "12:00 - 13:00"
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      booking = "12:00 - 13:00";
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
                                      color: booking == "18:00 - 19:00"
                                          ? Color.fromRGBO(254, 78, 78, 1)
                                          : Colors.white,
                                      border: Border.all(
                                          color: Color.fromRGBO(254, 78, 78, 1),
                                          width: 0.6),
                                    ),
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "18:00 - 19:00",
                                          style: TextStyle(
                                              color: booking == "18:00 - 19:00"
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      booking = "18:00 - 19:00";
                                    });
                                  },
                                ),
                              ),
                            ],
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
                                      color: booking == "18:30 - 20:00"
                                          ? Color.fromRGBO(254, 78, 78, 1)
                                          : Colors.white,
                                      border: Border.all(
                                          color: Color.fromRGBO(254, 78, 78, 1),
                                          width: 0.6),
                                    ),
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "18:30 - 20:00",
                                          style: TextStyle(
                                              color: booking == "18:30 - 20:00"
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      booking = "18:30 - 20:00";
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
                                      color: booking == "20:00 - 21:30"
                                          ? Color.fromRGBO(254, 78, 78, 1)
                                          : Colors.white,
                                      border: Border.all(
                                          color: Color.fromRGBO(254, 78, 78, 1),
                                          width: 0.6),
                                    ),
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "20:00 - 21:30",
                                          style: TextStyle(
                                              color: booking == "20:00 - 21:30"
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      booking = "20:00 - 21:30";
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                dateTime == null || booking == null
                    ? Center()
                    : Container(
                        height: 50,
                        width: 300,
                        child: RaisedButton(
                          color: Color.fromRGBO(254, 78, 78, 1),
                          child: Text(
                            "Continuar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingDetailsPage(
                                  restaurant: widget.restaurant,
                                  qtdPessoas: widget.qtdPessoas,
                                  booking: booking,
                                  dateTime: dateTime,
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
