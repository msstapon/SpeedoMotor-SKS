import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.sharedpreferences.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
//import 'package:th.go.dms.cancer.anywhere/models/shared/ dropdown.model.api.dart';
//import 'package:th.go.dms.cancer.anywhere/models/cancer/token.model.api.dart';
//import 'package:th.go.dms.cancer.anywhere/services/ authentication.service.api.dart';
//import 'package:th.go.dms.cancer.anywhere/models/security/authentication.model.api.dart';
//import 'package:th.go.dms.cancer.anywhere/services/log-view.service.api.dart';
//import 'package:th.go.dms.cancer.anywhere/services/shared.service.api.dart';
//import 'package:th.go.dms.cancer.anywhere/services/token.service.api.dart';
import 'package:th.go.dms.cancer.anywhere/utilities/utilities.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/dialog/message.dialog.widget.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/other/loading.widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  // FocusNode focusNodeTxtFullName = FocusNode();
  // FocusNode focusNodeTxtIDCard = FocusNode();
  // FocusNode focusNodeTxtIDCardLast = FocusNode();
  // FocusNode focusNodeTxtPhone = FocusNode();

  TextEditingController controllerTxtFirstName;
  TextEditingController controllerTxtLastName;
  TextEditingController controllerTxtIDCard;
  // TextEditingController controllerTxtIDCardLast;
  TextEditingController controllerTxtPhone;

  final keyForm = new GlobalKey<FormState>();
  bool isProcess = false;

  var maskIDCard = new MaskTextInputFormatter(mask: '#-####-#####-##-#',filter: {'#' : RegExp(r'[0-9]')});
  var controllerIDCard = new MaskedTextController(mask: '0-0000-00000-00-0');
  var controllerBirthday = new MaskedTextController(mask: '00000000');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerTxtFirstName = new TextEditingController(text: '');
    controllerTxtLastName = new TextEditingController(text: '');
    controllerTxtIDCard = new TextEditingController(text: '');
    // controllerTxtIDCardLast = new TextEditingController(text: '');
    controllerTxtPhone = new TextEditingController(text: '');
  }

  @override
  void dispose() {
    // TODO: implement disposeer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AppStyle appStyle = new AppStyle(context);
    return new Scaffold(
      backgroundColor: AppTheme.colorPrimaryDark,
      body: new Stack(
        children: <Widget>[
          new SingleChildScrollView(
            padding: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
            child: new ConstrainedBox(
              constraints: new BoxConstraints(),
              child: new Column(children: <Widget>[
                buildLogin(appStyle)
              ]),
            ),
          ),
          Positioned(
            child: isProcess
                ? AppTheme(child: LoadingWidget().createLoadingDialog(context))
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget buildLogin(AppStyle appStyle) {
    return Stack(
      // fit: StackFit.expand,
      children: [
        Container(
          // child: Image.asset(
          //   'lib/images/-img/img_bglogin.png'
          // ),
          width: appStyle.getWidth(percent: 100),
          height: appStyle.getHeight(percent: 100),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppTheme.colorPrimaryDark,
                AppTheme.colorPrimary,
              ]
            )
          ),
        ),
        SafeArea(
          child: Form(
              key: keyForm,
            child: Container(
              margin: appStyle.getEdgeInsetsFromRatio(left: 2,right: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    // padding: appStyle.getEdgeInsetsFromRatio(top: 4),
                    child: Column(
                      children: [
                        Text(
                          'ลงทะเบียน',
                          style: appStyle.getTextStyle('titleText'),
                        ),
                        SizedBox(
                          height: appStyle.getHeight(percent: 2),
                        ),
                        Text(
                          'กรุณาระบุข้อมูลเบื้องต้นเพื่อลงทะเบียนเข้าใช้ระบบ',
                          style: appStyle.getTextStyle('normalText'),
                        ),
                        SizedBox(
                          height: appStyle.getHeight(percent: 2),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: appStyle.getWidth100(),
                    margin: appStyle.getEdgeInsetsFromRatio(left: 2,right: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppTheme.colorBackgroundWhite.withOpacity(0.55),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: appStyle.getEdgeInsetsFromRatio(top: 4,left: 2,right: 2),
                          padding: appStyle.getEdgeInsetsFromRatio(left: 2,right: 2),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ชื่อ'
                              ),
                              Container(
                                margin: appStyle.getEdgeInsets(top: 4),
                                decoration: appStyle.getCardStype('noShadow'),
                                height: appStyle.getHeight(percent: 6.5),
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: controllerTxtFirstName,
                                  validator: (val){
                                    if(val.isEmpty){
                                      return '*** กรุณากรอกชื่อ';
                                    }else{
                                      return null;
                                    }
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  style: appStyle.getTextStyle('normalPrimary'),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: AppTheme.colorGrey,
                                    ),
                                    hintText: 'ชื่อ',
                                    hintStyle: TextStyle(
                                      color: AppTheme.colorGrey,
                                    ),
                                    isCollapsed: true,
                                    filled: true,
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
                          margin: appStyle.getEdgeInsetsFromRatio(top: 2,left: 2,right: 2),
                          padding: appStyle.getEdgeInsetsFromRatio(left: 2,right: 2),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'นามสกุล'
                              ),
                              Container(
                                margin: appStyle.getEdgeInsets(top: 4),
                                decoration: appStyle.getCardStype('noShadow'),
                                height: appStyle.getHeight(percent: 6.5),
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: controllerTxtLastName,
                                  validator: (val){
                                    if(val.isEmpty){
                                      return '*** กรุณากรอกนามสกุล';
                                    }else{
                                      return null;
                                    }
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  style: appStyle.getTextStyle('normalPrimary'),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: AppTheme.colorGrey,
                                    ),
                                    hintText: 'นามสกุล',
                                    hintStyle: TextStyle(
                                      color: AppTheme.colorGrey,
                                    ),
                                    isCollapsed: true,
                                    filled: true,
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
                          margin: appStyle.getEdgeInsetsFromRatio(top: 2,left: 2,right: 2),
                          padding: appStyle.getEdgeInsetsFromRatio(left: 2,right: 2),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'เลขบัตรประชาชน'
                              ),
                              Container(
                                margin: appStyle.getEdgeInsets(top: 4),
                                decoration: appStyle.getCardStype('noShadow'),
                                height: appStyle.getHeight(percent: 6.5),
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: controllerTxtIDCard,
                                  // controller: controllerIDCard,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    // FilteringTextInputFormatter.allow(RegExp('[0-9,-]')),
                                    maskIDCard,
                                    LengthLimitingTextInputFormatter(17),
                                  ],
                                  validator: (val){
                                    if(val.isEmpty || val.length != 13){
                                      return '*** เลขบัตรประชาชน';
                                    }else{
                                      return null;
                                    }
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  style: appStyle.getTextStyle('normalPrimary'),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.credit_card_rounded,
                                      color: AppTheme.colorGrey,
                                    ),
                                    hintText: 'เลขบัตรประชาชน 13 หลัก',
                                    hintStyle: TextStyle(
                                      color: AppTheme.colorGrey
                                    ),
                                    isCollapsed: true,
                                    filled: true,
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
                          margin: appStyle.getEdgeInsetsFromRatio(top: 2,left: 2,right: 2),
                          padding: appStyle.getEdgeInsetsFromRatio(left: 2,right: 2),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'วันเดือนปีเกิด \n(ตัวอย่าง 7 มกราคม 2518  พิมพ์ "07012518" )'
                              ),
                              Container(
                                margin: appStyle.getEdgeInsets(top: 4),
                                decoration: appStyle.getCardStype('noShadow'),
                                height: appStyle.getHeight(percent: 6.5),
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: controllerBirthday,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
                                    LengthLimitingTextInputFormatter(8),
                                  ],
                                  validator: (val){
                                    if(val.isEmpty || val.length != 8){
                                      return '*** วันเดือนปีเกิด';
                                    }else{
                                      return null;
                                    }
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  style: appStyle.getTextStyle('normalPrimary'),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.credit_card_rounded,
                                      color: AppTheme.colorGrey,
                                    ),
                                    hintText: '07012518',
                                    hintStyle: TextStyle(
                                      color: AppTheme.colorGrey
                                    ),
                                    isCollapsed: true,
                                    filled: true,
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
                          margin: appStyle.getEdgeInsetsFromRatio(top: 2,left: 2,right: 2,bottom: 4),
                          padding: appStyle.getEdgeInsetsFromRatio(left: 2,right: 2),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'โทรศัพท์ติดต่อ'
                              ),
                              Container(
                                margin: appStyle.getEdgeInsets(top: 4),
                                decoration: appStyle.getCardStype('noShadow'),
                                height: appStyle.getHeight(percent: 6.5),
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: controllerTxtPhone,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  validator: (val){
                                    if(val.isEmpty || val.length != 10){
                                      return '*** กรุณาระบุหมายเลขโทรศัพท์';
                                    }else{
                                      return null;
                                    }
                                  },
                                  textAlignVertical: TextAlignVertical.center,
                                  style: appStyle.getTextStyle('normalPrimary'),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.phone_rounded,
                                      color: AppTheme.colorGrey,
                                    ),
                                    hintText: 'โทรศัพท์ติดต่อ',
                                    hintStyle: TextStyle(
                                      color: AppTheme.colorGrey
                                    ),
                                    isCollapsed: true,
                                    filled: true,
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
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: appStyle.getWidth100(),
                      height: appStyle.getHeight(percent: 6),
                      margin: appStyle.getEdgeInsetsFromRatio(left: 2,right: 2,top: 4),
                      padding: appStyle.getEdgeInsetsFromRatio(left: 2,right: 2),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppTheme.colorBackgroundWhite
                        ),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text(
                          'ลงทะเบียน/รับรหัส OTP',
                        style: appStyle.getTextStyle('normalText'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}

