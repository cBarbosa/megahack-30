import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/controllers/restaurant_controller.dart';
import 'package:meally_app/models/menu.dart';
import 'package:meally_app/models/restaurant.dart';
import 'package:meally_app/pages/checkout_page.dart';
import 'package:meally_app/pages/login_page.dart';

import 'orderConfirm.dart';
import 'orderPage_widget.dart';

ControllerRestaurant controllerRestaurant = ControllerRestaurant();

class OrderPage extends StatefulWidget {
  const OrderPage({
    Key key,
    // @required this.controllerLogin,
    @required this.restaurant,
    @required this.qtdPessoas,
    @required this.dateTime,
    @required this.booking,
    @required this.area,
    @required this.fumantes,

    // @required this.distance
  }) : super(key: key);

  // final ControllerLogin controllerLogin;

  final Restaurant restaurant;
  final int qtdPessoas;
  final DateTime dateTime;
  final String booking;
  final String area;
  final bool fumantes;
  // final String distance;

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerRestaurant.getMenu(widget.restaurant.restaurantId);
  }

  List<Menu> carrinho = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 78, 78, 1),
        title: Text("Reserva - ${widget.restaurant.name}"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Observer(builder: (_) {
                return controllerRestaurant.menu.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          //scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(0),
                          itemCount: controllerRestaurant.menu.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: new Card(
                                elevation: 5,
                                child: ClipPath(
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Color.fromRGBO(254, 78, 78, 1),
                                            width: 0.3)),
                                    child: Column(
                                      children: [
                                        Image.network(
                                            controllerRestaurant
                                                .menu[index].photo,
                                            fit: BoxFit.cover,
                                            height: 60,
                                            width: 180),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Text(
                                                controllerRestaurant
                                                    .menu[index].name,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        254, 78, 78, 1),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "R\$ ${controllerRestaurant.menu[index].price}",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              254, 78, 78, 1),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: Colors.red,
                                                      ),
                                                      height: 25,
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      print(controllerRestaurant
                                                          .menu[index].name);

                                                      setState(() {
                                                        carrinho.add(
                                                            controllerRestaurant
                                                                .menu[index]);
                                                      });
                                                    },
                                                  ),
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
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                        ),
                      );
              }),
              carrinho.isEmpty
                  ? Center()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 50,
                        width: 300,
                        child: RaisedButton(
                          color: Color.fromRGBO(254, 78, 78, 1),
                          child: Text(
                            "Pedido - ${carrinho.length} itens",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderConfirmPage(
                                  area: widget.area,
                                  dateTime: widget.dateTime,
                                  booking: widget.booking,
                                  carrinho: carrinho,
                                  qtdPessoas: widget.qtdPessoas,
                                  restaurant: widget.restaurant,
                                  fumantes: widget.fumantes,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
