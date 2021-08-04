import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.sharedpreferences.config.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:th.go.sks.racing_2/pages/home.page.dart';
import 'package:th.go.sks.racing_2/pages/sign_up_and_forgot/forgot.page.dart';
import 'package:th.go.sks.racing_2/pages/sign_up_and_forgot/sign.up.page.dart';
import 'package:th.go.sks.racing_2/services/login.model.dart';
import 'package:th.go.sks.racing_2/services/login.services.dart';
import 'package:th.go.sks.racing_2/utilities/utilities.dart';
import 'package:th.go.sks.racing_2/widgets/dialog/message.dialog.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final keyForm = new GlobalKey<FormState>();
  TextEditingController txtUserName = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  String urlLine = "https://liff.line.me/1645278921-kWRPP32q?accountId=114kvwfg&openerPlatform=native&openerKey=talkroom%3Aheader#mst_challenge=XBfBIRGuWXAdZ8BSljT0JD3xJ3C_VPmr0IkWQcmDNeY";

  void loginFunction() async {
    String username = txtUserName.text.trim().toString();
    String password = txtPassword.text.trim().toString();
    // log('user '+username);
    // log('pass ' +password);
    try{
        LoginModel model = await LoginServices().loginServicesApi(
            username: username,
            password: password
        );
        if(model.status != 200) {
          MessageDialogWidget(
            title: 'แจ้งเตือน !!!',
            message: '${model.message}',
            typeDialog: TypeMessageDialog.warning,
            btnOkOnPress: () {
              Navigator.pop(context);
            },).showMessageDialog(context);
        }else{
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> AppTheme(child:HomePage() ,) ), (route) => false);
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool(AppSharedPreferences.login, true);
          pref.setString(AppSharedPreferences.username, username);
          pref.setString(AppSharedPreferences.password, password);
        }

    }catch(error){
      Utilities.defaultHandler(error, context);
    }

  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
      extendBody: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage("lib/images/collection_motor/new_icon/bg_login.png"),
              ),
            ),
          ),
          new Container(
            child: Form(
              key: keyForm,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                padding: appStyle.getEdgeInsetsFromRatio(left: 6,right: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      margin: appStyle.getEdgeInsetsFromRatio(top: 10),
                      width: appStyle.getWidth(percent: 100),
                      height: appStyle.getHeight(percent: 30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/images/collection_motor/logo.png'),
                          )
                      ),
                    ),
                    Container(
                      margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: appStyle.getEdgeInsets(top: 4),
                            decoration: BoxDecoration(
                                color: AppTheme.colorBlack,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            height: appStyle.getHeight(percent: 6.5),
                            child: TextFormField(
                              maxLines: 1,
                              controller: txtUserName,
                              validator: (val){
                                if(val.isEmpty){
                                  return '*** กรุณากรอกข้อมูล';
                                }else{
                                  return null;
                                }
                              },
                              textAlignVertical: TextAlignVertical.bottom,
                              // style: appStyle.getTextStyle('normalBlack'),
                              cursorColor: AppTheme.colorBackgroundWhite,
                              style: TextStyle(
                                  color: AppTheme.colorInfo
                              ),
                              decoration: InputDecoration(
                                // prefixIcon: Is
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                  color: AppTheme.colorBackgroundWhite,
                                    fontSize: appStyle.getWidth(percent: 5)
                                ),
                                // isCollapsed: true,
                                // filled: true,
                                fillColor: AppTheme.colorBackgroundWhite,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: AppTheme.colorBackgroundWhite,
                                      width: 1,
                                      style: BorderStyle.solid
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: AppTheme.colorBackgroundWhite,
                                      width: 1,
                                      style: BorderStyle.solid
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: AppTheme.colorBackgroundWhite,
                                      width: 1,
                                      style: BorderStyle.solid
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: appStyle.getEdgeInsetsFromRatio(top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: appStyle.getEdgeInsets(top: 4),
                            decoration: appStyle.getCardStype('noShadow'),
                            height: appStyle.getHeight(percent: 6.5),
                            child: TextFormField(
                              maxLines: 1,
                              controller: txtPassword,
                              validator: (val){
                                if(val.isEmpty){
                                  return '*** กรุณากรอกข้อมูล';
                                }else{
                                  return null;
                                }
                              },
                              obscureText: true,
                              textAlignVertical: TextAlignVertical.bottom,
                              cursorColor: AppTheme.colorBackgroundWhite,
                              style: TextStyle(
                                  color: AppTheme.colorInfo
                              ),
                              decoration: InputDecoration(
                                // prefixIcon: Is
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: AppTheme.colorBackgroundWhite,
                                  fontSize: appStyle.getWidth(percent: 5)
                                ),
                                // isCollapsed: true,
                                // filled: true,
                                fillColor: AppTheme.colorBackgroundWhite,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: AppTheme.colorBackgroundWhite,
                                      width: 1,
                                      style: BorderStyle.solid
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: AppTheme.colorBackgroundWhite,
                                      width: 1,
                                      style: BorderStyle.solid
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      color: AppTheme.colorBackgroundWhite,
                                      width: 1,
                                      style: BorderStyle.solid
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: appStyle.getEdgeInsetsFromRatio(top: 3),
                      child: GestureDetector(
                        onTap: (){
                           log('tappp');
                          if(txtUserName.text.trim().toString() == null || txtUserName.text.trim().toString() == ''){
                            MessageDialogWidget(
                              title: 'แจ้งเตือน !!!',
                              message: 'กรุณากรอก username',
                              typeDialog: TypeMessageDialog.warning,
                              btnOkOnPress: (){
                                Navigator.pop(context);
                              },).showMessageDialog(context);
                          }else if(txtPassword.text.trim().toString() == null || txtPassword.text.trim().toString() == ''){
                            MessageDialogWidget(
                              title: 'แจ้งเตือน !!!',
                              message: 'กรุณากรอก password',
                              typeDialog: TypeMessageDialog.warning,
                              btnOkOnPress: (){
                                Navigator.pop(context);
                              },).showMessageDialog(context);
                          }else{
                            loginFunction();
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: appStyle.getWidth(percent: 100),
                          height: appStyle.getHeight(percent: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.red.shade500,
                                  Colors.red.shade900,
                                ],
                                stops: [0.1,0.4]
                            ),
                          ),
                          child: Text(
                            'LOGIN',
                            style: appStyle.getTextStyle('normalTextBold'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: appStyle.getEdgeInsetsFromRatio(top: 8),
                      child: InkWell(
                        onTap: (){
                          print("int");
                          _launchInBrowser(urlLine);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: 'ติดต่อ admin เพื่อชำระค่าสมาชิก',style: TextStyle(color: AppTheme.colorBackgroundWhite,fontFamily: 'Kanit')),
                                    TextSpan(text: ' Click here',style: TextStyle(color: AppTheme.colorInfo)),
                                  ]
                              ),
                            ),
                            Container(
                              width: appStyle.getWidth(percent: 12),
                              height: appStyle.getHeight(percent: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('lib/images/collection_motor/new_icon/line.png'),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                    Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: (){
                          log('sign up');
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> AppTheme(child: SignUp(),) ));
                        },
                        child: RichText(
                          text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: 'Don\'t have account ?   ',style: TextStyle(color: AppTheme.colorBackgroundWhite)),
                                TextSpan(text: 'Signup here',style: TextStyle(color: AppTheme.colorInfo)),
                              ]
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
