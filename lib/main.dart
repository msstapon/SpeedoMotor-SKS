import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.sharedpreferences.config.dart';
import 'package:kbt_flutter_package/utilities/shared.preferences.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:th.go.dms.cancer.anywhere/pages/gps.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/home.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/login/login.page.dart';
//import 'package:th.go.dms.cancer.anywhere/pages/login/condition.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/pincode/pincode.page.dart';
import 'package:th.go.dms.cancer.anywhere/utilities/navigation.util.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/other/loading.widget.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> checkExistPincode() async {
    bool isExistPincode = await SharedPreferencesUtil.containsKey(AppSharedPreferences.pinCode);
    return isExistPincode;
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
          future: checkExistPincode(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              if(snapshot.data){
                return AppTheme(child: HomePage());
              }else {
                return AppTheme(child: LoginPage());//AppTheme(child: Loginpage()); TODO LOGINPAGE
              }
            } else {
              return AppTheme(child: LoadingWidget());
            }
          }
      ),
      initialRoute: '/',
      onGenerateRoute:  (routeSettings) =>
          NavigationUtils.onGenerateRoute(routeSettings),
    );
  }
}


