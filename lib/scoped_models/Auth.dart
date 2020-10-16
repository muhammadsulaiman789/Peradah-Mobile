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
    var url = "http://203.171.221.227:88/peradah/login.php";
    var response;
    var data;
    await http
        .post(url, body: {"username": username, "password": pwd}).then((value) {
      response = value;
    });

    data = json.decode(response.body);
    // userData = User.fromJson(data['data']);
    print('data $data');
//    print('phone2 ${data.MobilePhone}');
    if (data) {
      try {
        _userSubject.add(true);
        userData = User.fromJson(data);
        print('user data ${userData.username}');
        prefs.setInt('id', userData.id);
        prefs.setString('nama_lengkap', userData.nama_lengkap);
        prefs.setString('nama_panggilan', userData.nama_panggilan);
        prefs.setString('tempat_tanggal_lahir', userData.tempat_tanggal_lahir);
        prefs.setString('jenis_kelamin', userData.jenis_kelamin);
        prefs.setString('status_perkawinan', userData.status_perkawinan);
        prefs.setString('alamat', userData.alamat);
        prefs.setString('kabupaten_kota', userData.kabupaten_kota);
        prefs.setString('provinsi', userData.provinsi);
        prefs.setString('no_kontak', userData.no_kontak);
        prefs.setString('email', userData.email);
        prefs.setString('website', userData.website);
        prefs.setString('pendidikan_terakhir', userData.pendidikan_terakhir);
        prefs.setString('pekerjaan', userData.pekerjaan);
        prefs.setString('pengalaman_organisasi', userData.pengalaman_organisasi);
        prefs.setString('hobby', userData.hobby);
        prefs.setString('jenis_identitas', userData.jenis_identitas);
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
        id: prefs.getInt('id'),
        nama_lengkap: prefs.getString('nama_lengkap'),
        nama_panggilan: prefs.getString('nama_panggilan'),
        tempat_tanggal_lahir: prefs.getString('tempat_tanggal_lahir'),
        jenis_kelamin: prefs.getString('jenis_kelamin'),
        status_perkawinan: prefs.getString('status_perkawinan'),
        alamat: prefs.getString('alamat'),
        kabupaten_kota: prefs.getString('kabupaten_kota'),
        provinsi: prefs.getString('provinsi'),
        no_kontak: prefs.getString('no_kontak'),
        email: prefs.getString('email'),
        website: prefs.getString('website'),
        pendidikan_terakhir: prefs.getString('pendidikan_terakhir'),
        pekerjaan: prefs.getString('pekerjaan'),
        pengalaman_organisasi: prefs.getString('pengalaman_organisasi'),
        hobby: prefs.getString('hobby'),
        jenis_identitas: prefs.getString('jenis_identitas'),
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
