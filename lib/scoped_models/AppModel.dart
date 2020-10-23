import 'package:peradahmobile/scoped_models/kegiatan_model.dart';
import 'package:peradahmobile/scoped_models/pengumuman_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Auth.dart';
import 'CoreModel.dart';

class AppModel extends Model with CoreModel, Auth, KegiatanModel,PengumumanModel {

}