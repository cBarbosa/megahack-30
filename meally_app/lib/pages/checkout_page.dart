import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/checkout_controller.dart';
import 'package:meally_app/controllers/login_controller.dart';
import 'package:meally_app/models/product.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

Product cachorroQuente = Product(
    id: "item-ID-1234",
    title: "Cachorro Quente",
    currencyId: "BRL",
    pictureUrl:
        "https://img1.gratispng.com/20180528/vfs/kisspng-french-fries-hamburger-bacon-barbecue-sauce-potato-batata-frita-5b0c1b3aa9a421.6938549615275200586949.jpg",
    description: "",
    categoryId: "Comida",
    quantity: 1,
    unitPrice: 23.99);

Product batata = Product(
    id: "item-ID-1235",
    title: "Batata  Frita",
    currencyId: "BRL",
    pictureUrl:
        "https://img1.gratispng.com/20180528/vfs/kisspng-french-fries-hamburger-bacon-barbecue-sauce-potato-batata-frita-5b0c1b3aa9a421.6938549615275200586949.jpg",
    description: "com sal",
    categoryId: "Comida",
    quantity: 1,
    unitPrice: 13.99);

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    ControllerCheckout controllerCheckout =
        Provider.of<ControllerCheckout>(context);
    ControllerLogin controllerLogin = Provider.of<ControllerLogin>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 78, 78, 1),
        title: Text("Realizar Checkout"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Observer(builder: (_) {
            if (controllerCheckout.status == "approved") {
              Navigator.pop(context);
              controllerCheckout.status = "";
            }
            return Center(
              child: controllerCheckout.isLoading
                  ? CircularProgressIndicator()
                  : RaisedButton(
                      child: Text("Realizar Checkout"),
                      onPressed: () {
                        controllerCheckout.getPreferenceId(
                            controllerLogin.user, [cachorroQuente, batata]);
                      },
                    ),
            );
          }),
        ],
      ),
    );
  }
}
