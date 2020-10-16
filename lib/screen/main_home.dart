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
import 'package:peradahmobile/widget/custom_icon_decoration.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
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
              Profiles(),
               MenuUtama(), Carouseli()
            ],
          ),
        );
      },
    );

  }
}

class Profiles extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return ScopedModelDescendant<AppModel>(
      builder: (BuildContext context, Widget child, AppModel model) {
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
        'Fulan',
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
            color: Colors.white),
      ),
    ),
  );
}
);
}
}

class MenuUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, AppModel model) {
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
                          padding: EdgeInsets.only(left: 10.0, top : 15.0),
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
                        padding: EdgeInsets.only(left: 63.0,top: 10.0),
                      ),
                      Container(height: 80, child: VerticalDivider(color: Colors.black, thickness: 2,)),
                      Row(
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.only(left: 25.0),
                          ),
                          Text('Kantor Pusat', style: TextStyle(fontSize: 12, color: Colors.black),)
                        ],
                      ),

                      Container(height: 20, child: VerticalDivider(color: Colors.black, thickness: 2,)),
                      Row(
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.only(left:5.0),
                          ),
                          Text('Kamis, 09-09-2020', style: TextStyle(fontSize: 12, color: Colors.black),)
                        ],
                      ),
                    ],
                  ),
                new Padding(
                  padding: EdgeInsets.only(top:5.0),
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
    );
  }
}


class Carouseli extends StatelessWidget {
  int _currentIndex=0;

  List cardList=[
    Item1(),
    Item2(),
    Item3(),
    Item4()
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(top: 20.0),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
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
          items: cardList.map((card){
            return Builder(
                builder:(BuildContext context){
                  return Container(
                    height: MediaQuery.of(context).size.height*0.30,
                    width: MediaQuery.of(context).size.width,

                    child: Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.red,
                      child: card,
                    ),
                  );
                }
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(cardList, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            );
          }),
        ),
      ],
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
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
                ]
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(left: 25.0),
              ),
              Text(
                  "Data",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold
                  )
              ),
              Text(
                  "Data",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600
                  )
              ),
            ],
          ),
        ],
      ),
    );
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
            stops: [0.3, 1],
            colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
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
          ]
      ),
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    new Padding(
    padding: EdgeInsets.only(left: 25.0),
    ),
    Text(
    "Data",
    style: TextStyle(
    color: Colors.white,
    fontSize: 22.0,
    fontWeight: FontWeight.bold
    )
    ),
    Text(
    "Data",
    style: TextStyle(
    color: Colors.white,
    fontSize: 17.0,
    fontWeight: FontWeight.w600
    )
    ),
    ],
    ),
    ]
    ),
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
            stops: [0.3, 1],
            colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
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
          ]
      ),
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    new Padding(
    padding: EdgeInsets.only(left: 25.0),
    ),
    Text(
    "Data",
    style: TextStyle(
    color: Colors.white,
    fontSize: 22.0,
    fontWeight: FontWeight.bold
    )
    ),
    Text(
    "Data",
    style: TextStyle(
    color: Colors.white,
    fontSize: 17.0,
    fontWeight: FontWeight.w600
    )
    ),
    ],
    ),
    ]
    ),
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
          ]
      ),
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    new Padding(
    padding: EdgeInsets.only(left: 25.0),
    ),
    Text(
    "Data",
    style: TextStyle(
    color: Colors.white,
    fontSize: 22.0,
    fontWeight: FontWeight.bold
    )
    ),
    Text(
    "Data",
    style: TextStyle(
    color: Colors.white,
    fontSize: 17.0,
    fontWeight: FontWeight.w600
    )
    ),
    ],
    ),
    ]
    ),
    );
  }
}
