
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:peradahmobile/screen/profile1.dart';
import 'package:peradahmobile/screen/profile2.dart';
import 'package:top_sheet/top_sheet.dart';
import 'package:peradahmobile/scoped_models/AppModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
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
              Profile1(model),
              Profile2(model)
            ],
          ),
        );
      },
    );
  }
}



