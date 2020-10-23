import 'dart:convert';

import 'package:peradahmobile/model/Kegiatan.dart';
import 'package:peradahmobile/model/Pengumuman.dart';
import 'package:peradahmobile/model/User.dart';
import 'package:rxdart/rxdart.dart';
import 'CoreModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

mixin KegiatanModel on CoreModel {
  List<Kegiatan> _kegiatans = [];
  Kegiatan _kegiatan;
  bool _isLoading = false;

  List<Kegiatan> get kegiatans {
    return List.from(_kegiatans);
  }

  bool get isLoading {
    return _isLoading;
  }

  Kegiatan get currentKegiatan {
    return _kegiatan;
  }

  void setCurrentKegiatan(Kegiatan kegiatan) {
    _kegiatan = kegiatan;
  }

  Future<bool> fetchKegiatan() async {
    _isLoading = true;
    notifyListeners();

    print('fetch kegiatan');
    var url = "https://mobile.peradah.org/getkegiatan.php";
    _kegiatans = [];
    var response = await http.get(url);
    var data = jsonDecode(response.body) as List;
    if (data.length > 0) {
      data.forEach((f) {
        print('kegiatan $f');
        _kegiatans.add(Kegiatan.fromJson(f));
      });
    } else {
      print("Null");
    }

    _isLoading = false;
    notifyListeners();
    return true;
  }
}
