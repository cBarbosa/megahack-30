import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/controllers/restaurant_controller.dart';
import 'package:meally_app/models/restaurant.dart';
import 'package:meally_app/pages/booking_page.dart';
import 'package:meally_app/pages/checkout_page.dart';
import 'package:meally_app/pages/login_page.dart';

ControllerRestaurant controllerRestaurant = ControllerRestaurant();

class RestaurantPage extends StatefulWidget {
  const RestaurantPage(
      {Key key,
      @required this.controllerLogin,
      @required this.restaurant,
      @required this.distance})
      : super(key: key);

  final ControllerLogin controllerLogin;

  final Restaurant restaurant;
  final String distance;

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerRestaurant.getMenu(widget.restaurant.restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 78, 78, 1),
        title: Text(widget.restaurant.name),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Image.network(widget.restaurant.photo),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.pin_drop,
                        color: Color.fromRGBO(254, 78, 78, 1),
                      ),
                      Text(
                        "${widget.distance} de você",
                        style: TextStyle(
                          color: Color.fromRGBO(254, 78, 78, 1),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 300,
              child: RaisedButton(
                color: Color.fromRGBO(254, 78, 78, 1),
                child: Text(
                  "Reservar uma  mesa",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingPage(
                        restaurant: widget.restaurant,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "15 mesas disponíveis neste momento",
                style: TextStyle(
                  color: Color.fromRGBO(254, 78, 78, 1),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Cardápio",
                  style: TextStyle(
                      color: Color.fromRGBO(254, 78, 78, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
            ),
            Observer(builder: (_) {
              return controllerRestaurant.menu.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      height: 100,
                      child: new ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(0),
                          itemCount: controllerRestaurant.menu.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ClipPath(
                                child: Container(
                                  height: 90,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromRGBO(254, 78, 78, 1),
                                          width: 0.3)),
                                  child: Image.network(
                                    controllerRestaurant.menu[index].photo,
                                    height: 100,
                                    width: 90,
                                  ),
                                ),
                                clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
            }),
            Container(
              height: 50,
              width: 300,
              child: RaisedButton(
                color: Colors.orangeAccent,
                child: Text(
                  "Cardápio completo",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
