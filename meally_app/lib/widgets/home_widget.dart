import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/pages/checkout_page.dart';
import 'package:meally_app/pages/login_page.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key key,
    @required this.controllerLocation,
    @required this.controllerLogin,
  }) : super(key: key);

  final ControllerLocation controllerLocation;
  final ControllerLogin controllerLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
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
