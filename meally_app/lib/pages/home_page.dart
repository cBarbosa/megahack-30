import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/controllers/restaurant_controller.dart';
import 'package:meally_app/widgets/booking_widget.dart';
import 'package:meally_app/widgets/home_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

ControllerRestaurant controllerRestaurant = ControllerRestaurant();
ControllerLocation controllerLocation = ControllerLocation();

class _HomePageState extends State<HomePage> {
  int _page = 0;

  Widget currentWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controllerRestaurant.getRestaurants().whenComplete(() async {
      List<String> distances = [];
      List<String> durations = [];
      for (int i = 0; i < controllerRestaurant.restaurants.length;) {
        await controllerLocation
            .calculateETA(
                "${controllerRestaurant.restaurants[i].coordinate.latitude},${controllerRestaurant.restaurants[i].coordinate.longitude}")
            .whenComplete(() {
          i++;
        }).then((value) async {
          distances.add(value[0]);
          durations.add(value[1]);
        }).whenComplete(() {});

        //print("==== $teste");
      }
      controllerRestaurant.distances = distances;
      controllerRestaurant.durations = durations;
    });
  }

  @override
  Widget build(BuildContext context) {
    ControllerLogin controllerLogin = Provider.of<ControllerLogin>(context);
    ControllerLocation controllerLocation =
        Provider.of<ControllerLocation>(context);

    if (_page == 0) {
      currentWidget = HomeWidget(
          controllerLocation: controllerLocation,
          controllerLogin: controllerLogin,
          controllerRestaurant: controllerRestaurant);
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
                  controllerLogin: controllerLogin,
                  controllerRestaurant: controllerRestaurant,
                );
                break;
              case 1:
                currentWidget = Container(
                  color: Colors.yellow,
                );
                break;
              case 2:
                currentWidget = BookingWidget(
                  controllerLocation: controllerLocation,
                  controllerLogin: controllerLogin,
                  controllerRestaurant: controllerRestaurant,
                );
                break;
              case 3:
                currentWidget = Container(
                  color: Colors.purple,
                );
                break;
              case 4:
                currentWidget = Container(
                  color: Colors.green,
                );
                break;
            }
          });
        },
      ),
      body: Observer(builder: (_) {
        print("======== ${controllerRestaurant.distances}");
        return Container(
            child: controllerRestaurant.distances.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : currentWidget);
      }),
    );
  }
}
