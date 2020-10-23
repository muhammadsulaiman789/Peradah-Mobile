import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:peradahmobile/scoped_models/AppModel.dart';
import 'package:http/http.dart' as http;
import 'package:peradahmobile/screen/home_carousel.dart';
import 'package:peradahmobile/screen/home_profile.dart';
import 'package:peradahmobile/screen/home_schedule.dart';
import 'package:peradahmobile/widget/custom_icon_decoration.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

class Home extends StatefulWidget {
  AppModel model;

  Home(this.model) ;
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController _phoneFilter = new TextEditingController();
  TextEditingController _passwordFilter = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (BuildContext context, Widget child, AppModel model) {
        return Scaffold(

          body: ListView(
            children: <Widget>[
              Profiles(model),
               Schedules(model), Carouseli(model)
            ],
          ),
        );
      },
    );

  }
}


