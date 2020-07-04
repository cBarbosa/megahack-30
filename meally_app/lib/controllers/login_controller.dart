import 'dart:convert';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
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

  @action
  logout() async {
    _googleSignIn.signOut();
    user = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
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

  //** LOGIN WITH FACEBOOK *********************************************************************************/
  FacebookLogin _fbLogin = new FacebookLogin();

  handleFacebookSignIn() async {
    isLoggging = true;

    Future<Map> getUserInfo(FacebookLoginResult result) async {
      final token = result.accessToken.token;
      final graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=$token');

      return json.decode(graphResponse.body);
    }

    _fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    try {
      await _fbLogin.logIn(['email', 'public_profile']).then((result) async {
        switch (result.status) {
          case FacebookLoginStatus.loggedIn:
            final FacebookAccessToken accessToken = result.accessToken;

            getUserInfo(result).then((faceKey) {
              String photoUrl = "https://graph.facebook.com/" +
                  faceKey['id'] +
                  "/picture?height=500";
              user = User(faceKey['name'], faceKey['email'], photoUrl);

              print(
                  "Log Interno: Login Facebook: ${accessToken.token}, ${faceKey['name']}, ${faceKey['email']}");
            }).whenComplete(() {
              saveUser();
              isLoggging = false;
            });

            break;
          case FacebookLoginStatus.cancelledByUser:
            print('Login cancelled by the user.');
            isLoggging = false;

            break;
          case FacebookLoginStatus.error:
            print('Something went wrong with the login process.\n'
                'Here\'s the error Facebook gave us: ${result.errorMessage}');
            isLoggging = false;

            break;
        }
      }).catchError((e) {
        print("Log Interno: Login Facebook E: $e");
        isLoggging = false;
      });
    } catch (error) {
      print("Log Interno: Login Facebook Error: $error");
      isLoggging = false;
    }
  }
}
