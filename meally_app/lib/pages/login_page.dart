import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meally_app/controllers/login_controller.dart';

import 'package:provider/provider.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ControllerLogin controllerLogin = Provider.of<ControllerLogin>(context);
    controllerLogin.getUser();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Observer(
              builder: (_) {
                return controllerLogin.user == null
                    ? Align()
                    : Column(
                        children: <Widget>[
                          FlutterLogo(
                            size: 100,
                          ),
                        ],
                      );
              },
            ),
            Observer(
              builder: (_) {
                if (controllerLogin.user != null) {
                  print("Logado com  sucesso ${controllerLogin.user.email}");
                  Future.delayed(Duration.zero, () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  });
                }
                return controllerLogin.isLoggging
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: <Widget>[
                          Container(
                            child: GoogleSignInButton(
                              text: "Entrar com Google",
                              splashColor: Colors.red,
                              darkMode: true,
                              onPressed: () {
                                print("Google");
                                controllerLogin.handleGoogleSignIn();
                              },
                            ),
                          ),
                          Container(
                            child: FacebookSignInButton(
                              text: "Entrar com Facebook",
                              splashColor: Colors.red,
                              onPressed: () {
                                print("Facebook");
                                //controllerLogin.handleFacebookSignIn();
                              },
                            ),
                          ),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
