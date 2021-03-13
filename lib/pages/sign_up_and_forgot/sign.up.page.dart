import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/pages/login/login.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/sign_up_and_forgot/forgot.page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final keyForm = new GlobalKey<FormState>();
  TextEditingController txtUserName = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  TextEditingController txtConfirmPassword = new TextEditingController();
  TextEditingController txtEmail = new TextEditingController();

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
                image: AssetImage('lib/images/collection_motor/bg.png'),
              )
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: appStyle.getEdgeInsetsFromRatio(left: 6,right: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: appStyle.getEdgeInsetsFromRatio(top: 14),
                    child: Text(
                      'SIGN UP',
                      style: appStyle.getTextStyle('titleSP'),
                    ),
                  ),
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(top: 6),
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
                            'Email',
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
                        Container(
                          margin: appStyle.getEdgeInsets(top: 4),
                          decoration: appStyle.getCardStype('noShadow'),
                          height: appStyle.getHeight(percent: 6.5),
                          child: TextFormField(
                            maxLines: 1,
                            controller: txtEmail,
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
                              hintText: 'Email@gmail.com',
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
                    margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Confirm Password',
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
                        Container(
                          margin: appStyle.getEdgeInsets(top: 4),
                          decoration: appStyle.getCardStype('noShadow'),
                          height: appStyle.getHeight(percent: 6.5),
                          child: TextFormField(
                            maxLines: 1,
                            controller: txtConfirmPassword,
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
                              hintText: 'Confirm Password',
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
                        log('tappp');
                      },
                      child: Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          width: appStyle.getWidth(percent: 100),
                          height: appStyle.getHeight(percent: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppTheme.colorBorder,
                          ),
                          child: Text(
                            'SIGN UP',
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                    child: InkWell(
                      onTap: (){
                        log('already');
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                      },
                      child: Text(
                        'Already have account ?',
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
