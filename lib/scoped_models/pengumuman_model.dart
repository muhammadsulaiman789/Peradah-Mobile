import 'dart:convert';

import 'package:peradahmobile/model/Pengumuman.dart';
import 'package:peradahmobile/model/User.dart';
import 'package:rxdart/rxdart.dart';
import 'CoreModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

mixin PengumumanModel on CoreModel {
  List<Pengumuman> _pengumumans = [];
  Pengumuman _pengumuman;
  bool _isLoading = false;

  List<Pengumuman> get pengumumans {
    return List.from(_pengumumans);
  }

  bool get isLoading {
    return _isLoading;
  }

  Pengumuman get currentPengumuman {
    return _pengumuman;
  }

  List<Pengumuman> setPengumumans(List<Pengumuman> pengumumans) {
    _pengumumans = pengumumans;
  }

  void setCurrentPengumuman(Pengumuman pengumuman) {
    _pengumuman = pengumuman;
  }

  Future<bool> fetchPengumuman() async {
    _isLoading = true;
    notifyListeners();

    print('fetch pengumuman');
    var url = "https://mobile.peradah.org/getpengumuman.php";
    _pengumumans = [];
    var response = await http.get(url);
    var data = jsonDecode(response.body) as List;
    if (data.length > 0) {
      data.forEach((f) {
        print('memo $f');
        _pengumumans.add(Pengumuman.fromJson(f));
      });
    } else {
      print("Null");
    }

    _isLoading = false;
    notifyListeners();
    return true;
  }
}
