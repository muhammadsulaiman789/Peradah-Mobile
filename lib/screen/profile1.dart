
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:peradahmobile/scoped_models/AppModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:top_sheet/top_sheet.dart';


class Profile1 extends StatefulWidget {
  AppModel model;

  Profile1(this.model) ;
  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {


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
                      '${widget.model.data.nama_lengkap}',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: Text(
                      '${widget.model.data.email}',
                      style: TextStyle(
                          fontSize: 12.0,
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

