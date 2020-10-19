import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:peradahmobile/mixins/validation.dart';
import 'package:peradahmobile/screen/login_screen.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with Validation {

  bool Setuju = true;
  final formKey = GlobalKey<FormState>();
  File _image;
  var _image2;

  String fullname = '';
  String name = '';
  String tanggal = '';
  String Alamat = '';
  String DPP = '';
  String Kota = '';
  String Provinsi = '';
  String NoHP = '';
  String email = '';
  String pekerjaan = '';
  String Hobi = '';
  String identitas = '';
  String user = '';
  String password = '';
  String confPassword = '';


  Future getImageGallery() async{
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    final tempDir =await getTemporaryDirectory();
    final path = tempDir.path;


    int rand= new Math.Random().nextInt(100000);

    Img.Image image= Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, width: 500);

    var compressImg= new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    var compressImg2= ("image_$rand.jpg");

    setState(() {
      _image = compressImg;
      _image2 = compressImg2.toString();
    });
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
      "nik" : controlleridentitas.text,
      "namalengkap": controllernamalengkap.text,
      "namapanggilan": controllernamapanggilan.text,
      "tanggallahir": controllertanggallahir.text,
      "jeniskelamin": _jeniskelamin,
      "komisariat" : controllerkomisariat,
      "jabatan" : _jabatan,
      "jabatan" : controllerlain,
      "status": _status,
      "keanggotaan" : _anggota,
      "alamat": controlleralamat.text,
      "kota": controllerkota.text,
      "provinsi": controllerprovinsi.text,
      "kontak": controllernotlp.text,
      "email": controlleremail.text,
      "pendidikan": _pendidikan,
      "pekerjaan": controllerpekerjaan.text,
      "image" : _image2,
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
      body: Form(
        key: formKey,
        child: ListView(
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
                    new TextFormField(
                      controller: controllernamalengkap,
                      validator: validateNameLengkap,
                      onSaved: (String value) {
                        fullname = value;
                      },
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
                    new TextFormField(
                      validator: validateName,
                      onSaved: (String value) {
                        name = value;
                      },
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
                    new TextFormField(
                      validator: validateDate,
                      onSaved: (String value) {
                        tanggal = value;
                      },
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
                    new TextFormField(
                      validator: validateAddress,
                      onSaved: (String value) {
                       Alamat  = value;
                      },
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
                    new TextFormField(
                      validator: validateDPP,
                      onSaved: (String value) {
                        DPP = value;
                      },
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
                    new TextFormField(
                      validator: validateKota,
                      onSaved: (String value) {
                        Kota = value;
                      },
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
                    new TextFormField(
                      controller: controllerprovinsi,
                      validator: validateProvinsi,
                      onSaved: (String value) {
                        Provinsi = value;
                      },
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
                    new TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: controllernotlp,
                      validator: validateNoHP,
                      onSaved: (String value) {
                        NoHP = value;
                      },
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
                    new TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                      onSaved: (String value) {
                        email = value;
                      },
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
                      child: new Text("Pekerjaan",
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
                      validator: validatePekerjaan,
                      onSaved: (String value) {
                        pekerjaan = value;
                      },
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
                    new TextFormField(
                      validator: validateHobi,
                      onSaved: (String value) {
                        Hobi = value;
                      },
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
                      child: new Text("NIK",
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
                      controller: controlleridentitas,
                      validator: validateIdentitas,
                      onSaved: (String value) {
                        identitas = value;
                      },
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
                      child: new Text("Foto Profile",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                child :new SizedBox(
                  width: 170,
                  height: 45,
                  child: new RaisedButton.icon(
                    icon: Icon(Icons.image, color: Colors.blue,) ,
                    shape: new RoundedRectangleBorder(
                        borderRadius:
                        new BorderRadius.circular(
                            5.0)),
                    color: Colors.white,
                    onPressed: getImageGallery,
                    label: _image==null
                    ? new Text(
                      "Tambahkan File",
                      style: new TextStyle(
                          fontWeight: FontWeight
                              .bold, color: Colors.blue),
                    ) :
                        new Text (_image2),
                  ),
                ),
                    )
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
                    new TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controlleruser,
                      decoration: new InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black26),
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                      validator: validateUser,
                      onSaved: (String value) {
                        user = value;
                      },
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
                      //validator: validatePassword,
                      obscureText: _secureText,
                      textInputAction: TextInputAction.next,
                      validator: validatePassword,
                      onSaved: (String value) {
                        password = value;
                      },
                      //controller: controllerpassword,
                      decoration: new InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: showHide,
                            icon: Icon(_secureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintText: "Password",
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
                      validator: validateConfPassword,
                      onSaved: (String value) {
                        confPassword = value;
                      },
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
                          hintText: "Confirm",
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
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            addData();
                            Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => LoginScreen(),
                            ));
                          }
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
      )
    );
  }
}
