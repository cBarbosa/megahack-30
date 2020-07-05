import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/pages/checkout_page.dart';
import 'package:meally_app/pages/login_page.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key key,
    @required this.controllerLocation,
    @required this.controllerLogin,
  }) : super(key: key);

  final ControllerLocation controllerLocation;
  final ControllerLogin controllerLogin;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            color: Color.fromRGBO(254, 78, 78, 1),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 30, top: 25),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 22, right: 30),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 6),
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            hintText: 'Pesquise aqui...',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                                fontFamily: 'AvenirLight'),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: new UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0)),
                          ),
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontFamily: 'AvenirLight'),
                          //  controller: _passwordController,
                          obscureText: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                widget.controllerLocation.calculateETA("-15.943175,-48.266988");
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
    );
  }
}
