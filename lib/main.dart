import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peradahmobile/screen/login_screen.dart';
import 'package:peradahmobile/screen/main_home.dart';
import 'package:peradahmobile/screen/main_screen.dart';
import 'package:peradahmobile/scoped_models/AppModel.dart';
import 'package:peradahmobile/screen/profile_screen.dart';
import 'package:peradahmobile/screen/schedule_screen.dart';
import 'package:peradahmobile/screen/signup_screen.dart';
import 'package:peradahmobile/screen/splash_screen.dart';
import 'dart:async';
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';


void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isLogin = false;
  AppModel _model;


  @override
  void initState() {
    super.initState();

//    _prefs.then((SharedPreferences prefs) {
//      setState(() {
//        isLogin = prefs.getBool('USER_LOGIN')== null ? false : prefs.getBool('USER_LOGIN');
//      });
//      print('login $isLogin');
//    });

    _model = AppModel();
    _model.autoAuthentication();
    _model.userSubject.listen((bool isAuthenticated) {
      setState(() {
        isLogin = isAuthenticated;
      });
      print('islogin $isLogin');
    });
  }

  //AppModel _model;

  //@override
  //void initState() {
  //_model = AppModel();
  //}


  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
        model: _model,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.id,
          home: isLogin ? MainScreen() : LoginScreen(),
          routes: <String, WidgetBuilder>{
            //'/Porm': (BuildContext context) => Porm(),
            //'/App': (BuildContext context) => App(),
           // '/Attendance1': (BuildContext context) =>
          //  isLogin ? Attendance1(_model) : LoginScreen(),
            '/Home': (BuildContext context) => Home(),
            '/Profile': (BuildContext context) =>
            isLogin ? Profile() : LoginScreen(),
            '/Schedule': (BuildContext context) =>
            isLogin ? Schedule() : LoginScreen(),
            '/Signup': (BuildContext context) => Signup(),
            '/MainScreen': (BuildContext context) =>
            isLogin ? MainScreen() : LoginScreen(),
            SplashScreen.id: (BuildContext context) => SplashScreen(),
            '/Home': (BuildContext context) => MainScreen()
//             Home(),
            //'/MyHomePage': (BuildContext context) => MyHomePage(),
          },
        ));
  }
}
