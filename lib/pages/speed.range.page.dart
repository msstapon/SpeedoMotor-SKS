import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.config.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:th.go.sks.racing_2/pages/calculator-cc/calculator.page.dart';
import 'package:th.go.sks.racing_2/pages/calculator-gear/calculator_gear.page.dart';
import 'package:th.go.sks.racing_2/pages/gps.page.dart';
import 'package:th.go.sks.racing_2/pages/home.page.dart';
import 'package:th.go.sks.racing_2/utilities/utilities.dart';
import 'package:th.go.sks.racing_2/widgets/dialog/confirm.dialog.widget.dart';
import 'package:kbt_flutter_package/utilities/shared.preferences.util.dart';

class SpeedRang extends StatefulWidget {
  final String sixtyFeetTime;
  final String twoHundredTime;
  final String threeHundredTime;
  final String fourHundredTime;
  final String fiveHundredTime;
  final String sixHundredTime;
  final String sevenHundredTime;
  final String eightHundredTime;
  final String nineHundredTime;
  final String oneThousandTime;
  final String oneThousand1Time;
  final String oneThousand2Time;
  final String oneThousand3Time;
  final String oneThousand4Time;
  final String oneThousand5Time;
  final String oneThousand6Time;
  final String oneThousand7Time;
  final String oneThousand8Time;
  final String oneThousand9Time;
  final String twoThousandTime;
  final String sixtyFeetTime1;
  final String twoHundredTime1;
  final String threeHundredTime1;
  final String fourHundredTime1;
  final String fiveHundredTime1;
  final String sixHundredTime1;
  final String sevenHundredTime1;
  final String eightHundredTime1;
  final String nineHundredTime1;
  final String oneThousandTime1;
  final String oneThousand1Time1;
  final String oneThousand2Time1;
  final String oneThousand3Time1;
  final String oneThousand4Time1;
  final String oneThousand5Time1;
  final String oneThousand6Time1;
  final String oneThousand7Time1;
  final String oneThousand8Time1;
  final String oneThousand9Time1;
  final String twoThousandTime1;
  final String maxSpeed;
  final String avgSpeed;
  final String totalKm;

  SpeedRang({
    Key key,
    this.sixtyFeetTime,
    this.twoHundredTime,
    this.threeHundredTime,
    this.fourHundredTime,
    this.fiveHundredTime,
    this.sixHundredTime,
    this.sevenHundredTime,
    this.eightHundredTime,
    this.nineHundredTime,
    this.oneThousandTime,
    this.oneThousand1Time,
    this.oneThousand2Time,
    this.oneThousand3Time,
    this.oneThousand4Time,
    this.oneThousand5Time,
    this.oneThousand6Time,
    this.oneThousand7Time,
    this.oneThousand8Time,
    this.oneThousand9Time,
    this.twoThousandTime,
    this.sixtyFeetTime1,
    this.twoHundredTime1,
    this.threeHundredTime1,
    this.fourHundredTime1,
    this.fiveHundredTime1,
    this.sixHundredTime1,
    this.sevenHundredTime1,
    this.eightHundredTime1,
    this.nineHundredTime1,
    this.oneThousandTime1,
    this.oneThousand1Time1,
    this.oneThousand2Time1,
    this.oneThousand3Time1,
    this.oneThousand4Time1,
    this.oneThousand5Time1,
    this.oneThousand6Time1,
    this.oneThousand7Time1,
    this.oneThousand8Time1,
    this.oneThousand9Time1,
    this.twoThousandTime1,
    this.maxSpeed,
    this.avgSpeed,
    this.totalKm,
  }) : super(key: key);

  @override
  _SpeedRangState createState() => _SpeedRangState();
}

Future<bool> _onBackPressed() async {
  return false;
  // return showDialog(
  //   context: context,
  //   builder: (context) => new AlertDialog(
  //     title: new Text('ยืนยัน?'),
  //     content: new Text('คุณต้องการออกจากแอพหรือไม่'),
  //     actions: <Widget>[
  //       new GestureDetector(
  //         onTap: () => Navigator.of(context).pop(false),
  //         child: Text("ไม่"),
  //       ),
  //       SizedBox(height: 16),
  //       new GestureDetector(
  //         onTap: () async {
  //           await prefs.setBool("isExitApp", true);
  //           Navigator.of(context).pop(true);
  //         },
  //         child: Text("ใช่"),
  //       ),
  //     ],
  //   ),
  // ) ??
  //     false;
}

class _SpeedRangState extends State<SpeedRang> {
  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: appStyle.getHeight100(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/images/collection_motor/new_icon/newBg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // profile, change pin , logout
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).pop();
                              },
                              child: new Container(
                                margin: appStyle.getEdgeInsetsFromRatio(top: 6, left: 5),
                                height: appStyle.getHeight(percent: 7),
                                width: appStyle.getWidth(percent: 10),
                                child: new Image.asset(
                                  'lib/images/collection_motor/new_icon/sks-page-07-117.png',
                                ),
                              )),
                          Container(
                            margin: appStyle.getEdgeInsetsFromRatio(top: 6, left: 5),
//                          width: appStyle.getWidth(percent: 43),
                            child: Text(
                              'SPEED RANGE ',
                              style: TextStyle(fontSize: appStyle.getWidth(percent: 8), fontFamily: 'spyagency3condital', color: AppTheme.colorGrey),
                            ),
                          ),
                        ],
                      ),
                      buildCenter(context, appStyle),
                      buildCenter2(context, appStyle),
                      buildDistance(context, appStyle),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCenter(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        top: 3,
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: appStyle.getHeight(percent: 4),
            alignment: Alignment.topCenter,
            child: Text(
              'TOTAL ',
              style: TextStyle(fontSize: appStyle.getWidth(percent: 5), fontFamily: 'spyagency3condital', color: AppTheme.colorGrey),
            ),
          ),
          Container(
            child: Text(
              '${widget.totalKm}',
              style: TextStyle(fontSize: appStyle.getWidth(percent: 13), fontFamily: 'spyagency3cond', color: AppTheme.colorBackgroundWhite),
            ),
          ),
          Container(
            height: appStyle.getHeight(percent: 4),
            alignment: Alignment.bottomCenter,
            child: Text(
              ' KM',
              style: TextStyle(fontSize: appStyle.getWidth(percent: 5), fontFamily: 'spyagency3condital', color: AppTheme.colorGrey),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCenter2(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(all: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'MAX.SPEED',
                style: TextStyle(fontSize: appStyle.getWidth(percent: 5), fontFamily: 'spyagency3cond', color: AppTheme.colorGrey),
              ),
              Container(
                width: appStyle.getWidth(percent: 30),
                height: appStyle.getHeight(percent: 5),
                decoration: BoxDecoration(
                  color: AppTheme.colorBlack,
                  borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                      ),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                      child: Text(
                        '${widget.maxSpeed}',
                        style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: appStyle.getHeight(percent: 7),
            alignment: Alignment.bottomCenter,
            child: Text(
              'KM/H',
              style: TextStyle(fontSize: appStyle.getWidth(percent: 3.5), fontFamily: 'spyagency3cond', color: AppTheme.colorGrey),
            ),
          ),
          Container(
            width: appStyle.getWidth(percent: 2),
          ),
          Column(
            children: [
              Text(
                'AVG.SPEED',
                style: TextStyle(fontSize: appStyle.getWidth(percent: 5), fontFamily: 'spyagency3cond', color: AppTheme.colorGrey),
              ),
              Container(
                width: appStyle.getWidth(percent: 30),
                height: appStyle.getHeight(percent: 5),
                decoration: BoxDecoration(
                  color: AppTheme.colorBlack,
                  borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                      ),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                      child: Text(
                        '${widget.avgSpeed}',
                        style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: appStyle.getHeight(percent: 7),
            alignment: Alignment.bottomCenter,
            child: Text(
              'KM/H',
              style: TextStyle(fontSize: appStyle.getWidth(percent: 3.5), fontFamily: 'spyagency3cond', color: AppTheme.colorGrey),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDistance(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(right: 2, left: 2, top: 1, bottom: 10),
//      color: AppTheme.colorBlack,
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
            ),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(
          children: [
            build60FT(context, appStyle),
            build200(context, appStyle),
            build300(context, appStyle),
            build400(context, appStyle),
            build500(context, appStyle),
            build600(context, appStyle),
            build700(context, appStyle),
            build800(context, appStyle),
            build900(context, appStyle),
            build1000(context, appStyle),
            build1100(context, appStyle),
            build1200(context, appStyle),
            build1300(context, appStyle),
            build1400(context, appStyle),
            build1500(context, appStyle),
            build1600(context, appStyle),
            build1700(context, appStyle),
            build1800(context, appStyle),
            build1900(context, appStyle),
            build2000(context, appStyle),
          ],
        ),
      ),
    );
  }

  Widget build60FT(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '100m. ',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 45),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.sixtyFeetTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.sixtyFeetTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build200(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '200 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.twoHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.twoHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build300(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '300 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.threeHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.threeHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build400(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '400 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.fourHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.fourHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build500(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '500 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.fiveHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.fiveHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build600(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '600 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.sixHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.sixHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build700(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '700 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.sevenHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.sevenHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build800(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '800 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.eightHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.eightHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build900(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '900 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.nineHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.nineHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1000(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1000 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.oneThousandTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.oneThousandTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1100(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1100 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.oneThousand1Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.oneThousand1Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1200(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1200 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.oneThousand2Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.oneThousand2Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1300(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1300 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.oneThousand3Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.oneThousand3Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1400(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1400 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.oneThousand4Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.oneThousand4Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1500(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1500 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.oneThousand5Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.oneThousand5Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1600(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1600 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.oneThousand6Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.oneThousand6Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1700(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1700 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.oneThousand7Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.oneThousand7Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1800(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1800 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.oneThousand8Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.oneThousand8Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1900(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1900 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.oneThousand9Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.oneThousand9Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build2000(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '2000 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${widget.twoThousandTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${widget.twoThousandTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
