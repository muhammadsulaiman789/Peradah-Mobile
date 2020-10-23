import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peradahmobile/scoped_models/AppModel.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class Schedules extends StatefulWidget {
  AppModel model;

  Schedules(this.model);

  @override
  _SchedulesState createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {

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
    return Card(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/calendar2.png',
                      height: 20.0,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    Text(
                      'Jadwal Hari Ini',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                      // style: GoogleFonts.sourceSansPro(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: new Text("08:00",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.left),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 15.0),
                  child: Image.asset(
                    'assets/images/circle.png',
                    height: 25.0,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, top: 10.0),
                        child: SizedBox(
                          width: 200.0,
                          height: 40.0,
                          child: AutoSizeText(
                            'Kumpul Pengurus Pusat dan Seluruh Anggota',
                            style: TextStyle(fontSize: 20.0),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ]
                ),
              ]
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(left: 63.0, top: 10.0),
              ),
              Container(height: 80,
                  child: VerticalDivider(color: Colors.black, thickness: 2,)),
              Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(left: 25.0),
                  ),
                  Text('Kantor Pusat',
                    style: TextStyle(fontSize: 12, color: Colors.black),)
                ],
              ),

              Container(height: 20,
                  child: VerticalDivider(color: Colors.black, thickness: 2,)),
              Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(left: 5.0),
                  ),
                  Text('Kamis, 09-09-2020',
                    style: TextStyle(fontSize: 12, color: Colors.black),)
                ],
              ),
            ],
          ),
          new Padding(
            padding: EdgeInsets.only(top: 5.0),
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: new Text("11:00",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.left),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Image.asset(
                    'assets/images/circle2.png',
                    height: 25.0,
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
                        child: SizedBox(
                          width: 200.0,
                          height: 20.0,
                          child: AutoSizeText(
                            'Wajib',
                            style: TextStyle(fontSize: 20.0),
                            // maxLines: 2,
                          ),
                        ),
                      ),
                    ]
                ),
              ]
          ),
        ],
      ),
    );
  }
}
