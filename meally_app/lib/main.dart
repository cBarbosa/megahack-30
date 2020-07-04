import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meally_app/controllers/checkout_controller.dart';
import 'package:meally_app/controllers/location_controller.dart';
import 'package:meally_app/pages/login_page.dart';
import 'package:provider/provider.dart';

import 'controllers/login_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ControllerLogin>(
          create: (_) => ControllerLogin(),
        ),
        Provider<ControllerCheckout>(
          create: (_) => ControllerCheckout(),
        ),
        Provider<ControllerLocation>(
          create: (_) => ControllerLocation(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meally',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CustomSplash(
          imagePath: 'assets/logo_meally.png',
          backGroundColor: Color.fromRGBO(254, 78, 78, 1),
          animationEffect: 'zoom-in',
          logoSize: 200,
          home: LoginPage(),
          duration: 2500,
          type: CustomSplashType.StaticDuration,
        ),
      ),
    );
  }
}
