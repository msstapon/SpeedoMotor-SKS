import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/utilities/utilities.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/dialog/confirm.dialog.widget.dart';
import 'package:kbt_flutter_package/utilities/shared.preferences.util.dart';

final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
      backgroundColor: AppTheme.colorBlack,
      appBar: AppBar(
        title: Text(
          'ตั้งค่า',
          style: appStyle.getTextStyle('titleText'),
          // style: appStyle.getTextStyle('titleText'),
        ),
        centerTitle: true,
        backgroundColor: AppTheme.colorPrimaryDark,
        actions: [
          Container(
            // margin: appStyle.getEdgeInsetsFromRatio(right: 1.5, top: 0.5, bottom: 0.5),
            child: Image.asset(
              'lib/images/collection_motor/logo.png',
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: appStyle.getHeight100(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/images/collection_motor/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child:  SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // profile, change pin , logout
                  // buildChangePin(context, appStyle),
                  buildLogout(context, appStyle)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChangePin(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(right: 5, left: 5,top: 6),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/changePin-step-1');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'เปลี่ยนรหัส PIN',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: AppTheme.colorFontWhite,
                ),
              ],
            ),
          ),
          Container(
            height: appStyle.getHeight(percent: 0.1),
            width: appStyle.getWidth100(),
            color: AppTheme.colorBackgroundWhite
            ,
          ),
        ],
      ),
    );
  }

  Widget buildLogout(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(right: 5, left: 5, top: 3),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              //todo
              ConfirmDialogWidget(
                  title: 'ยืนยัน',
                  message: 'คุณต้องการออกจากระบบ ?',
                  btnOkOnPress: () {
                    Navigator.of(context).pop();
                    _logout();
                  }).showConfirmDialog(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ออกจากระบบ',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: AppTheme.colorBackgroundWhite,
                ),
              ],
            ),
          ),
          Container(
            height: appStyle.getHeight(percent: 0.1),
            width: appStyle.getWidth100(),
            color: AppTheme.colorBackgroundWhite,
          ),
        ],
      ),
    );
  }

  _logout() async {
    try {
//      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//      await NotificationServiceApi.deleteDeviceRegister(deviceId: androidInfo.androidId);
//      await AuthenticationServiceApi.logout();
//      String username = await SharedPreferencesUtil.getString(AppSharedPreferences.username);
//      int userKey = await SharedPreferencesUtil.getInt(AppSharedPreferences.userKey);
      await SharedPreferencesUtil.clear();
//      await SharedPreferencesUtil.setString(AppSharedPreferences.username, username);
//      await SharedPreferencesUtil.setInt(AppSharedPreferences.userKey, userKey);
      await Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false);
    } catch (error) {
      Utilities.defaultHandler(error, context);
    }
  }

  Widget buildChangePassword(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(right: 5, left: 5, top: 8),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/settingPassword');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'เปลี่ยนรหัสผ่าน',
                  style: appStyle.getTextStyle('normalBlack'),
                ),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: AppTheme.colorFontWhite,
                ),
              ],
            ),
          ),
          Container(
            height: appStyle.getHeight(percent: 0.1),
            width: appStyle.getWidth100(),
            color: AppTheme.colorGrey,
          ),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(right: 5, left: 5, top: 3),
      child: Column(
        children: [
          Container(
            height: appStyle.getHeight(percent: 0.1),
            width: appStyle.getWidth100(),
            color: AppTheme.colorGrey,
          ),
        ],
      ),
    );
  }
}
