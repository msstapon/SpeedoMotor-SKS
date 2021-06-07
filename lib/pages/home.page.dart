
import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/pages/calculator-gear/new_menu_gear.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/camshaft/camshaft.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/collection.brand.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/collection.motor.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/gps.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/setting/setting.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int Index = 0;
  List<Widget> screen = [];
  String myTitle = 'Parent Page';
  Widget showScreen;
  String _dataString = "";
  bool token = false;
  var result;

  @override
  void initState() {
    // TODO: implement initState
//     screen = [
//      CollectionMotor(type: '1',step: 'คำนวณ CC',),
//       CamshaftPage(),
//       // CollectionMotor(type: 'menu1',step: 'GPS',),
//       GPSPage(),
//       CollectionMotor(type: '4',step: 'คำนวณอัตราทดเกียร์',),
//       Setting(),
//    ];

    screen = [
      GPSPage(),
      MenuGear(type: '4',step: 'คำนวณวความเร็ว',),
       CamshaftPage(),
      CollectionBrand(type: '1',step: 'คำนวณ CC',),
       // CollectionMotor(type: 'menu1',step: 'GPS',),
//       Setting(),
    ];
    showScreen = screen[0];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: showScreen,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) async{
            setState(() {
              Index = index;
              showScreen = screen[index];
            });
          }, // new
          currentIndex: Index, // new
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppTheme.colorBlack,
          items: [
            BottomNavigationBarItem(
              activeIcon: new Image.asset(
                  'lib/images/collection_motor/new_icon/sks-menu-icon-75.png',
                height: appStyle.getHeight(percent: 7),
              ),
              icon: new Image.asset(
                'lib/images/collection_motor/new_icon/sks-menu-icon-71.png',
                height: appStyle.getHeight(percent: 7),
              ),
              title : new Text(
                '',
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: new Image.asset(
                  'lib/images/collection_motor/new_icon/sks-menu-icon-76.png',
                height: appStyle.getHeight(percent: 7),
              ),
              icon: new Image.asset(
                  'lib/images/collection_motor/new_icon/sks-menu-icon-72.png',
                  height: appStyle.getHeight(percent: 7),
              ),
              title : new Text(
                  '',
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: new Image.asset(
                'lib/images/collection_motor/new_icon/sks-menu-icon-77.png',
                height: appStyle.getHeight(percent: 7),
              ),
              icon: new Image.asset(
                'lib/images/collection_motor/new_icon/sks-menu-icon-73.png',
                height: appStyle.getHeight(percent: 7),
              ),
              title : new Text(
                  '',
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: new Image.asset(
                'lib/images/collection_motor/new_icon/sks-menu-icon-78.png',
                height: appStyle.getHeight(percent: 7),
              ),
              icon: new Image.asset(
                  'lib/images/collection_motor/new_icon/sks-menu-icon-74.png',
                height: appStyle.getHeight(percent: 7),
              ),
              title : new Text(
                  '',
//                  textAlign: TextAlign.center,
//                  style: appStyle.getTextStyle('normalText')
              ),
            ),
//            BottomNavigationBarItem(
//              activeIcon: new Image.asset(
//                  'lib/images/-ico/sks_settings.png',
//                  width: 33.0,
//                  height: 33.0,
//                  color: AppTheme.colorRed
//              ),
//              icon: new Image.asset(
//                  'lib/images/-ico/sks_settings.png',
//                  width: 30.0,
//                  height: 30.0,
//                  color: AppTheme.colorGrey
//              ),
//              title : new Text(
//                  'ตั้งค่า',
//                  textAlign: TextAlign.center,
//                  style: appStyle.getTextStyle('normalText')
//              ),
//            )
          ],
        ),
      ),
    );
  }
}
