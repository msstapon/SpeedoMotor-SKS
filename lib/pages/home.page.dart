import 'dart:developer';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:kbt_flutter_package/utilities/shared.preferences.util.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.sharedpreferences.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/pages/collection.motor.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/gps.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/login/login.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/setting/setting.page.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/dialog/confirm.dialog.widget.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/dialog/message.dialog.widget.dart';

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
     screen = [
      CollectionMotor(type: 'menu1',step: 'คำนวณ CC',),
       CollectionMotor(type: 'menu1',step: 'คำนวณองศาแคม',),
       // CollectionMotor(type: 'menu1',step: 'GPS',),
       GPSPage(),
       CollectionMotor(type: 'menu1',step: 'คำนวณอัตราทดเกียร์',),
       Setting(),
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
                  'lib/images/-ico/sks_speedometer.png',
                  width: 30.0,
                  height: 30.0,
                  color: AppTheme.colorRed
              ),
              icon: new Image.asset(
                'lib/images/-ico/sks_speedometer.png',
                width: 30.0,
                height: 30.0,
                color: AppTheme.colorGrey
              ),
              title : new Text(
                'คำนวณ CC',
                textAlign: TextAlign.center,
                style: appStyle.getTextStyle('normalText')
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: new Image.asset(
                  'lib/images/-ico/sks_square_ruler.png',
                  width: 30.0,
                  height: 30.0,
                  color: AppTheme.colorRed
              ),
              icon: new Image.asset(
                  'lib/images/-ico/sks_square_ruler.png',
                  width: 30.0,
                  height: 30.0,
                  color: AppTheme.colorGrey
              ),
              title : new Text(
                  'องศาแคม',
                  textAlign: TextAlign.center,
                  style: appStyle.getTextStyle('normalText')
              ),
            ),
            BottomNavigationBarItem(
              activeIcon:  Icon(
                Icons.gps_fixed,
                color: AppTheme.colorRed,
                size: 30.0,
              ),
              icon: Icon(
                Icons.gps_fixed,
                color: AppTheme.colorGrey,
                size: 30.0,
              ),
              title : new Text(
                  'GPS',
                  textAlign: TextAlign.center,
                  style: appStyle.getTextStyle('normalText')
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: new Image.asset(
                  'lib/images/-ico/sks_calculator.png',
                  width: 30.0,
                  height: 30.0,
                  color: AppTheme.colorRed
              ),
              icon: new Image.asset(
                  'lib/images/-ico/sks_calculator.png',
                  width: 30.0,
                  height: 30.0,
                  color: AppTheme.colorGrey
              ),
              title : new Text(
                  'อัตราทดเกียร์',
                  textAlign: TextAlign.center,
                  style: appStyle.getTextStyle('normalText')
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: new Image.asset(
                  'lib/images/-ico/sks_settings.png',
                  width: 30.0,
                  height: 30.0,
                  color: AppTheme.colorRed
              ),
              icon: new Image.asset(
                  'lib/images/-ico/sks_settings.png',
                  width: 30.0,
                  height: 30.0,
                  color: AppTheme.colorGrey
              ),
              title : new Text(
                  'ตั้งค่า',
                  textAlign: TextAlign.center,
                  style: appStyle.getTextStyle('normalText')
              ),
            )
          ],
        ),
      ),
    );
  }
}
