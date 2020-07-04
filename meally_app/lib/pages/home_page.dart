import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/checkout_controller.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/models/product.dart';
import 'package:provider/provider.dart';

import 'checkout_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ControllerCheckout controllerCheckout =
        Provider.of<ControllerCheckout>(context);
    ControllerLogin controllerLogin = Provider.of<ControllerLogin>(context);
    ControllerLocation controllerLocation =
        Provider.of<ControllerLocation>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
                controllerLocation.calculateETA("-15.943175,-48.266988");
              },
            ),
          ),
          Observer(
            builder: (_) {
              return controllerLocation.distance.isNotEmpty &&
                      controllerLocation.distance.isNotEmpty
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Center(
                          child: Text(controllerLocation.distance),
                        ),
                        Center(
                          child: Text(controllerLocation.duration),
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
                controllerLogin.logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
