import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    // metode untuk menghitung waktu agar otomatis ke halaman selanjutnya
    return new Timer(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/MainScreen');
//      Navigator.pushReplacementNamed(context, '/LoginScreen');
//      Navigator.of(context).pop();
//      Navigator.of(context, rootNavigator: true).pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          //mainAxisAlignment: MainAxisAlignment.center,
        fit: StackFit.expand,
        children: [Image.asset('assets/images/peradah.png')]
      ),
    );
  }
}

