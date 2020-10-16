
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
              Profiles(),
              MenuUtama()
            ],
          ),
        );
      },
    );

  }
}

class Profiles extends StatelessWidget {
  Future logout(BuildContext context, AppModel model) async {
//    Navigator.pushNamed(context, '/LoginScreen');
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.clear();

//    Navigator.pushReplacement(context,
//        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    model.signOut();
    Navigator.pushNamed(context, '/MainScreen');
    Navigator.of(context).pop();
  }

  _MessageDialog(BuildContext context, AppModel model) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
      title: '',
      desc: 'Apakah Anda Ingin Keluar ?',
      btnCancelOnPress: () {
        //Navigator.push(
        //  context,
        //  new MaterialPageRoute(
        //   builder: (context) => MemberPage(),
        //     ),
        //  );
      },
      btnCancelColor: Colors.grey,
      btnCancelText: 'Tidak',
      btnOkOnPress: () {
        logout(context, model);
      },
      btnOkText: 'Ya',
      btnOkColor: Colors.grey,
    )..show();
  }


  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, AppModel model) {
          return Container(
            height: 130,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            color: const Color(0xffb11806),
            child: new Container(
              child: new Wrap(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  ListTile(
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
                      'Fulan',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      'fulan@gmail.com',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(top: 20.0, left: 80.0),
                      ),
                      new SizedBox(
                        width: 130,
                        height: 30,
                        child: new RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                              new BorderRadius.circular(
                                  5.0)),
                          color: const Color(0xffde3d14),
                          onPressed: () {
                            //login(context, model);
                            {
                              TopSheet.show(
                                context: context,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/peradah.png',
                                      height:   150.0,
                                    ),
                                  ],
                                ),
                                direction: TopSheetDirection.TOP,
                              );
                            }
                            // loginUser();
                          },
                          child: new Text(
                            "Kartu Member",
                            style: new TextStyle(
                                fontWeight: FontWeight
                                    .bold, color: Colors.white),
                          ),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      new SizedBox(
                        width: 100,
                        height: 30,
                        child: new RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                              new BorderRadius.circular(
                                  5.0)),
                          color: const Color(0xffde3d14),
                          onPressed: () {
                            //login(context, model);
                            _MessageDialog(context,model);
                            // loginUser();
                          },
                          child: new Text(
                            "Logout",
                            style: new TextStyle(
                                fontWeight: FontWeight
                                    .bold, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],),),
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
            color: Colors.white70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Data Pribadi',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                              // style: GoogleFonts.sourceSansPro(),
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                            ),
                            Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0),
                        child: new Text("Tempat Lahir",
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 10.0,
                            ),
                            textAlign: TextAlign.left),
                            ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text("Bogor",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Text("Tanggal Lahir",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text("09 Januari 1997",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Text("Jenis Kelamin",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text("Laki - Laki",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Text("Status Perkawinan",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text("Kawin",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Text("Kabupaten / Kota",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text("Bogor",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Text("Alamat",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0, top: 10.0,bottom: 10.0),
                                  child: SizedBox(
                                    width: 150.0,
                                    height: 40.0,
                                    child: AutoSizeText(
                                      'Jl.Baru No.32 RT 03 RW 06',
                                      style: TextStyle(fontSize: 20.0),
                                      maxLines: 5,
                                    ),
                                  ),
                                ),
                              ]
                          ),

                            ],
                      ),
                      new Padding(
                        padding: EdgeInsets.only(left: 30.0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Text("Provinsi",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text("Jawa Barat",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Text("Nomor HP / Telp",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text("08123456789",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Text("Pendidikan Terakhir",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text("SD",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Text("Pekerjaan / Jabatan",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0, top: 10.0,bottom: 10.0),
                                  child: SizedBox(
                                    width: 100.0,
                                    height: 40.0,
                                    child: AutoSizeText(
                                      'Karyawan Swasta',
                                      style: TextStyle(fontSize: 20.0),
                                      maxLines: 5,
                                    ),
                                  ),
                                ),
                              ]
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Text("Hobby / Minat / Prestasi",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0, top: 10.0,bottom: 10.0),
                                  child: SizedBox(
                                    width: 100.0,
                                    height: 40.0,
                                    child: AutoSizeText(
                                      'Futsal',
                                      style: TextStyle(fontSize: 20.0),
                                      maxLines: 5,
                                    ),
                                  ),
                                ),
                              ]
                          ),

                        ],
                      ),
                    ]
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Keanggotaan',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                              // style: GoogleFonts.sourceSansPro(),
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                            ),
                            Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Text("DPP",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text("Jawa Barat",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                        ],
                      ),
                      new Padding(
                        padding: EdgeInsets.only(left: 30.0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: new Text("DPK",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text("Bogor",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                        ],
                      ),
                    ]
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Jabatan',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                              // style: GoogleFonts.sourceSansPro(),
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 5.0),
                            ),
                            Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text("Sekertaris",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                        ],
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


