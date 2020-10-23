
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peradahmobile/scoped_models/AppModel.dart';
import 'package:peradahmobile/screen/main_home.dart';
import 'package:peradahmobile/screen/profile_screen.dart';
import 'package:peradahmobile/screen/schedule_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:peradahmobile/widget/icon_calendar_icons.dart';
import 'package:peradahmobile/widget/icon_user_icons.dart';


class MainScreen extends StatefulWidget {

  MainScreen({Key key}) : super(key: key);

  //MemberPage({this.username});
  //final String username;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  AppModel model;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  BuildContext ctx;

  @override
  void initState() {
    super.initState();

//    _prefs.then((SharedPreferences prefs) {
//      bool isLogin2 = prefs.getBool('USER_LOGIN')== null ? false : prefs.getBool('USER_LOGIN');
//      print('login2 $isLogin2');
//      if (!isLogin2) {
//        Navigator.pushReplacementNamed(context, '/LoginScreen');
//      }
//    });
    //_controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [Home(model), Schedule(), Profile()];
  }
  //, Task(), Broadcast(), Meeting(), Message()


  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(FontAwesomeIcons.home, size: 20,),
        title: Text("Home", style: TextStyle(fontSize: 12.0),),
      ),
      BottomNavigationBarItem(
        icon: Icon(IconCalendar.calendar, size: 20,),
        title: Text("Jadwal", style: TextStyle(fontSize: 12.0),),
      ),
      BottomNavigationBarItem(
        icon: Icon(IconUser.user, size: 20,),
        title: Text("Profil", style: TextStyle(fontSize: 12.0),),
      ),
    ];
  }

  int _seletedIndex = 0;
  //final _LayoutPage = [Home(model), Schedule(), Profile()];

  //Task(), Broadcast(), Meeting(), Message()
  void _onTabItem(int index) {
    setState(() {
      _seletedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, AppModel model) {
          return Scaffold(
            backgroundColor: const Color(0xffb11806),
            body: _buildScreens().elementAt(_seletedIndex),
            bottomNavigationBar: BottomNavigationBar(
              items: _navBarsItems(),
              //showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              currentIndex: _seletedIndex,
              onTap: _onTabItem,
            ),
          );
        }
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return PersistentTabView(
//      controller: _controller,
//      items: _navBarsItems(),
//      screens: _buildScreens(),
//      showElevation: false,
//      navBarCurve: NavBarCurve.none,
//      backgroundColor: const Color(0xFFEBEEF1),
//      iconSize: 26.0,
//      navBarStyle:
//          NavBarStyle.neumorphic, // Choose the nav bar style with this property
//      onItemSelected: (index) {
//        print(index);
//      },
//    );
//    //appBar: AppBar( title: Text(
//    //'Selamat Datang, '
//    //'$username',
//    //style: TextStyle(fontSize: 15.0),
//    //),
//    //
//  }
}