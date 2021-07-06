import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:intl/intl.dart';

import 'package:peradahmobile/scoped_models/AppModel.dart';
import 'package:http/http.dart' as http;
import 'package:peradahmobile/widget/custom_icon_decoration.dart';
import 'package:peradahmobile/widget/dialog/MessageDialog.dart';
import 'package:peradahmobile/widget/loading/loading_modal.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

class Schedule extends StatefulWidget {
  Schedule(this.model);

  AppModel model;

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  BuildContext ctx;

  void initState() {
    widget.model.fetchKegiatan().catchError((onError) {
      MessageDialog.show(context, 'Terjadi kesalahan $onError',
          'Coba ulangi lagi!', () => Navigator.of(context).pop());
      setState(() {
        widget.model.setLoading(false);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (BuildContext context, Widget child, AppModel model) {
        Stack stack = Stack(children: <Widget>[
          Scaffold(
            body: ListView(
              children: <Widget>[Appbar(), Schedules()],
            ),
          )
        ]);

        if (model.isLoading) {
          stack.children.add(LoadingModal());
        }

        return stack;

        // return Scaffold(
      },
    );
  }
}

class Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, AppModel model) {
      return Container(
          height: 70,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          color: const Color(0xffb11806),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Text(
                'Jadwal',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ));
    });
  }
}

class Schedules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, AppModel model) {
      return new Container(
          width: 200,
          height: 450,
          padding: new EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: model.kegiatans.length,
            itemBuilder: (BuildContext context, int index) {
              var date = model.kegiatans[index].tanggalKegiatan;
              var day = DateFormat('EEEE').format(DateTime.parse(date));
              return Card(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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
                                'Jadwal ${model.kegiatans[index].tanggalKegiatan}',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
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
                                  '${model.kegiatans[index].namaKegiatan}',
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
                                model.kegiatans[index].keterangan,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),

                            // Container(height: 20, child: VerticalDivider(
                            //   color: Colors.black, thickness: 2,)),
                            // Column(
                            //   children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  '$day, $date',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )),
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
                ),
              );
            },
          ));
    });
  }
}
