import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/pages/bar_chart/samples/bar_chart_sample2.dart';
import "package:intl/intl.dart";


class CalculatorCCPage extends StatefulWidget {
  @override
  _CalculatorCCPageState createState() => _CalculatorCCPageState();
}

class _CalculatorCCPageState extends State<CalculatorCCPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController txtControllerInput1 = new TextEditingController();
  TextEditingController txtControllerInput2 = new TextEditingController();
  TextEditingController txtControllerOther = new TextEditingController();
  TextEditingController txtControllerRecommend = new TextEditingController();
  TextEditingController txtFR = new TextEditingController();
  TextEditingController txtRR = new TextEditingController();
  TextEditingController txtControllerService = new TextEditingController();
  FocusNode myFocusNode;
  bool focus = true;
  String answerCC = "79.1";
  double answerRatio;
  String answerAll = "9.0";


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
            child: Image.asset(
              'lib/images/collection_motor/logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      backgroundColor: AppTheme.colorBlack.withOpacity(0.95),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
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
                  height: appStyle.getHeight(percent: 1),
                ),
                buildContent2(context,appStyle),
                Container(
                  height: appStyle.getHeight(percent: 1),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(
                    right: 2,
                    left: 2,
                  ),
                  width: appStyle.getWidth100(),
                  child: Text(
                    'CC มาตรฐาน ${answerCC} cm.',
                    style: appStyle.getTextStyle('normalText'),
                  ),
                ),
                new Row(
                  children: [
                    Expanded(
                      flex: 2,
                        child:  Container(
                          margin: appStyle.getEdgeInsetsFromRatio(
                            right: 2,
                            left: 2,
                          ),
                          width: appStyle.getWidth100(),
                          child: Text(
                            'อัตราส่วนกําลังอัด ${answerAll} ต่อ 1',
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
                    ),

                  ],
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

  Widget buildContent2(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(right: 3, left: 3,),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(text: 'CC น้ำที่วัด', style: appStyle.getTextStyle('normalText')),
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
                          height: appStyle.getHeight(percent: 6),
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
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(color: AppTheme.colorRed, width: appStyle.getWidth(percent: 0.25)),
                              ),
                            ),
                            controller: txtFR,
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
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: (){
                calculatorCC();
              },
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 1,right: 1,),
                height: appStyle.getHeight(percent: 6),
                decoration: BoxDecoration(
                  color: AppTheme.colorFont,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  'ผลลัพธ์',
                  style: appStyle.getTextStyle('normalText'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  calculatorCC() async{
    var input1 = double.parse(txtControllerInput1.text)/10;
    var input2 = double.parse(txtControllerInput2.text)/10;
    var water = double.parse(txtFR.text);

    var cc1 = input1*input1;
    var cc2 = (cc1*3.14*input2)/4;
    var water1 = water+cc2;
    print('${water1}');
    var water2 = water1/water;

    var f = NumberFormat("###.00#", "en_US");
    var cc3 = f.format(cc2);
    var all = f.format(water2);
    setState(() {
      answerCC = cc3;
      answerAll = all;
    });
    print("${cc2}");
  }


}
