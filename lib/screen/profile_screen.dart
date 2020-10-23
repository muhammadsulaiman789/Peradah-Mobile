
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

//  @override
  // void initState() {
  //   super.initState();
  //   MobileNumber.listenPhonePermission((isPermissionGranted) {
  //    if (isPermissionGranted) {
  //     initMobileNumberState();
  //   } else {}
  //  });

  //  initMobileNumberState();
  // }

  // Platform messages are asynchronous, so we initialize in an async method.
//  Future<void> initMobileNumberState() async {
  //   if (!await MobileNumber.hasPhonePermission) {
  //     await MobileNumber.requestPhonePermission;
  //    return;
//    }
  //   String mobileNumber = '';
  // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
//      mobileNumber = await MobileNumber.mobileNumber;
  //     _simCard = await MobileNumber.getSimCards;
  //  } on PlatformException catch (e) {
  //    debugPrint("Failed to get mobile number because of '${e.message}'");
  //  }

  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling
  // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //  setState(() {
  //    _mobileNumber = mobileNumber;
  //   _number = _simCard.map((SimCard sim) => sim.number).toString().replaceAll(new RegExp(r'(?:_|[^\w\s])+'), '');
  //  });

  // }

  //Widget fillCards() {
  // List<Widget> widgets = _simCard
  //     .map((SimCard sim) => Text(
  //    'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
  //     .toList();
  //   return Column(children: widgets);

  //}



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



