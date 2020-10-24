import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:peradahmobile/scoped_models/AppModel.dart';
import 'package:peradahmobile/widget/dialog/MessageDialog.dart';
import 'package:scoped_model/scoped_model.dart';
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
  var day;
  var date;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, AppModel model) {
          date = model.currentKegiatan != null ? DateTime.parse(model.currentKegiatan.tanggalKegiatan) : 0;
          day = date!=0 ? DateFormat('EEEE').format(date) : 0;
      return Card(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white60,
        child: model.currentKegiatan != null
            ? Column(
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
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10.0),
                      child: new Text("",
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
                    Column(children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, top: 10.0),
                        child: SizedBox(
                          width: 200.0,
                          height: 40.0,
                          child: AutoSizeText(
                            model.currentKegiatan.namaKegiatan != null
                                ? model.currentKegiatan.namaKegiatan
                                : '',
                            style: TextStyle(fontSize: 20.0),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ]),
                  ]),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(left: 63.0, top: 10.0),
                      ),
                      Container(
                          height: 80,
                          child: VerticalDivider(
                            color: Colors.black,
                            thickness: 2,
                          )),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              model.currentKegiatan.keterangan,
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),

                      //   ],
                      // ),
                      // Container(
                      //     height: 20,
                      //     child: VerticalDivider(
                      //       color: Colors.black,
                      //       thickness: 2,
                      //     )),
                      // Row(
                      //   children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              '$day, ${model.currentKegiatan.tanggalKegiatan}',
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("",
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
                    Column(children: [
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
                    ]),
                  ]),
                ],
              )
            : Column(
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
                  new Padding(
                    padding: EdgeInsets.only(top: 70.0),
                  ),
                  Center(
                    child: Text("Tidak ada jadwal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                        textAlign: TextAlign.left),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(bottom: 70.0),
                  ),
                ],
              ),
      );
    });
  }
}
