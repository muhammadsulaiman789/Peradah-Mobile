import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peradahmobile/model/Pengumuman.dart';
import 'package:peradahmobile/scoped_models/AppModel.dart';
import 'package:peradahmobile/widget/dialog/MessageDialog.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Carouseli extends StatefulWidget {
  AppModel model;

  Carouseli(this.model);

  @override
  _CarouseliState createState() => _CarouseliState();
}

class _CarouseliState extends State<Carouseli> {
  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;

  List<Pengumuman> memo = [];

  List cardList = [
    // Item1(),
    // Item2(), Item3(), Item4()
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, AppModel model) {
      return Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                _currentIndex = index;
              },
            ),
            items: model.pengumumans.map((card) {

              return Builder(builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.red,
                    child: Item1(card)
                  ),
                );
              });
            }).toList(),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: map<Widget>(widget.model.pengumumans, (index, url) {
          //     return Container(
          //       width: 10.0,
          //       height: 10.0,
          //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          //     );
          //   }),
          // ),
        ],
      );
    });
  }
}

class Item1 extends StatelessWidget {
  Pengumuman pengumuman;

  Item1(this.pengumuman);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, AppModel model) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.3,
                1
              ],
              colors: [
                Color(0xffff4000),
                Color(0xffffcc66),
              ]),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 5.0),
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/pengumuman.png',
                      height: 15.0,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    new Text(pengumuman.judulPengumuman,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left),
                  ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(top: 30, left: 25),
                  child: Text(pengumuman.isiPengumuman,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold))),
                // new Padding(
                //   padding: EdgeInsets.only(top: 20.0),
                //   child: Text("Data",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 17.0,
                //           fontWeight: FontWeight.w600)),
                // )
              ],
            ),
          ],
        ),
      );
    });
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.3,
              1
            ],
            colors: [
              Color(0xffff4000),
              Color(0xffffcc66),
            ]),
      ),
      child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 5.0),
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/pengumuman.png',
                      height: 15.0,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    new Text("Pengumuman",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left),
                  ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(left: 25.0),
                ),
                Text("Data",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold)),
                Text("Data",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ]),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.3,
              1
            ],
            colors: [
              Color(0xffff4000),
              Color(0xffffcc66),
            ]),
      ),
      child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 5.0),
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/pengumuman.png',
                      height: 15.0,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    new Text("Pengumuman",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.left),
                  ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(left: 25.0),
                ),
                Text("Data",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold)),
                Text("Data",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ]),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 5.0),
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/pengumuman.png',
                      height: 15.0,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    new Text("Pengumuman",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.left),
                  ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(left: 25.0),
                ),
                Text("Data",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold)),
                Text("Data",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ]),
    );
  }
}
