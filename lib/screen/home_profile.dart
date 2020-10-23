
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peradahmobile/scoped_models/AppModel.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class Profiles extends StatefulWidget {
  AppModel model;

  Profiles(this.model) ;
  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {


  @override
  void initState() {
    super.initState();
//    MobileNumber.listenPhonePermission((isPermissionGranted) {
//      if (isPermissionGranted) {
//        initMobileNumberState();
//      } else {}
//    });
    //print('phone3 ${widget.model.data.MobilePhone}');
  }


  // Future<void> initMobileNumberState() async {
  //  if (!await MobileNumber.hasPhonePermission) {
  //   await MobileNumber.requestPhonePermission;
  // return;
  //  }
  //String mobileNumber = '';
  // Platform messages may fail, so we use a try/catch PlatformException.
  // try {
  // mobileNumber = await MobileNumber.mobileNumber;
  //  _simCard = await MobileNumber.getSimCards;
  // } on PlatformException catch (e) {
  //   debugPrint("Failed to get mobile number because of '${e.message}'");
  // }
  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling
  // setState to update our non-existent appearance.
  // if (!mounted) return;
  //  setState(() {
  // _mobileNumber = mobileNumber;
  //   _number = _simCard.map((SimCard sim) => sim.number).toString().replaceAll(new RegExp(r'(?:_|[^\w\s])+'), '');
  // });
  // print('Number phone $_number');
  //}

  //Widget fillCards () {
  // List<Widget> widgets = _simCard
  //    .map((SimCard sim) => Text(
  //    'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
  //    .toList();
  //  return Column(children: widgets);
  //}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: const Color(0xffb11806),
      child: ListTile(
        leading: InkWell(
          child: Container(
            //padding: EdgeInsets.only(left: 12, top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/peradah.png',
                  height: 50.0,
                ),
              )),
        ),
        title: Text(
          'Selamat Datang,',
          style: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Text(
          '${widget.model.data.nama_lengkap}',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    );
  }
}
