import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/pages/bar_chart/samples/bar_chart_sample2.dart';

class CalculatorCCPage extends StatefulWidget {
  @override
  _CalculatorCCPageState createState() => _CalculatorCCPageState();
}

class _CalculatorCCPageState extends State<CalculatorCCPage> {
  final _formKey = GlobalKey<FormState>();
  int requestTypeKey = 0, wheel1 = 0, wheel2 = 0, wheel3 = 0, wheel4 = 0, wheel5 = 0, wheel6 = 0, wheel7 = 0, wheel8 = 0, wheel9 = 0, wheel10 = 0;
  int headLight = 0, dashboardLight = 0, outsideMirror = 0, distilledWater = 0;
  int vince = 0, crane = 0, slide = 0, bridge = 0;
  int coolingWater = 0, engineOil = 0, startCar = 0;
  bool otherService = false;
  bool clearTire = false;
  bool clearHydraulic = false;
  bool event1 = false, event2 = false, event3 = false, event4 = false, event5 = false, event6 = false, eventOther = false;
  TextEditingController txtControllerInput1 = new TextEditingController();
  TextEditingController txtControllerInput2 = new TextEditingController();
  TextEditingController txtControllerOther = new TextEditingController();
  TextEditingController txtControllerRecommend = new TextEditingController();
  TextEditingController txtControllerService = new TextEditingController();
  FocusNode myFocusNode;
  bool focus = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CC W100',
          style: appStyle.getTextStyle('titleText'),
          // style: appStyle.getTextStyle('titleText'),
        ),
        centerTitle: true,
        backgroundColor: AppTheme.colorPrimaryDark,
        actions: [
          Container(
            margin: appStyle.getEdgeInsetsFromRatio(right: 1.5, top: 0.5, bottom: 0.5),
            child: Image.asset(
              'lib/images/collection_motor/logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      backgroundColor: AppTheme.colorBlack.withOpacity(0.95),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/collection_motor/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // profile, change pin , logout
            buildContent(context, appStyle),
          ],
        ), /* add child content here */
      ),
    );
  }

  Widget buildContent(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(right: 5, left: 5, top: 3),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(text: 'ขนาดลูก/mm', style: appStyle.getTextStyle('normalText')),
                            TextSpan(text: ' *', style: appStyle.getTextStyle('normalText')),
                          ]),
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: appStyle.getEdgeInsetsFromRatio(left: 2, right: 2),
                              child: TextFormField(
                                maxLines: 1,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'กรุณากรอกขนาดลูก';
                                  }
                                  return null;
                                },
                                decoration: new InputDecoration(
                                  isCollapsed: false,
                                  hintText: '',
                                  hintStyle: appStyle.getTextStyle('normalText'),
                                  prefixIcon: Icon(
                                    Icons.two_wheeler,
                                    color: AppTheme.colorBackgroundWhite,
                                  ),
                                  labelText: 'ขนาดลูกมาตรฐาน 50 mm.',
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
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                    borderSide: BorderSide(color: AppTheme.colorRed, width: appStyle.getWidth(percent: 0.25)),
                                  ),
                                ),
                                controller: txtControllerInput1,
//                                autofocus: focus,
//                                focusNode: myFocusNode,
                                keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                                style: appStyle.getTextStyle('normalText'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(text: 'ระยะชัก', style: appStyle.getTextStyle('normalText')),
                            TextSpan(text: ' *', style: appStyle.getTextStyle('normalText')),
                          ]),
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: appStyle.getEdgeInsetsFromRatio(left: 2, right: 2),
                              child: TextFormField(
                                maxLines: 1,
                                validator: (value) {
                                  if (value.isEmpty) {
//                                    return 'กรุณากรอกขนาดลูก';
                                  }
                                  return null;
                                },
                                decoration: new InputDecoration(
                                  isCollapsed: false,
                                  hintText: '',
                                  hintStyle: appStyle.getTextStyle('normalText'),
                                  prefixIcon: Icon(
                                    Icons.speed,
                                    color: AppTheme.colorBackgroundWhite,
                                  ),
                                  labelText: 'ระยะชักมาตรฐาน 49.5',
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
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                    borderSide: BorderSide(color: AppTheme.colorRed, width: appStyle.getWidth(percent: 0.25)),
                                  ),
                                ),
                                controller: txtControllerInput2,
//                                autofocus: focus,
//                                focusNode: myFocusNode,
                                keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                                style: appStyle.getTextStyle('normalText'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: appStyle.getHeight(percent: 3),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(
                    right: 2,
                    left: 2,
                  ),
                  width: appStyle.getWidth100(),
                  child: Text(
                    'CC มาตรฐาน 79.1 cm.',
                    style: appStyle.getTextStyle('normalText'),
                  ),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(
                    right: 2,
                    left: 2,
                  ),
                  width: appStyle.getWidth100(),
                  child: Text(
                    'อัตราส่วนกําลังอัด 9.0 ต่อ 1',
                    style: appStyle.getTextStyle('normalText'),
                  ),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(
                    right: 2,
                    left: 2,
                    bottom: 2
                  ),
                  height: appStyle.getHeight(percent: 0.5),
                  width: appStyle.getWidth100(),
                  color: AppTheme.colorBackgroundWhite,
                ),

                Container(
                  color: const Color(0xff132240),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: AppTheme(child: BarChartSample2(),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
