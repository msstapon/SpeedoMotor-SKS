import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.sharedpreferences.config.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/dialog/confirm.dialog.widget.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/dialog/message.dialog.widget.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/other/loading.widget.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/other/pincode.widget.dart';

import 'package:kbt_flutter_package/utilities/shared.preferences.util.dart';

class PincodePage extends StatefulWidget {
  final String type;
  final String step;

  PincodePage({Key key, @required this.type, @required this.step})
      : super(key: key);

  @override
  _PincodePageState createState() => _PincodePageState();
}

class _PincodePageState extends State<PincodePage> {
  final GlobalKey<PinCodeWidgetState> _key = GlobalKey();

  int pinLength = AppConfig.pinLength;
  String type = '';
  String titleText = '';
  String forgotText = '';
  bool showForgetText = false;
  bool _isProcess = false;

  @override
  void initState() {
    super.initState();
    if (widget.step == 'createPin-step-1') {
      setState(() {
        type = 'createPin';
        titleText = 'ตั้งค่ารหัส PIN';
        forgotText = '';
        showForgetText = false;
      });
    } else if (widget.step == 'createPin-step-2') {
      setState(() {
        type = 'createPin';
        titleText = 'ยืนยันรหัส PIN';
        forgotText = '';
        showForgetText = false;
      });
    } else if (widget.step == 'changePin-step-1') {
      setState(() {
        type = 'changePin';
        titleText = 'ใส่รหัส PIN เดิม';
        forgotText = '';
        showForgetText = false;
      });
    } else if (widget.step == 'changePin-step-2') {
      setState(() {
        type = 'changePin';
        titleText = 'ใส่รหัส PIN ใหม่';
        forgotText = '';
        showForgetText = false;
      });
    } else if (widget.step == 'changePin-step-3') {
      setState(() {
        type = 'changePin';
        titleText = 'ยืนยันรหัส PIN';
        forgotText = '';
        showForgetText = false;
      });
    } else if (widget.step == 'verifyPin-step-1') {
      setState(() {
        type = 'verifyPin';
        titleText = 'ใส่รหัส PIN';
        forgotText = 'ลืมรหัส PIN ';
        showForgetText = true;
      });
    }
  }

  onChange(String number) async {
    if (number.length == pinLength) {
      if (widget.step == 'createPin-step-1') {
        await SharedPreferencesUtil.setString(
            AppSharedPreferences.createPinCode, number);
        await Navigator.pushNamed(context, '/createPin-step-2').then((value) {
          _key.currentState.clearPincode();
        });
      } else if (widget.step == 'createPin-step-2') {
        String createPinCode = await SharedPreferencesUtil.getString(
            AppSharedPreferences.createPinCode);
        if (createPinCode == number) {
          await SharedPreferencesUtil.setString(
              AppSharedPreferences.pinCode, number);
          await SharedPreferencesUtil.remove(
              AppSharedPreferences.createPinCode);
          setState(() {
            _isProcess = true;
          });
          bool isConnected = true; //await PingServiceApi.ping(); TODO PING
          if (isConnected) {
            await Navigator.pushNamedAndRemoveUntil(
                context, '/home', (Route<dynamic> route) => false);
          }
        } else {
          await MessageDialogWidget(
              title: "แจ้งเตือน",
              message:
              'ระบุรหัส PIN ใหม่ไม่ตรงกัน กรุณาทำรายการใหม่อีกครั้ง',
              typeDialog: TypeMessageDialog.warning)
              .showMessageDialog(context);
          await SharedPreferencesUtil.remove(
              AppSharedPreferences.createPinCode);
          Navigator.of(context).pop();
        }
      } else if (widget.step == 'changePin-step-1') {
        String pincode =
        await SharedPreferencesUtil.getString(AppSharedPreferences.pinCode);
        if (pincode == number) {
          await Navigator.pushNamed(context, '/changePin-step-2')
              .then((value) => _key.currentState.clearPincode());
        } else {
          await MessageDialogWidget(
              title: 'แจ้งเตือน',
              message: 'รหัส PIN ไม่ถูกต้อง กรุณาใส่รหัส PIN ใหม่',
              typeDialog: TypeMessageDialog.warning,
              btnOkOnPress: () {
                Navigator.of(context).pop();
              }).showMessageDialog(context);
          _key.currentState.clearPincode();
        }
      } else if (widget.step == 'changePin-step-2') {
        await SharedPreferencesUtil.setString(
            AppSharedPreferences.createPinCode, number);
        await Navigator.pushNamed(context, '/changePin-step-3')
            .then((value) => _key.currentState.clearPincode());
      } else if (widget.step == 'changePin-step-3') {
        String createPinCode = await SharedPreferencesUtil.getString(
            AppSharedPreferences.createPinCode);
        if (createPinCode == number) {
          await SharedPreferencesUtil.setString(
              AppSharedPreferences.pinCode, number);
          await SharedPreferencesUtil.remove(
              AppSharedPreferences.createPinCode);
          setState(() {
            _isProcess = true;
          });
          await Navigator.pushNamedAndRemoveUntil(context, '/home',(Route<dynamic> route) => false);
        } else {
          await MessageDialogWidget(
              title: 'แจ้งเตือน',
              message: 'รหัส PIN ไม่ถูกต้อง กรุณาใส่รหัส PIN ใหม่',
              typeDialog: TypeMessageDialog.warning,
              btnOkOnPress: () {
                Navigator.of(context).pop();
              }).showMessageDialog(context);
          _key.currentState.clearPincode();
        }
      } else if (widget.step == 'verifyPin-step-1') {
        String pincode =
        await SharedPreferencesUtil.getString(AppSharedPreferences.pinCode);
        if (pincode == number) {
          setState(() {
            _isProcess = true;
          });
          bool isConnected = true; //await PingServiceApi.ping(); TODO PING
          if (isConnected) {
            await Navigator.pushReplacementNamed(context, '/home')
                .then((value) async => await Navigator.of(context).pop());
          }
        } else {
          await MessageDialogWidget(
              title: "แจ้งเตือน",
              message: 'รหัส PIN ไม่ถูกต้อง กรุณาใส่รหัส PIN ใหม่',
              typeDialog: TypeMessageDialog.warning,
              btnOkOnPress: () {
                Navigator.of(context).pop();
              }).showMessageDialog(context);
          _key.currentState.clearPincode();
        }
      }
    }
  }

  onReset() {
    ConfirmDialogWidget(
        title: 'ยืนยัน',
        message: 'คุณต้องการรีเซ็ตรหัส PIN ใช่หรือไม่',
        btnOkOnPress: () async {
          String username = await SharedPreferencesUtil.getString(
              AppSharedPreferences.username);
          await SharedPreferencesUtil.clear();
          await SharedPreferencesUtil.setString(
              AppSharedPreferences.username, username);
          await Navigator.pushNamedAndRemoveUntil(
              context, '/login', (Route<dynamic> route) => false);
        }).showConfirmDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
      backgroundColor: AppTheme.colorPrimaryDark,
      body: Stack(
        children: [
          Container(
            // child: Image.asset(
            //   'lib/images/-img/img_bglogin.png'
            // ),
            width: appStyle.getHeight(percent: 100),
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
          middleSection(appStyle),

          Positioned(
            child: _isProcess
                ? AppTheme(
                child: LoadingWidget().createLoadingDialog(context))
                : Container(),
          )
        ],
      ),
    );
  }

  Widget middleSection(AppStyle appStyle) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: widget.type == 'changePin'
                  ? ([
                Column(
                  children: [
                    IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: appStyle.getHeight(percent: 4),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ])
                  : ([
                Column(
                  children: [
                    IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(
                        Icons.close,
                        color: AppTheme.colorPrimaryDark,
                        size: appStyle.getHeight(percent: 4),
                      ),
                      onPressed: (){},
                    )
                  ],
                ),
              ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding:
                        appStyle.getEdgeInsetsFromRatio(left: 5, right: 5),
                        child: PinCodeWidget(
                          key: _key,
                          pinLength: pinLength,
                          fontColor: AppTheme.colorBackgroundWhite,
                          title: titleText,
                          forgetText: forgotText,
                          showForgetText: showForgetText,
                          onChange: onChange,
                          onReset: onReset,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}

