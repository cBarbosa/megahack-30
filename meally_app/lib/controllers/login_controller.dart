import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:google_sign_in/google_sign_in.dart';
import 'package:meally_app/models/user.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_controller.g.dart';

//flutter pub run build_runner build
//flutter pub run build_runner clean

class ControllerLogin = ControllerLoginBase with _$ControllerLogin;

abstract class ControllerLoginBase with Store {
  @observable
  User user;

  @observable
  bool isLoggging = false;

  @action
  saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', user.token);
    await prefs.setString('name', user.name);
    await prefs.setString('email', user.email);

    print("-------- USER EMAIL SAVE: ${user.email}");
  }

  @action
  getUser() async {
    isLoggging = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    String name = prefs.getString('name');
    String email = prefs.getString('email');

    print("-------- USER EMAIL GET: $email");

    if (token != null && email != null && name != null) {
      isLoggging = false;
      user = User(name, email, token);
    } else {
      isLoggging = false;
    }
  }

//** LOGIN WITH GOOGLE *********************************************************************************/
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  handleGoogleSignIn() async {
    try {
      isLoggging = true;
      await _googleSignIn.signIn().then((value) async {
        print(value.displayName);
        print(value.email);
        user = User(value.displayName, value.email, value.photoUrl);

        saveUser();
        isLoggging = false;
      });
    } catch (error) {
      isLoggging = false;

      print(error);
      print("Não foi possível realizar o Login, tente novamente!");
    }
  }

  //** LOGIN WITH APPLE *********************************************************************************/
  handleAppleSignIn() async {}

  //** LOGIN WITH FACEBOOK *********************************************************************************/
  // handleFacebookSignIn() async {
  //   isLoggging = true;

  //   final facebookLogin = FacebookLogin();
  //   final result = await facebookLogin.logIn(['email']);

  //   switch (result.status) {
  //     case FacebookLoginStatus.loggedIn:
  //       final token = result.accessToken.token;
  //       final graphResponse = await http.get(
  //           'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
  //       final profile = jsonDecode(graphResponse.body);

  //       print(profile['name']);
  //       print(profile['email']);

  //       //print(graphResponse.body);

  //       break;
  //     case FacebookLoginStatus.cancelledByUser:
  //       print("Login Cancelado");
  //       isLoggging = false;

  //       break;
  //     case FacebookLoginStatus.error:
  //       print("Login Facebook Error");
  //       isLoggging = false;

  //       break;
  //   }
  //}
}
