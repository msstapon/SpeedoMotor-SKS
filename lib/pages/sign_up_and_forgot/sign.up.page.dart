import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/pages/home.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/login/login.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/sign_up_and_forgot/forgot.page.dart';
import 'package:th.go.dms.cancer.anywhere/services/login.model.dart';
import 'package:th.go.dms.cancer.anywhere/services/register.services.dart';
import 'package:th.go.dms.cancer.anywhere/utilities/utilities.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/dialog/message.dialog.widget.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final keyForm = new GlobalKey<FormState>();
  TextEditingController txtUserName = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  TextEditingController txtFirstName = new TextEditingController();
  TextEditingController txtLastName = new TextEditingController();
  TextEditingController txtPhone = new TextEditingController();

  signUp() async {
    String userName = txtUserName.text.trim().toString();
    String passWord = txtPassword.text.trim().toString();
    String firstName = txtFirstName.text.trim().toString();
    String lastName = txtLastName.text.trim().toString();
    String phone = txtPhone.text.trim().toString();

    try{
      LoginModel model = await RegisterServices().registerServicesApi(
          username: userName,
          password: passWord,
          firstName: firstName,
          lastName: lastName,
          phone: phone
      );
      log('ress ${model.toString()}');
      if(model.status != 200){
        MessageDialogWidget(
          title: 'แจ้งเตือน !!!',
          message: 'ชื่อผู้ใช้นี้ได้ถูกใช้แล้ว \nกรุณาลองใหม่',
          btnOkOnPress: () {
            Navigator.pop(context);
          },).showMessageDialog(context);
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>HomePage()), (route) => false);
      }
    }catch(error){
      Utilities.defaultHandler(error, context);
    }

  }

  @override
  Widget build(BuildContext context) {

    AppStyle appStyle = new AppStyle(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'REGISTER',
          style: appStyle.getTextStyle('titleSP'),
        ),
        centerTitle: true,
        backgroundColor: AppTheme.colorBlack,
      ),
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
                    margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'FirstName',
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
                        Container(
                          margin: appStyle.getEdgeInsets(top: 4),
                          decoration: appStyle.getCardStype('noShadow'),
                          height: appStyle.getHeight(percent: 6.5),
                          child: TextFormField(
                            maxLines: 1,
                            controller: txtFirstName,
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
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                color: AppTheme.colorGrey,
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
                    margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'LastName',
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
                        Container(
                          margin: appStyle.getEdgeInsets(top: 4),
                          decoration: appStyle.getCardStype('noShadow'),
                          height: appStyle.getHeight(percent: 6.5),
                          child: TextFormField(
                            maxLines: 1,
                            controller: txtLastName,
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
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                color: AppTheme.colorGrey,
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
                    margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Phone Number',
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
                        Container(
                          margin: appStyle.getEdgeInsets(top: 4),
                          decoration: appStyle.getCardStype('noShadow'),
                          height: appStyle.getHeight(percent: 6.5),
                          child: TextFormField(
                            maxLines: 1,
                            controller: txtPhone,
                            validator: (val){
                              if(val.isEmpty){
                                return '*** กรุณากรอกข้อมูล';
                              }else{
                                return null;
                              }
                            },
                            keyboardType: TextInputType.phone,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: appStyle.getTextStyle('normalBlack'),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            decoration: InputDecoration(
                              // prefixIcon: Is
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                color: AppTheme.colorGrey,
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
                        }else if(txtFirstName.text.trim().toString() == null || txtFirstName.text.trim().toString() == ''){
                          MessageDialogWidget(
                            title: 'แจ้งเตือน !!!',
                            message: 'กรุณากรอก First Name',
                            btnOkOnPress: (){
                              Navigator.pop(context);
                            },).showMessageDialog(context);
                        }else if(txtLastName.text.trim().toString() == null || txtLastName.text.trim().toString() == ''){
                          MessageDialogWidget(
                            title: 'แจ้งเตือน !!!',
                            message: 'กรุณากรอก Last Name',
                            btnOkOnPress: (){
                              Navigator.pop(context);
                            },).showMessageDialog(context);
                        }else if(txtPhone.text.trim().toString() == null || txtPhone.text.trim().toString() == '' || txtPhone.text.trim().length != 10){
                          MessageDialogWidget(
                            title: 'แจ้งเตือน !!!',
                            message: 'กรุณากรอก Phone Number',
                            btnOkOnPress: (){
                              Navigator.pop(context);
                            },).showMessageDialog(context);
                        }else{
                          signUp();
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
                            gradient: LinearGradient(
                              stops: [0.1,0.4],
                              colors: [
                                Colors.red.shade500,
                                Colors.red.shade900,
                              ],
                            ),
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
