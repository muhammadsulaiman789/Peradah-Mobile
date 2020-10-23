import 'dart:convert';

import 'package:peradahmobile/model/User.dart';
import 'package:rxdart/rxdart.dart';
import 'CoreModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

mixin Auth on CoreModel {
  PublishSubject<bool> _userSubject = PublishSubject();

  PublishSubject<bool> get userSubject {
    return _userSubject;
  }

  Future<bool> signIn(String username, String pwd) async {
    final prefs = await SharedPreferences.getInstance();
    var url = "http://203.171.221.227:88/peradah/api/public/api/login";
    var response;
    var data;
    await http
        .post(url, body: {"username": username, "password": pwd}).then((value) {
      response = value;
    });

    data = json.decode(response.body);
    // userData = User.fromJson(data['data']);
    //print('data1');
    print('data $data');
//    print('phone2 ${data.MobilePhone}');
    if (data['status']) {
      try {
        _userSubject.add(true);
        userData = User.fromJson(data['data']);
        print('nama_lengkap ${userData.nama_lengkap}');
        prefs.setInt('nomor_anggota', userData.nomor_anggota);
        prefs.setString('nik', userData.nik);
        prefs.setString('nama_lengkap', userData.nama_lengkap);
        prefs.setString('nama_panggilan', userData.nama_panggilan);
        prefs.setString('tempat_tgl_lahir', userData.tempat_tanggal_lahir);
        prefs.setString('jenis_kelamin', userData.jenis_kelamin);
        prefs.setString('status_perkawinan', userData.status_perkawinan);
        prefs.setString('alamat', userData.alamat);
        prefs.setString('kabupaten_kota', userData.kabupaten_kota);
        prefs.setString('provinsi', userData.provinsi);
        prefs.setString('no_kontak', userData.no_kontak);
        prefs.setString('email', userData.email);
        prefs.setString('keanggotaan', userData.keanggotaan);
        prefs.setString('nama_keanggotaan', userData.komisariat);
        prefs.setString('jabatan', userData.jabatan);
        prefs.setString('pendidikan_terakhir', userData.pendidikan_terakhir);
        prefs.setString('pekerjaan', userData.pekerjaan);
        prefs.setString('hobby', userData.hobby);
        prefs.setString('foto', userData.foto);
        prefs.setString('username', userData.username);
        return true;
      } catch (err) {
        _userSubject.add(false);
      }
    } else {
      _userSubject.add(false);
      return false;
    }
  }


  void autoAuthentication() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLogin = prefs.getBool('USER_LOGIN') == null
        ? false
        : prefs.getBool('USER_LOGIN');
    if (isLogin) {
           _userSubject.add(true);
            userData = User(
        nomor_anggota: prefs.getInt('nomor_anggota'),
        nik: prefs.getString('nik'),
        nama_lengkap: prefs.getString('nama_lengkap'),
        nama_panggilan: prefs.getString('nama_panggilan'),
        tempat_tanggal_lahir: prefs.getString('tempat_tgl_lahir'),
        jenis_kelamin: prefs.getString('jenis_kelamin'),
        status_perkawinan: prefs.getString('status_perkawinan'),
        alamat: prefs.getString('alamat'),
        kabupaten_kota: prefs.getString('kabupaten_kota'),
        provinsi: prefs.getString('provinsi'),
        no_kontak: prefs.getString('no_kontak'),
        email: prefs.getString('email'),
        keanggotaan: prefs.getString('keanggotaan'),
        komisariat: prefs.getString('nama_keanggotaan'),
        jabatan: prefs.getString('jabatan'),
        pendidikan_terakhir: prefs.getString('pendidikan_terakhir'),
        pekerjaan: prefs.getString('pekerjaan'),
        hobby: prefs.getString('hobby'),
        foto: prefs.getString('foto'),
        username: prefs.getString('username'),
      );
    }
  }

  @override
  Future<void> signOut() async {
    userData = null;
    _userSubject.add(false);
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
