
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:peradahmobile/scoped_models/AppModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:top_sheet/top_sheet.dart';


class Profile2 extends StatefulWidget {
  AppModel model;

  Profile2(this.model) ;
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {


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
  // This widget is the root of your application.

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
                            child: new Text("Tempat Tanggal Lahir",
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text('${widget.model.data.tempat_tanggal_lahir}',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
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
                            child: new Text('${widget.model.data.jenis_kelamin}',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
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
                            child: new Text('${widget.model.data.status_perkawinan}',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
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
                            child: new Text('${widget.model.data.kabupaten_kota}',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
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
                                      '${widget.model.data.alamat}',
                                      style: TextStyle(fontSize: 16.0),
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
                            child: new Text('${widget.model.data.provinsi}',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
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
                            child: new Text('${widget.model.data.no_kontak}',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
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
                            child: new Text('${widget.model.data.pendidikan_terakhir}',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
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
                                      '${widget.model.data.pekerjaan}',
                                      style: TextStyle(fontSize: 16.0),
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
                                      '${widget.model.data.hobby}',
                                      style: TextStyle(fontSize: 16.0),
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
                            child: new Text('${widget.model.data.keanggotaan}',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                            child: new Text('${widget.model.data.komisariat}',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left),
                          ),
                        ],
                      ),
                      new Padding(
                        padding: EdgeInsets.only(left: 30.0),
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
                            child: new Text('${widget.model.data.jabatan}',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
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


