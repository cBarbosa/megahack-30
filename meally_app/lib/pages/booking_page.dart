import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/controllers/restaurant_controller.dart';
import 'package:meally_app/models/restaurant.dart';
import 'package:meally_app/pages/checkout_page.dart';
import 'package:meally_app/pages/login_page.dart';

import 'bookingDate_page.dart';

ControllerRestaurant controllerRestaurant = ControllerRestaurant();

class BookingPage extends StatefulWidget {
  const BookingPage({
    Key key,
    // @required this.controllerLogin,
    @required this.restaurant,
    // @required this.distance
  }) : super(key: key);

  // final ControllerLogin controllerLogin;

  final Restaurant restaurant;
  // final String distance;

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                    "Serão quantas pessoas na mesa?",
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
                        "2",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingDatePage(
                              restaurant: widget.restaurant,
                              qtdPessoas: 2,
                            ),
                          ),
                        );
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
                        "4",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingDatePage(
                              restaurant: widget.restaurant,
                              qtdPessoas: 4,
                            ),
                          ),
                        );
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
                      color: Colors.greenAccent,
                      child: Text(
                        "6",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingDatePage(
                              restaurant: widget.restaurant,
                              qtdPessoas: 6,
                            ),
                          ),
                        );
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
                      color: Colors.green,
                      child: Text(
                        "8",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingDatePage(
                              restaurant: widget.restaurant,
                              qtdPessoas: 8,
                            ),
                          ),
                        );
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
                      color: Colors.grey,
                      child: Text(
                        "+8",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {},
                    ),
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
