import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:th.go.sks.racing_2/pages/home.page.dart';
import 'package:th.go.sks.racing_2/pages/login/login.page.dart';
import 'package:th.go.sks.racing_2/pages/sign_up_and_forgot/forgot.page.dart';
import 'package:th.go.sks.racing_2/services/login.model.dart';
import 'package:th.go.sks.racing_2/services/register.services.dart';
import 'package:th.go.sks.racing_2/utilities/utilities.dart';
import 'package:th.go.sks.racing_2/widgets/dialog/message.dialog.widget.dart';
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

    try {
      LoginModel model =
          await RegisterServices().registerServicesApi(username: userName, password: passWord, firstName: null, lastName: null, phone: null);
      log('ress ${model.toString()}');
      if (model.status != 200) {
        MessageDialogWidget(
          title: 'แจ้งเตือน !!!',
          message: 'ชื่อผู้ใช้นี้ได้ถูกใช้แล้ว \nกรุณาลองใหม่',
          typeDialog: TypeMessageDialog.warning,
          btnOkOnPress: () {
            Navigator.pop(context);
          },
        ).showMessageDialog(context);
      } else {
        MessageDialogWidget(
          title: 'สำเร็จ',
          message: 'กรุณารอการตรวจสอบสักครู่วัยรุ่น',
          typeDialog: TypeMessageDialog.success,
          btnOkOnPress: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>  AppTheme(child:LoginPage()) ), (route) => false);
          },
        ).showMessageDialog(context);
      }
    } catch (error) {
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
              image: AssetImage('lib/images/collection_motor/new_icon/bg_register.png'),
            )),
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              padding: appStyle.getEdgeInsetsFromRatio(left: 6, right: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(top: 10),
                    height: appStyle.getHeight(percent: 11),
                    alignment: Alignment.center,
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
                            validator: (val) {
                              if (val.isEmpty) {
                                return '*** กรุณากรอกข้อมูล';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.phone,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: appStyle.getTextStyle('normalText'),
                            inputFormatters: [LengthLimitingTextInputFormatter(10)],
                            decoration: InputDecoration(
                              // prefixIcon: Is
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                color: AppTheme.colorGrey,
                              ),
                              // isCollapsed: true,
                              // filled: true,
                              fillColor: AppTheme.colorBackgroundWhite,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: 1, style: BorderStyle.solid),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: 1, style: BorderStyle.solid),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: 1, style: BorderStyle.solid),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
//                  Container(
//                    margin: appStyle.getEdgeInsetsFromRatio(top: 6),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: [
//                        Container(
//                          alignment: Alignment.centerLeft,
//                          child: Text(
//                            'Username',
//                            style: appStyle.getTextStyle('normalText'),
//                          ),
//                        ),
//                        Container(
//                          margin: appStyle.getEdgeInsets(top: 4),
//                          decoration: appStyle.getCardStype('noShadow'),
//                          height: appStyle.getHeight(percent: 6.5),
//                          child: TextFormField(
//                            maxLines: 1,
//                            controller: txtUserName,
//                            validator: (val){
//                              if(val.isEmpty){
//                                return '*** กรุณากรอกข้อมูล';
//                              }else{
//                                return null;
//                              }
//                            },
//                            textAlignVertical: TextAlignVertical.bottom,
//                            style: appStyle.getTextStyle('normalBlack'),
//                            decoration: InputDecoration(
//                              // prefixIcon: Is
//                              hintText: 'USERNAME',
//                              hintStyle: TextStyle(
//                                color: AppTheme.colorGrey,
//                              ),
//                              // isCollapsed: true,
//                              // filled: true,
//                              fillColor: AppTheme.colorBackgroundWhite,
//                              border: OutlineInputBorder(
//                                borderRadius: BorderRadius.circular(8),
//                                borderSide: BorderSide(
//                                    color: AppTheme.colorBackgroundWhite,
//                                    width: 1,
//                                    style: BorderStyle.solid
//                                ),
//                              ),
//                              enabledBorder: OutlineInputBorder(
//                                borderRadius: BorderRadius.circular(8),
//                                borderSide: BorderSide(
//                                    color: AppTheme.colorBackgroundWhite,
//                                    width: 1,
//                                    style: BorderStyle.solid
//                                ),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                borderRadius: BorderRadius.circular(8),
//                                borderSide: BorderSide(
//                                    color: AppTheme.colorBackgroundWhite,
//                                    width: 1,
//                                    style: BorderStyle.solid
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),

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
                            validator: (val) {
                              if (val.isEmpty) {
                                return '*** กรุณากรอกข้อมูล';
                              } else {
                                return null;
                              }
                            },
                            obscureText: true,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: appStyle.getTextStyle('normalText'),
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
                                borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: 1, style: BorderStyle.solid),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: 1, style: BorderStyle.solid),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: 1, style: BorderStyle.solid),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

//                  Container(
//                    margin: appStyle.getEdgeInsetsFromRatio(top: 2),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: [
//                        Container(
//                          alignment: Alignment.centerLeft,
//                          child: Text(
//                            'FirstName',
//                            style: appStyle.getTextStyle('normalText'),
//                          ),
//                        ),
//                        Container(
//                          margin: appStyle.getEdgeInsets(top: 4),
//                          decoration: appStyle.getCardStype('noShadow'),
//                          height: appStyle.getHeight(percent: 6.5),
//                          child: TextFormField(
//                            maxLines: 1,
//                            controller: txtFirstName,
//                            validator: (val){
//                              if(val.isEmpty){
//                                return '*** กรุณากรอกข้อมูล';
//                              }else{
//                                return null;
//                              }
//                            },
//                            textAlignVertical: TextAlignVertical.bottom,
//                            style: appStyle.getTextStyle('normalBlack'),
//                            decoration: InputDecoration(
//                              // prefixIcon: Is
//                              hintText: 'First Name',
//                              hintStyle: TextStyle(
//                                color: AppTheme.colorGrey,
//                              ),
//                              // isCollapsed: true,
//                              // filled: true,
//                              fillColor: AppTheme.colorBackgroundWhite,
//                              border: OutlineInputBorder(
//                                borderRadius: BorderRadius.circular(8),
//                                borderSide: BorderSide(
//                                    color: AppTheme.colorBackgroundWhite,
//                                    width: 1,
//                                    style: BorderStyle.solid
//                                ),
//                              ),
//                              enabledBorder: OutlineInputBorder(
//                                borderRadius: BorderRadius.circular(8),
//                                borderSide: BorderSide(
//                                    color: AppTheme.colorBackgroundWhite,
//                                    width: 1,
//                                    style: BorderStyle.solid
//                                ),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                borderRadius: BorderRadius.circular(8),
//                                borderSide: BorderSide(
//                                    color: AppTheme.colorBackgroundWhite,
//                                    width: 1,
//                                    style: BorderStyle.solid
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Container(
//                    margin: appStyle.getEdgeInsetsFromRatio(top: 2),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: [
//                        Container(
//                          alignment: Alignment.centerLeft,
//                          child: Text(
//                            'LastName',
//                            style: appStyle.getTextStyle('normalText'),
//                          ),
//                        ),
//                        Container(
//                          margin: appStyle.getEdgeInsets(top: 4),
//                          decoration: appStyle.getCardStype('noShadow'),
//                          height: appStyle.getHeight(percent: 6.5),
//                          child: TextFormField(
//                            maxLines: 1,
//                            controller: txtLastName,
//                            validator: (val){
//                              if(val.isEmpty){
//                                return '*** กรุณากรอกข้อมูล';
//                              }else{
//                                return null;
//                              }
//                            },
//                            textAlignVertical: TextAlignVertical.bottom,
//                            style: appStyle.getTextStyle('normalBlack'),
//                            decoration: InputDecoration(
//                              // prefixIcon: Is
//                              hintText: 'Last Name',
//                              hintStyle: TextStyle(
//                                color: AppTheme.colorGrey,
//                              ),
//                              // isCollapsed: true,
//                              // filled: true,
//                              fillColor: AppTheme.colorBackgroundWhite,
//                              border: OutlineInputBorder(
//                                borderRadius: BorderRadius.circular(8),
//                                borderSide: BorderSide(
//                                    color: AppTheme.colorBackgroundWhite,
//                                    width: 1,
//                                    style: BorderStyle.solid
//                                ),
//                              ),
//                              enabledBorder: OutlineInputBorder(
//                                borderRadius: BorderRadius.circular(8),
//                                borderSide: BorderSide(
//                                    color: AppTheme.colorBackgroundWhite,
//                                    width: 1,
//                                    style: BorderStyle.solid
//                                ),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                borderRadius: BorderRadius.circular(8),
//                                borderSide: BorderSide(
//                                    color: AppTheme.colorBackgroundWhite,
//                                    width: 1,
//                                    style: BorderStyle.solid
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//

                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(top: 3),
                    child: GestureDetector(
                      onTap: () {
                        log('tappp');
                        if (txtUserName.text.trim().toString() == null || txtUserName.text.trim().toString() == '') {
                          MessageDialogWidget(
                            title: 'แจ้งเตือน !!!',
                            message: 'กรุณากรอก username',
                            typeDialog: TypeMessageDialog.warning,
                            btnOkOnPress: () {
                              Navigator.pop(context);
                            },
                          ).showMessageDialog(context);
                        } else if (txtPassword.text.trim().toString() == null || txtPassword.text.trim().toString() == '') {
                          MessageDialogWidget(
                            title: 'แจ้งเตือน !!!',
                            message: 'กรุณากรอก password',
                            typeDialog: TypeMessageDialog.warning,
                            btnOkOnPress: () {
                              Navigator.pop(context);
                            },
                          ).showMessageDialog(context);
                        } else {
                          signUp();
                        }
                      },
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              width: appStyle.getWidth(percent: 100),
                              height: appStyle.getHeight(percent: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(
                                  stops: [0.1, 0.4],
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                  ),
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                    child: InkWell(
                      onTap: () {
                        log('sign up');
                        Navigator.push(context, MaterialPageRoute(builder: (_) => SignUp()));
                      },
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'กรุณาระบุ Username เป็นเบอร์ของท่านเพื่อง่ายต่อการตรวจสอบ   ',
                              style: TextStyle(
                                color: AppTheme.colorBackgroundWhite,
                                fontFamily: 'Kanit'
                              )),
//                              TextSpan(text: 'Signup here',style: TextStyle(color: AppTheme.colorInfo)),
                        ]),
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
