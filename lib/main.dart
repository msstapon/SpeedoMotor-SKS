import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:th.go.sks.racing_2/config/app.sharedpreferences.config.dart';
import 'package:kbt_flutter_package/utilities/shared.preferences.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:th.go.sks.racing_2/pages/home.page.dart';
import 'package:th.go.sks.racing_2/pages/login/login.page.dart';
import 'package:th.go.sks.racing_2/utilities/navigation.util.dart';
import 'package:th.go.sks.racing_2/widgets/other/loading.widget.dart';

import 'services/login.model.dart';
import 'services/login.services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> checkExistLogin() async {
    bool isExistPincode = await SharedPreferencesUtil.containsKey(AppSharedPreferences.login);
    bool isExistLogin = await SharedPreferencesUtil.getBool(AppSharedPreferences.login);
//    return isExistPincode;
    String username = await SharedPreferencesUtil.getString(AppSharedPreferences.username);
    String password = await SharedPreferencesUtil.getString(AppSharedPreferences.password);
    // log('user '+username);
    // log('pass ' +password);
    LoginModel model = await LoginServices().loginServicesApi(username: username, password: password);
//      print("model ${model.toJson()} ${isExistLogin.toString()}");
    if (model.status == 101) {
      if (isExistPincode) {
        return true;
      }else{
        return false;
      }
    } else if (model.status != 200) {
      return false;
    } else {
      if (isExistPincode) {
        return true;
      }else{
        return false;
      }
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('th', 'TH'), // Thai
      ],
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
          future: checkExistLogin(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data) {
                return AppTheme(child: HomePage());
              } else {
//                return  AppTheme(child: HomePage());
                return AppTheme(child: LoginPage()); // AppTheme(child: HomePage());TODO LOGINPAGE
              }
            } else {
//              return  AppTheme(child: HomePage());
              return AppTheme(child: LoginPage());
            }
          }),
      initialRoute: '/',
      onGenerateRoute: (routeSettings) => NavigationUtils.onGenerateRoute(routeSettings),
    );
  }
}
