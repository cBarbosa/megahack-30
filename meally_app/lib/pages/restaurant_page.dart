import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/controllers/restaurant_controller.dart';
import 'package:meally_app/pages/checkout_page.dart';
import 'package:meally_app/pages/login_page.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage(
      {Key key,
      @required this.controllerLocation,
      @required this.controllerLogin,
      @required this.controllerRestaurant})
      : super(key: key);

  final ControllerLocation controllerLocation;
  final ControllerLogin controllerLogin;
  final ControllerRestaurant controllerRestaurant;

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 78, 78, 1),
        title: Text(widget.controllerRestaurant.restaurants[0].name),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Image.network(widget.controllerRestaurant.restaurants[0].photo),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "${widget.controllerRestaurant.distances[0]} de você",
                  style: TextStyle(
                    color: Color.fromRGBO(254, 78, 78, 1),
                  ),
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
            Expanded(
              child: new ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: widget.controllerRestaurant.restaurants.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new Card(
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
                                widget.controllerRestaurant.restaurants[index]
                                    .photo,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 150,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      widget.controllerRestaurant
                                          .restaurants[index].name,
                                      style: TextStyle(
                                          color: Color.fromRGBO(254, 78, 78, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.pin_drop,
                                          color: Color.fromRGBO(254, 78, 78, 1),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.timer,
                                          color: Color.fromRGBO(254, 78, 78, 1),
                                        ),
                                        Text(widget.controllerRestaurant
                                            .durations[index]),
                                      ],
                                    ),
                                  ],
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
                    );
                  }),
            ),
            Center(
              child: RaisedButton(
                child: Text("Checkout Page"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage()),
                  );
                },
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("ETA"),
                onPressed: () {
                  widget.controllerLocation
                      .calculateETA("-15.943175,-48.266988");
                },
              ),
            ),
            Observer(
              builder: (_) {
                return widget.controllerLocation.distance.isNotEmpty &&
                        widget.controllerLocation.distance.isNotEmpty
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Center(
                            child: Text(widget.controllerLocation.distance),
                          ),
                          Center(
                            child: Text(widget.controllerLocation.duration),
                          ),
                        ],
                      )
                    : Center();
              },
            ),
            Center(
              child: RaisedButton(
                child: Text("Sair"),
                onPressed: () {
                  widget.controllerLogin.logout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
