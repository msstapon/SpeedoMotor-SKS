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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("lib/images/collection_motor/newbg.png"),
              )
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: appStyle.getEdgeInsetsFromRatio(left: 6, right: 6),
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
                    child: Text(
                      'RKS Racing',
                      style: appStyle.getTextStyle('titleText'),
                    ),
                  ),
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Username',
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
                        Container(
                          margin: appStyle.getEdgeInsets(top: 4),
                          decoration: appStyle.getCardStype('noShadow'),
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
                            style: appStyle.getTextStyle('normalBlack'),
                            decoration: InputDecoration(
                              // prefixIcon: Is
                              hintText: 'USERNAME',
                              hintStyle: TextStyle(
                                color: AppTheme.colorGrey,
                              ),
                              // isCollapsed: true,
                              // filled: true,
                              fillColor: AppTheme.colorBackgroundWhite,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide: BorderSide(
                                    color: AppTheme.colorBackgroundWhite,
                                    width: 1,
                                    style: BorderStyle.solid
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide: BorderSide(
                                    color: AppTheme.colorBackgroundWhite,
                                    width: 1,
                                    style: BorderStyle.solid
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
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
                    margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Password',
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
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
                            style: appStyle.getTextStyle('normalBlack'),
                            decoration: InputDecoration(
                              // prefixIcon: Is
                              hintText: 'PASSWORD',
                              hintStyle: TextStyle(
                                color: AppTheme.colorGrey,
                              ),
                              // isCollapsed: true,
                              // filled: true,
                              fillColor: AppTheme.colorBackgroundWhite,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide: BorderSide(
                                    color: AppTheme.colorBackgroundWhite,
                                    width: 1,
                                    style: BorderStyle.solid
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide: BorderSide(
                                    color: AppTheme.colorBackgroundWhite,
                                    width: 1,
                                    style: BorderStyle.solid
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
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
                      child: Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          width: appStyle.getWidth(percent: 100),
                          height: appStyle.getHeight(percent: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppTheme.colorFont,
                          ),
                          child: Text(
                            'LOG IN',
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Container(
                  //   margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                  //   child: InkWell(
                  //     onTap: (){
                  //       log('forgot');
                  //       Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgotPassword()));
                  //     },
                  //     child: Text(
                  //       'Forgot your password ?',
                  //       style: appStyle.getTextStyle('normalText'),
                  //     ),
                  //   ),
                  // ),

                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                    child: InkWell(
                      onTap: (){
                        log('sign up');
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUp()));
                      },
                      child: Text(
                        'SIGN UP NOW',
                        style: appStyle.getTextStyle('normalText'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
