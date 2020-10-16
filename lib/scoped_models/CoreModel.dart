import 'package:peradahmobile/model/User.dart';
import 'package:scoped_model/scoped_model.dart';


mixin CoreModel on Model {
  User userData;

  User get data {
   return userData;
  }
}


