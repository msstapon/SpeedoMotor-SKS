import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.sharedpreferences.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/pages/home.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/sign_up_and_forgot/forgot.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/sign_up_and_forgot/sign.up.page.dart';
import 'package:th.go.dms.cancer.anywhere/services/login.model.dart';
import 'package:th.go.dms.cancer.anywhere/services/login.services.dart';
import 'package:th.go.dms.cancer.anywhere/utilities/utilities.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/dialog/message.dialog.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final keyForm = new GlobalKey<FormState>();
  TextEditingController txtUserName = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

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
        log('data ${model.status}');
        if(model.status != 200) {
          MessageDialogWidget(
            title: 'แจ้งเตือน !!!',
            message: 'Username หรือ password \nไม่ถูกต้อง',
            btnOkOnPress: () {
              Navigator.pop(context);
            },).showMessageDialog(context);
        }else{
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>HomePage()), (route) => false);
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool(AppSharedPreferences.login, true);
        }
        log('data login ${model.status}');
    }catch(error){
      Utilities.defaultHandler(error, context);
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("lib/images/collection_motor/bg.png"),
                ),
              ),
            ),
          ),
          Expanded(
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
                      height: appStyle.getHeight(percent: 18),
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
                                  color: AppTheme.colorInfo,
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
                                  color: AppTheme.colorInfo,
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
                          // log('tappp');
                          if(txtUserName.text.trim().toString() == null || txtUserName.text.trim().toString() == ''){
                            MessageDialogWidget(
                              title: 'แจ้งเตือน !!!',
                              message: 'กรุณากรอก username',
                              btnOkOnPress: (){
                                Navigator.pop(context);
                              },).showMessageDialog(context);
                          }else if(txtPassword.text.trim().toString() == null || txtPassword.text.trim().toString() == ''){
                            MessageDialogWidget(
                              title: 'แจ้งเตือน !!!',
                              message: 'กรุณากรอก password',
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
                      margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                      child: InkWell(
                        onTap: (){
                          log('sign up');
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUp()));
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
