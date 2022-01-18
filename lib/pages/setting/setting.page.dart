import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.config.dart';
import 'package:th.go.sks.racing_2/config/app.sharedpreferences.config.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:th.go.sks.racing_2/utilities/utilities.dart';
import 'package:th.go.sks.racing_2/widgets/dialog/confirm.dialog.widget.dart';
import 'package:kbt_flutter_package/utilities/shared.preferences.util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:th.go.sks.racing_2/widgets/other/loading.widget.dart';

final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  TextEditingController txtDistance1 = new TextEditingController();
  TextEditingController txtDistance2 = new TextEditingController();
  TextEditingController txtDistance3 = new TextEditingController();
  TextEditingController txtDistance4 = new TextEditingController();
  TextEditingController txtDistance5 = new TextEditingController();
  TextEditingController txtDistance6 = new TextEditingController();

  bool isProcess = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistoryDistance();
  }

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
      backgroundColor: AppTheme.colorBlack,
      appBar: AppBar(
        title: Text(
          'ตั้งค่าระยะทาง',
          style: TextStyle(
              fontSize: appStyle.getWidth(percent: 6),
              color: AppTheme.colorBackgroundWhite,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
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
          isProcess
              ? Container(
                  height: appStyle.getHeight100(),
                  child: AppTheme(
                      child: LoadingWidget().createLoadingDialog(context)))
              : Container(
                  margin: appStyle.getEdgeInsetsFromRatio(all: 2),
                  height: appStyle.getHeight100(),
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDistance1(context, appStyle),
                        buildDistance2(context, appStyle),
                        buildDistance3(context, appStyle),
                        buildDistance4(context, appStyle),
                        buildDistance5(context, appStyle),
                        buildDistance6(context, appStyle),
                        Container(
                          width: appStyle.getWidth100(),
                          height: appStyle.getHeight(percent: 25),
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: MaterialButton(
                                onPressed: () => {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: appStyle.getHeight(percent: 6),
                                      width: appStyle.getWidth(percent: 43),
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'ย้อนกลับ',
                                          style: appStyle
                                              .getTextStyle('normalText'),
                                        ),
                                        color: AppTheme.colorGrey,
                                      ),
                                    ),
                                    Container(
                                      width: appStyle.getWidth(percent: 43),
                                      height: appStyle.getHeight(percent: 6),
                                      child: RaisedButton(
                                        onPressed: () {
                                          setNewDistance();
                                        },
                                        child: Text(
                                          'บันทึก',
                                          style: appStyle
                                              .getTextStyle('normalText'),
                                        ),
                                        color: AppTheme.colorCard,
                                      ),
                                    ),
                                  ],
                                )),
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

  Widget buildDistance1(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 2, right: 2, bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
            ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ระยะที่ 1',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Row(
                      children: [
                        Text(
                          '60 ',
                          style: TextStyle(
                              fontSize: appStyle.getWidth(percent: 4),
                              color: AppTheme.colorBackgroundWhite,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.normal),
                        ),
                        new Container(
                          width: appStyle.getWidth(percent: 8),
                        ),
                        Text(
                          'ฟุต ',
                          style: TextStyle(
                              fontSize: appStyle.getWidth(percent: 4),
                              color: AppTheme.colorBackgroundWhite,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget buildDistance2(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 2, right: 2, bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
            ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ระยะที่ 2',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Row(
                      children: [
                        Container(
                          width: appStyle.getWidth(percent: 20),
                          height: appStyle.getHeight(percent: 5),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              isCollapsed: false,
                              hintStyle: appStyle.getTextStyle('normalText'),
                              labelStyle: appStyle.getTextStyle('normalText'),
                              fillColor: AppTheme.colorGreybang,
                              filled: true,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(4.0),
                                borderSide: new BorderSide(
                                  color: AppTheme.colorBackgroundWhite,
                                  width: appStyle.getWidth(percent: 0.25),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(4.0),
                                borderSide: new BorderSide(
                                  color: AppTheme.colorBackgroundWhite,
                                  width: appStyle.getWidth(percent: 0.25),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(
                                    color: AppTheme.colorBackgroundWhite,
                                    width: appStyle.getWidth(percent: 0.25)),
                              ),
                            ),
                            controller: txtDistance2,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            style: appStyle.getTextStyle('smallGrey'),
                          ),
                        ),
                        new Container(
                          width: appStyle.getWidth(percent: 4),
                        ),
                        Text(
                          'เมตร ',
                          style: TextStyle(
                              fontSize: appStyle.getWidth(percent: 4),
                              color: AppTheme.colorBackgroundWhite,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget buildDistance3(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 2, right: 2, bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
            ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ระยะที่ 3',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Row(
                      children: [
                        Container(
                          width: appStyle.getWidth(percent: 20),
                          height: appStyle.getHeight(percent: 5),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              isCollapsed: false,
                              hintStyle: appStyle.getTextStyle('normalText'),
                              labelStyle: appStyle.getTextStyle('normalText'),
                              fillColor: AppTheme.colorGreybang,
                              filled: true,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(4.0),
                                borderSide: new BorderSide(
                                  color: AppTheme.colorBackgroundWhite,
                                  width: appStyle.getWidth(percent: 0.25),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(4.0),
                                borderSide: new BorderSide(
                                  color: AppTheme.colorBackgroundWhite,
                                  width: appStyle.getWidth(percent: 0.25),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(
                                    color: AppTheme.colorBackgroundWhite,
                                    width: appStyle.getWidth(percent: 0.25)),
                              ),
                            ),
                            controller: txtDistance3,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            style: appStyle.getTextStyle('smallGrey'),
                          ),
                        ),
                        new Container(
                          width: appStyle.getWidth(percent: 4),
                        ),
                        Text(
                          'เมตร ',
                          style: TextStyle(
                              fontSize: appStyle.getWidth(percent: 4),
                              color: AppTheme.colorBackgroundWhite,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget buildDistance4(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 2, right: 2, bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
            ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ระยะที่ 4',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Row(
                      children: [
                        Container(
                          width: appStyle.getWidth(percent: 20),
                          height: appStyle.getHeight(percent: 5),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              isCollapsed: false,
                              hintStyle: appStyle.getTextStyle('normalText'),
                              labelStyle: appStyle.getTextStyle('normalText'),
                              fillColor: AppTheme.colorGreybang,
                              filled: true,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(4.0),
                                borderSide: new BorderSide(
                                  color: AppTheme.colorBackgroundWhite,
                                  width: appStyle.getWidth(percent: 0.25),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(4.0),
                                borderSide: new BorderSide(
                                  color: AppTheme.colorBackgroundWhite,
                                  width: appStyle.getWidth(percent: 0.25),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(
                                    color: AppTheme.colorBackgroundWhite,
                                    width: appStyle.getWidth(percent: 0.25)),
                              ),
                            ),
                            controller: txtDistance4,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            style: appStyle.getTextStyle('smallGrey'),
                          ),
                        ),
                        new Container(
                          width: appStyle.getWidth(percent: 4),
                        ),
                        Text(
                          'เมตร ',
                          style: TextStyle(
                              fontSize: appStyle.getWidth(percent: 4),
                              color: AppTheme.colorBackgroundWhite,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget buildDistance5(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 2, right: 2, bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
            ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ระยะที่ 5',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Row(
                      children: [
                        Container(
                          width: appStyle.getWidth(percent: 20),
                          height: appStyle.getHeight(percent: 5),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              isCollapsed: false,
                              hintStyle: appStyle.getTextStyle('normalText'),
                              labelStyle: appStyle.getTextStyle('normalText'),
                              fillColor: AppTheme.colorGreybang,
                              filled: true,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(4.0),
                                borderSide: new BorderSide(
                                  color: AppTheme.colorBackgroundWhite,
                                  width: appStyle.getWidth(percent: 0.25),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(4.0),
                                borderSide: new BorderSide(
                                  color: AppTheme.colorBackgroundWhite,
                                  width: appStyle.getWidth(percent: 0.25),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(
                                    color: AppTheme.colorBackgroundWhite,
                                    width: appStyle.getWidth(percent: 0.25)),
                              ),
                            ),
                            controller: txtDistance5,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            style: appStyle.getTextStyle('smallGrey'),
                          ),
                        ),
                        new Container(
                          width: appStyle.getWidth(percent: 4),
                        ),
                        Text(
                          'เมตร ',
                          style: TextStyle(
                              fontSize: appStyle.getWidth(percent: 4),
                              color: AppTheme.colorBackgroundWhite,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget buildDistance6(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 2, right: 2, bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
            ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ระยะที่ 6',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Row(
                      children: [
                        Container(
                          width: appStyle.getWidth(percent: 20),
                          height: appStyle.getHeight(percent: 5),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              isCollapsed: false,
                              hintStyle: appStyle.getTextStyle('normalText'),
                              labelStyle: appStyle.getTextStyle('normalText'),
                              fillColor: AppTheme.colorGreybang,
                              filled: true,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(4.0),
                                borderSide: new BorderSide(
                                  color: AppTheme.colorBackgroundWhite,
                                  width: appStyle.getWidth(percent: 0.25),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(4.0),
                                borderSide: new BorderSide(
                                  color: AppTheme.colorBackgroundWhite,
                                  width: appStyle.getWidth(percent: 0.25),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(
                                    color: AppTheme.colorBackgroundWhite,
                                    width: appStyle.getWidth(percent: 0.25)),
                              ),
                            ),
                            controller: txtDistance6,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            style: appStyle.getTextStyle('smallGrey'),
                          ),
                        ),
                        new Container(
                          width: appStyle.getWidth(percent: 4),
                        ),
                        Text(
                          'เมตร ',
                          style: TextStyle(
                              fontSize: appStyle.getWidth(percent: 4),
                              color: AppTheme.colorBackgroundWhite,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
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
      await Navigator.pushNamedAndRemoveUntil(
          context, '/login', (Route<dynamic> route) => false);
    } catch (error) {
      Utilities.defaultHandler(error, context);
    }
  }

  getHistoryDistance() async {
    double paramDistance2 =
        await SharedPreferencesUtil.getDouble(AppSharedPreferences.distance2);
    double paramDistance3 =
        await SharedPreferencesUtil.getDouble(AppSharedPreferences.distance3);
    double paramDistance4 =
        await SharedPreferencesUtil.getDouble(AppSharedPreferences.distance4);
    double paramDistance5 =
        await SharedPreferencesUtil.getDouble(AppSharedPreferences.distance5);
    double paramDistance6 =
        await SharedPreferencesUtil.getDouble(AppSharedPreferences.distance6);
    setState(() {
      txtDistance2.text =
          paramDistance2.toString() == "null" ? '0' : paramDistance2.toString();
      txtDistance3.text =
          paramDistance3.toString() == "null" ? '0' : paramDistance3.toString();
      txtDistance4.text =
          paramDistance4.toString() == "null" ? '0' : paramDistance4.toString();
      txtDistance5.text =
          paramDistance5.toString() == "null" ? '0' : paramDistance5.toString();
      txtDistance6.text =
          paramDistance6.toString() == "null" ? '0' : paramDistance6.toString();
    });
  }

  setNewDistance() async {
    try{
      setState(() {
        isProcess = true;
      });
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (txtDistance2.text != '0') {
        pref.setDouble(
            AppSharedPreferences.distance2, double.parse(txtDistance2.text));
      }
      if (txtDistance3.text != '0') {
        pref.setDouble(
            AppSharedPreferences.distance3, double.parse(txtDistance3.text));
      }
      if (txtDistance4.text != '0') {
        pref.setDouble(
            AppSharedPreferences.distance4, double.parse(txtDistance4.text));
      }
      if (txtDistance5.text != '0') {
        pref.setDouble(
            AppSharedPreferences.distance5, double.parse(txtDistance5.text));
      }
      if (txtDistance6.text != '0') {
        pref.setDouble(
            AppSharedPreferences.distance6, double.parse(txtDistance6.text));
      }
    }catch(error){
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isProcess = false;
        });
      });
    }
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isProcess = false;
      });
    });
  }


}
