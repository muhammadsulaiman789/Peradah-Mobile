import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peradahmobile/screen/main_screen.dart';
import 'package:peradahmobile/scoped_models/AppModel.dart';
import 'package:peradahmobile/screen/signup_screen.dart';
import 'package:peradahmobile/widget/dialog/MessageDialog.dart';
import 'package:peradahmobile/widget/loading/loading_modal.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController _usernameFilter = new TextEditingController();
  TextEditingController _passwordFilter = new TextEditingController();
  String phone = '';
  String _password = '';
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (BuildContext context, Widget child, AppModel model) {
        Stack stack = Stack(
          children: <Widget>[
            Scaffold(
                resizeToAvoidBottomPadding: false,
                body: Stack(
                  //shrinkWrap: true,
                  //reverse: false,
                  children: <Widget>[
                    Container(
                      width: 375.0,
                      height: 812.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(1.21, -0.39),
                          end: Alignment(-1.38, 0.67),
                          colors: [
                            const Color(0xffcf1c07),
                            const Color(0xff000000)
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 25.0),
                    ),
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Image.asset(
                              "assets/images/peradah.png",
                              height: 80.0,
                              width: 100.0,
                              //fit: BoxFit.scaleDown,
                            ),
                            new Padding(
                              padding: EdgeInsets.only(top: 25.0),
                            ),
                            new Text(
                              "PERADAH Mobile",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 32.0,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(height: 60.0),
                        new Center(
                            child: new Center(
                          child: new Stack(
                            children: <Widget>[
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 30.0, right: 30.0),
                                  child: new Form(
                                    child: new Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.0, right: 10.0),
                                          child: new TextFormField(
                                            style: TextStyle(
                                              color: Colors.white54,
                                            ),
                                            controller: _usernameFilter,
                                            //validator: (e) {
                                            //if (e.isEmpty) {
                                            // return "Please insert email";
                                            // }
                                            //},
                                            //onSaved: (e) => username = e,
                                            autofocus: false,
                                            decoration: new InputDecoration(
                                              labelText: "Email",
                                              labelStyle: TextStyle(
                                                  color: Colors.white70),
                                              prefixIcon: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 7.0),
                                                  child: IconButton(
                                                    icon: Icon(Icons.person),
                                                    color: Colors.black,
                                                    iconSize: 30,
                                                    //fit: BoxFit.scaleDown,
                                                  )),
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            //  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                                          ),
                                        ),
                                        new Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0,
                                                right: 10.0,
                                                top: 5.0),
                                            child: new TextFormField(
                                              style: TextStyle(
                                                color: Colors.white54,
                                              ),
                                              obscureText: _secureText,
                                              //onSaved: (e) => password = e,
                                              //obscureText: true,
                                              autofocus: false,
                                              controller: _passwordFilter,
                                              decoration: new InputDecoration(
                                                  labelText: "Password",
                                                  labelStyle: TextStyle(
                                                      color: Colors.white70),
                                                  suffixIcon: IconButton(
                                                    onPressed: showHide,
                                                    icon: Icon(_secureText
                                                        ? Icons.visibility_off
                                                        : Icons.visibility),
                                                    color: Colors.white,
                                                  ),
                                                  prefixIcon: Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 7.0),
                                                      child: IconButton(
                                                        icon: Icon(Icons.lock),
                                                        color: Colors.white,
                                                        iconSize: 30,
                                                        //fit: BoxFit.scaleDown,
                                                      ))),
                                              keyboardType: TextInputType.text,
                                            )),
                                        new Padding(
                                          padding: EdgeInsets.only(top: 30.0),
                                        ),
                                        new SizedBox(
                                          width: 275,
                                          height: 45,
                                          child: new RaisedButton(
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        5.0)),
                                            color: Colors.red[900],
                                            onPressed: () {
                                              // Navigator.pushNamed(context, '/Home');
                                              login(context, model);
                                              // loginUser();
                                            },
                                            child: new Text(
                                              "LOG IN",
                                              style: new TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 50.0),
                                        FlatButton(
                                          child:
                                              Text('Sudah Punya Akun ? Daftar'),
                                          textColor: Colors.white70,
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/Signup');
                                          },
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ))
                      ],
                    )
                  ],
                ))
          ],
        );

        if (model.isLoading) {
          stack.children.add(LoadingModal());
        }

        return stack;
      },
    );
  }

  Future login(BuildContext context, AppModel model) async {
    final SharedPreferences prefs = await _prefs;

    await model
        .signIn(_usernameFilter.text, _passwordFilter.text)
        .then((value) {
      if (value) {
        Fluttertoast.showToast(
            msg: "Login Succes",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        prefs.setBool('USER_LOGIN', true);
        Navigator.pushNamed(context, '/MainScreen');
        Navigator.of(context).pop();
      } else {
        Fluttertoast.showToast(
            msg: "Username or Password incorrect !!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }).catchError((onError) {
      MessageDialog.show(context, 'Terjadi kesalahan!', 'Coba ulangi lagi!',
          () => Navigator.of(context).pop());
    });
    setState(() {
//      phone = model.data.MobilePhone;
//          _phoneFilter.text;
    });
  }
}
