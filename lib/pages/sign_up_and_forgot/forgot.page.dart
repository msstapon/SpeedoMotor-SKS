import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final keyForm = new GlobalKey<FormState>();
  TextEditingController txtUserName = new TextEditingController();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: appStyle.getEdgeInsetsFromRatio(top: 14),
                    child: Text(
                      'FORGOT PASSWORD',
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
                            'SUBMIT',
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
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
