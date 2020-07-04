import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/checkout_controller.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/widgets/home_widget.dart';
import 'package:provider/provider.dart';

import 'checkout_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget currentWidget;

  @override
  Widget build(BuildContext context) {
    ControllerLogin controllerLogin = Provider.of<ControllerLogin>(context);
    ControllerLocation controllerLocation =
        Provider.of<ControllerLocation>(context);

    if (_page == 0) {
      currentWidget = HomeWidget(
          controllerLocation: controllerLocation,
          controllerLogin: controllerLogin);
    }

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color.fromRGBO(254, 78, 78, 1),
        buttonBackgroundColor: Color.fromRGBO(254, 78, 78, 1),
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          Image.asset(
            "assets/qr-code.png",
            height: 40,
            width: 40,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            print(_page);

            switch (_page) {
              case 0:
                currentWidget = HomeWidget(
                    controllerLocation: controllerLocation,
                    controllerLogin: controllerLogin);
                break;
              case 1:
                currentWidget = Container(
                  color: Colors.white,
                );
                break;
              case 2:
                currentWidget = Container(
                  color: Colors.red,
                );
                break;
            }
          });
        },
      ),
      body: Container(color: Colors.blueAccent, child: currentWidget),
    );
  }

  var _child;

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          LoginPage();

          break;
        case 1:
          HomePage();

          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}
