import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/pages/home.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/login/login.page.dart';
//import 'package:th.go.dms.cancer.anywhere/pages/login/condition.page.dart';
//import 'package:th.go.dms.cancer.anywhere/pages/otp/otp.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/pincode/pincode.page.dart';

class NavigationUtils{
  static onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
     case '/login':
       return MaterialPageRoute(builder: (_)=> AppTheme(child: LoginPage()));
      case '/pinCode':
        return MaterialPageRoute(builder: (_)=>AppTheme(child: PincodePage(),));
      case '/createPin-step-1':
        return MaterialPageRoute(builder: (_) => AppTheme(child: PincodePage(type: 'createPin', step: 'createPin-step-1',)));
      case '/createPin-step-2':
        return MaterialPageRoute(builder: (_) => AppTheme(child: PincodePage(type: 'createPin', step: 'createPin-step-2',)));
      case '/changePin-step-1':
        return MaterialPageRoute(builder: (_) => AppTheme(child: PincodePage(type: 'changePin', step: 'changePin-step-1',)));
      case '/changePin-step-2':
        return MaterialPageRoute(builder: (_) => AppTheme(child: PincodePage(type: 'changePin', step: 'changePin-step-2',)));
      case '/changePin-step-3':
        return MaterialPageRoute(builder: (_) => AppTheme(child: PincodePage(type: 'changePin', step: 'changePin-step-3',)));
      case '/verifyPin':
        return MaterialPageRoute(builder: (_) => AppTheme(child: PincodePage(type: 'verifyPin', step: 'verifyPin-step-1',)));
      case '/home':
        return MaterialPageRoute(builder: (_)=> AppTheme(child: HomePage(),));
    }
  }
}