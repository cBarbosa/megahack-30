import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/checkout_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/models/product.dart';
import 'package:provider/provider.dart';

import 'checkout_page.dart';

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
        ],
      ),
    );
  }
}
