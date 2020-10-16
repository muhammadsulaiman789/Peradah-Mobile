
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:peradahmobile/screen/login_screen.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool Setuju = true;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String password;
  String confirm_password;

  String validatePassword(String value) {
    if (value.length < 8)
      return 'Password must be more than 8 charater';
    else
      return null;
  }

  String validateconfPassword(String value) {
    if (value.length < 8)
      return 'Password must be more than 8 charater';
    else
      return null;
  }

  String _jeniskelamin = "";
  void _pilihjeniskelamin(String value) {
    setState(() {
      _jeniskelamin = value;
    });
  }

  String _jabatan = "";
  void _pilihjabatan(String value) {
    setState(() {
      _jabatan = value;
    });
  }

  String _anggota = "";
  void _pilihanggota(String value) {
    setState(() {
      _anggota = value;
    });
  }

  String _status = "";
  void _pilihstatus(String value) {
    setState(() {
      _status = value;
    });
  }

  String _pendidikan = "";
  void _pilihpendidikan(String value) {
    setState(() {
      _pendidikan = value;
    });
  }


  TextEditingController controllernamalengkap = new TextEditingController();
  TextEditingController controllernamapanggilan = new TextEditingController();
  TextEditingController controllertanggallahir = new TextEditingController();
  TextEditingController controlleralamat = new TextEditingController();
  TextEditingController controllerkota = new TextEditingController();
  TextEditingController controllerprovinsi = new TextEditingController();
  TextEditingController controllernotlp = new TextEditingController();
  TextEditingController controlleremail = new TextEditingController();
  TextEditingController controllerpekerjaan = new TextEditingController();
  TextEditingController controllerorganisasi = new TextEditingController();
  TextEditingController controllerhobby = new TextEditingController();
  TextEditingController controlleridentitas = new TextEditingController();
  TextEditingController controlleruser = new TextEditingController();
  TextEditingController controllerpassword = new TextEditingController();
  TextEditingController controllerlain = new TextEditingController();
  TextEditingController controllerkomisariat = new TextEditingController();

  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  bool _secureText2 = true;
  showHide2() {
    setState(() {
      _secureText2 = !_secureText2;
    });
  }

  void addData() {
    var url = "http://203.171.221.227:88/peradah/adduser.php";

    http.post(url, body: {
      "namalengkap": controllernamalengkap.text,
      "namapanggilan": controllernamapanggilan.text,
      "tanggallahir": controllertanggallahir.text,
      "jeniskelamin": _jeniskelamin,
      "status": _status,
      "alamat": controlleralamat.text,
      "kota": controllerkota.text,
      "provinsi": controllerprovinsi.text,
      "kontak": controllernotlp.text,
      "email": controlleremail.text,
      "pendidikan": _pendidikan,
      "pekerjaan": controllerpekerjaan.text,
      "organisasi": controllerorganisasi.text,
      "hobi": controllerhobby.text,
      "username": controlleruser.text,
      "password": controllerpassword.text
    }).then((value) {
      print('code ${value.statusCode}');
      if (value.statusCode==200){
        Fluttertoast.showToast(
            msg : "Daftar Berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg : "Daftar Gagal",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    })
        .catchError((onError) {
      print('error $onError');
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: const Color(0xffb11806),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Daftar'),
      ),
      key: _key,
      body: new ListView(
        children: <Widget>[
          new Container(
            width: 200,
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Nama Lengkap",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controllernamalengkap,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Nama Panggilan",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controllernamapanggilan,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Tempat Tanggal Lahir",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controllertanggallahir,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Jenis Kelamin",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(left: 25.0),
                    ),
                    new Radio(
                      value: "Laki - Laki",
                      groupValue: _jeniskelamin,
                      onChanged: (value) {
                        _pilihjeniskelamin(value);
                        print('value $value');
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'Laki - Laki',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    Radio(
                      value: "Perempuan",
                      groupValue: _jeniskelamin,
                      onChanged: (value) {
                        _pilihjeniskelamin(value);
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'Perempuan',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Status Perkawinan",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(left: 25.0),
                    ),
                    new Radio(
                      value: "Kawin",
                      groupValue: _status,
                      onChanged: (value) {
                        _pilihstatus(value);
                        print('value $value');
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'Kawin',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 32.0),
                    ),
                    Radio(
                      value: "Belum Kawin",
                      groupValue: _status,
                      onChanged: (value) {
                        _pilihstatus(value);
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'Belum Kawin',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Alamat",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controlleralamat,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Keanggotaan",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Radio(
                      value: "DPN",
                      groupValue: _anggota,
                      onChanged: (value) {
                        _pilihanggota(value);
                        print('value $value');
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'DPN',
                      style: new TextStyle(fontSize: 12.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 5.0),
                    ),
                    Radio(
                      value: "DPP",
                      groupValue: _anggota,
                      onChanged: (value) {
                        _pilihanggota(value);
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'DPP',
                      style: new TextStyle(fontSize: 12.0),
                    ),
                    new Radio(
                      value: "DPK",
                      groupValue: _anggota,
                      onChanged: (value) {
                        _pilihanggota(value);
                        print('value $value');
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'DPK',
                      style: new TextStyle(fontSize: 12.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 5.0),
                    ),
                    Radio(
                      value: "Komisariat",
                      groupValue: _anggota,
                      onChanged: (value) {
                        _pilihanggota(value);
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'Komisariat',
                      style: new TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),

                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Sebutkan DPP / DPK / Komisariat",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controllerkomisariat,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Jabatan",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Radio(
                      value: "Ketua",
                      groupValue: _jabatan,
                      onChanged: (value) {
                        _pilihjabatan(value);
                        print('value $value');
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'Ketua',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 5.0),
                    ),
                    Radio(
                      value: "Sekertaris",
                      groupValue: _jabatan,
                      onChanged: (value) {
                        _pilihjabatan(value);
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'Sekertaris',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                    new Radio(
                      value: "Anggota",
                      groupValue: _jabatan,
                      onChanged: (value) {
                        _pilihjabatan(value);
                        print('value $value');
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'Anggota',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controllerlain,
                      decoration: new InputDecoration(
                          labelText: "Yang lain",
                          labelStyle: TextStyle(color: Colors.black87, fontSize: 15.0,),
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Kabupaten / Kota",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controllerkota,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Provinsi",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controllerprovinsi,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("No HP / Telp",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controllernotlp,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Email",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controlleremail,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Pendidikan Terakhir",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Radio(
                      value: "SD",
                      groupValue: _pendidikan,
                      onChanged: (value) {
                        _pilihpendidikan(value);
                        print('value $value');
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'SD',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 5.0),
                    ),
                    Radio(
                      value: "SMP",
                      groupValue: _pendidikan,
                      onChanged: (value) {
                        _pilihpendidikan(value);
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'SMP',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                    new Radio(
                      value: "SMA",
                      groupValue: _pendidikan,
                      onChanged: (value) {
                        _pilihpendidikan(value);
                        print('value $value');
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'SMA',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 5.0),
                    ),
                    Radio(
                      value: "Diploma",
                      groupValue: _pendidikan,
                      onChanged: (value) {
                        _pilihpendidikan(value);
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'Diploma',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(left: 50.0),
                    ),
                    new Radio(
                      value: "S1",
                      groupValue: _pendidikan,
                      onChanged: (value) {
                        _pilihpendidikan(value);
                        print('value $value');
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'S1',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    Radio(
                      value: "S2",
                      groupValue: _pendidikan,
                      onChanged: (value) {
                        _pilihpendidikan(value);
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'S2',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                    Radio(
                      value: "S3",
                      groupValue: _pendidikan,
                      onChanged: (value) {
                        _pilihpendidikan(value);
                      },
                      activeColor: Colors.red,
                    ),
                    new Text(
                      'S3',
                      style: new TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Pekerjaan / Jabatan",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controllerpekerjaan,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Pengalaman Berorganisasi",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controllerorganisasi,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Hobby / Minat / Prestasi",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controllerhobby,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Jenis & No.Identitas: KTP/SIM/PASPOR",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controlleridentitas,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("USER ACCOUNT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Email",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextField(
                      controller: controlleruser,
                      decoration: new InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black26),
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Password",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextFormField(
                      validator: validatePassword,
                      maxLength: 8,
                      obscureText: _secureText,
                      textInputAction: TextInputAction.next,
                      onSaved: (String val) {
                        password = val;
                      },
                      //controller: controllerpassword,
                      decoration: new InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: showHide,
                            icon: Icon(_secureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintText: "Password must at least 8 character",
                          hintStyle: TextStyle(color: Colors.black26),
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                      child: new Text("Confirm Password",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new TextFormField(
                      validator: validateconfPassword,
                      onSaved: (String val) {
                        confirm_password = val;
                      },
                      maxLength: 8,
                      textInputAction: TextInputAction.done,
                      obscureText: _secureText2,
                      controller: controllerpassword,
                      decoration: new InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: showHide2,
                            icon: Icon(_secureText2
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintText: "Password must at least 8 character",
                          hintStyle: TextStyle(color: Colors.black26),
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    Checkbox(
                      value: Setuju,
                      onChanged: (bool value) {
                        setState(() {
                          Setuju = value;
                        });
                      },
                    ),
                    Text("Saya menyatakan diri menjadi anggota"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(left: 50.0),
                    ),
                    Text("Peradah Indonesia"),
                  ],
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new SizedBox(
                  width: 320,
                  height: 55,
                  child: new RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius:
                        new BorderRadius.circular(
                            30.0)),
                    color: Colors.red[900],
                    onPressed:
                        () {
                      addData();
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen(),
                      ));
                      // login(context, model);
                      // loginUser();
                    },
                    child: new Text(
                      "SIGN UP",
                      style: new TextStyle(
                        fontWeight: FontWeight
                            .bold, color: Colors.white, ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
