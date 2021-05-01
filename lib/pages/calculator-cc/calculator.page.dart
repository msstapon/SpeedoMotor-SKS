import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/pages/bar_chart/samples/bar_chart_sample2.dart';
import "package:intl/intl.dart";
import 'package:th.go.dms.cancer.anywhere/widgets/other/loading.widget.dart';

class CalculatorCCPage extends StatefulWidget {
  final String input1;
  final String input2;
  final String cc;
  final String peroid;
  final String nameCar;

  CalculatorCCPage({Key key, @required this.input1, @required this.input2, @required this.cc, @required this.peroid, this.nameCar}) : super(key: key);

  @override
  _CalculatorCCPageState createState() => _CalculatorCCPageState();
}

class _CalculatorCCPageState extends State<CalculatorCCPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController txtControllerInput1 = new TextEditingController();
  TextEditingController txtControllerInput2 = new TextEditingController();
  TextEditingController txtControllerInput3 = new TextEditingController();
  TextEditingController txtControllerOther = new TextEditingController();
  TextEditingController txtControllerRecommend = new TextEditingController();
  TextEditingController txtFR = new TextEditingController();
  TextEditingController txtRR = new TextEditingController();
  TextEditingController txtControllerService = new TextEditingController();
  FocusNode myFocusNode;
  bool focus = true;
  String input1Stand = "";
  String input2Stand = "";
  String answerCC = "";
  double answerRatio;
  String answerAll = "9.0";
  bool checkAll = true;
  bool isProcess = false;
  final formatter = new NumberFormat("#,###.##");
  String tempInput1;
  String tempInput2;

  @override
  void initState() {
    // TODO: implement initState
    setFirstText();
    super.initState();
  }

  setFirstText() async {
    setState(() {
      tempInput1 = widget.input1;
      tempInput2 = widget.input2;
      answerAll = widget.peroid;
      answerCC = widget.cc;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(

      backgroundColor: AppTheme.colorBlack.withOpacity(0.95),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: appStyle.getHeight100(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/images/collection_motor/new_icon/sks-page-04-23.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // profile, change pin , logout
              InkWell(
                onTap: (){
                    Navigator.pop(context);
                },
                child: new Container(
                  margin: appStyle.getEdgeInsetsFromRatio(top: 3,left: 5),
                  height: appStyle.getHeight(percent: 7),
                  width: appStyle.getWidth(percent: 10),
                  child: new Image.asset(
                    'lib/images/collection_motor/new_icon/sks-page-07-117.png',
                  ),
                ),
              ),
              isProcess
                  ? Container(height: appStyle.getHeight100(), child: AppTheme(child: LoadingWidget().createLoadingDialog(context)))
                  : buildContent(context, appStyle),
            ],
          ), /* add child content here */
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(right: 5, left: 5, top: 5),
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
                              height: appStyle.getHeight(percent: 8),
                              margin: appStyle.getEdgeInsetsFromRatio(left: 2, right: 2),
                              child: TextFormField(
                                onChanged: (value) {
                                  calculatorCC2(value);
                                },
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
                                  labelText: 'ขนาดลูกมาตรฐาน ${widget.input1} mm.',
                                  labelStyle: appStyle.getTextStyle('smallGrey'),
                                  fillColor: AppTheme.colorBlack,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(10.0),
                                    borderSide: new BorderSide(
                                      color: AppTheme.colorBackgroundWhite,
                                      width: appStyle.getWidth(percent: 0.25),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: appStyle.getWidth(percent: 0.25)),
                                  ),
                                ),
                                controller: txtControllerInput1,
//                                autofocus: focus,
//                                focusNode: myFocusNode,
                                keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                                style: appStyle.getTextStyle('smallGrey'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
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
                                    height: appStyle.getHeight(percent: 8),
                                    margin: appStyle.getEdgeInsetsFromRatio(left: 2, right: 2),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        onChangedInput2(value);
                                      },
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
                                        labelText: 'ระยะชัก ${double.parse(widget.input2).toStringAsFixed(2)}',
                                        labelStyle: appStyle.getTextStyle('smallGrey'),
                                        fillColor: AppTheme.colorBlack,
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: new BorderRadius.circular(10.0),
                                          borderSide: new BorderSide(
                                            color: AppTheme.colorBackgroundWhite,
                                            width: appStyle.getWidth(percent: 0.25),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: appStyle.getWidth(percent: 0.25)),
                                        ),
                                      ),
                                      controller: txtControllerInput2,
                                      keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                                      style: appStyle.getTextStyle('smallGrey'),
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
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(text: 'ระยะชักที่เพิ่ม', style: appStyle.getTextStyle('normalText')),
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
                                    height: appStyle.getHeight(percent: 8),
                                    margin: appStyle.getEdgeInsetsFromRatio(left: 2, right: 2),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        onChangedInput3(value);
                                      },
                                      maxLines: 1,
                                      validator: (value) {
                                        if (value.isEmpty) {}
                                        return null;
                                      },
                                      decoration: new InputDecoration(
                                        isCollapsed: false,
                                        hintText: '',
                                        hintStyle: appStyle.getTextStyle('normalText'),
                                        labelText: 'ระยะชักที่เพิ่ม ',
                                        labelStyle: appStyle.getTextStyle('smallGrey'),
                                        fillColor: AppTheme.colorBlack,
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: new BorderRadius.circular(10.0),
                                          borderSide: new BorderSide(
                                            color: AppTheme.colorBackgroundWhite,
                                            width: appStyle.getWidth(percent: 0.25),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: appStyle.getWidth(percent: 0.25)),
                                        ),
                                      ),
                                      controller: txtControllerInput3,
//                                autofocus: focus,
//                                focusNode: myFocusNode,
                                      keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                                      style: appStyle.getTextStyle('smallGrey'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: appStyle.getHeight(percent: 1),
                ),
                buildContent2(context, appStyle),
                Container(
                  height: appStyle.getHeight(percent: 1),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(
                    right: 2,
                    left: 2,
                  ),
                  alignment: Alignment.center,
                  width: appStyle.getWidth100(),
                  child: Text(
                    'CC มาตรฐาน ${answerCC} cm.',
                    style: appStyle.getTextStyle('normalText'),
                  ),
                ),
                checkAll
                    ? Container(
                        margin: appStyle.getEdgeInsetsFromRatio(
                          right: 2,
                          left: 2,
                        ),
                        alignment: Alignment.center,
                        width: appStyle.getWidth100(),
                        child: Text(
                          'อัตราส่วนกําลังอัด ${answerAll} ต่อ 1',
                          style: appStyle.getTextStyle('normalText'),
                        ),
                      )
                    : Container(
                        margin: appStyle.getEdgeInsetsFromRatio(
                          right: 2,
                          left: 2,
                        ),
                        alignment: Alignment.center,
                        width: appStyle.getWidth100(),
                        child: Text(
                          'ใส่ค่า CC น้ำที่วัดเพิื่อหาอัตราส่วนกําลังอัด',
                          style: appStyle.getTextStyle('normalText'),
                        ),
                      ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContent2(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        right: 3,
        left: 3,
      ),
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
                            onChanged: (value) {
                              onChangeWater(value);
                            },
                            maxLines: 1,
                            validator: (value) {
                              if (value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: new InputDecoration(
                              isCollapsed: false,
                              hintStyle: appStyle.getTextStyle('normalText'),
                              labelStyle: appStyle.getTextStyle('smallGrey'),
                              fillColor: AppTheme.colorBlack,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: new BorderSide(
                                  color: AppTheme.colorBackgroundWhite,
                                  width: appStyle.getWidth(percent: 0.25),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: appStyle.getWidth(percent: 0.25)),
                              ),
                            ),
                            controller: txtFR,
                            keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                            style: appStyle.getTextStyle('smallGrey'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
//          Expanded(
//            flex: 1,
//            child: InkWell(
//              onTap: () {
//                calculatorCC();
//              },
//              child: Container(
//                margin: appStyle.getEdgeInsetsFromRatio(
//                  left: 1,
//                  right: 1,
//                ),
//                height: appStyle.getHeight(percent: 6),
//                decoration: BoxDecoration(
//                  color: AppTheme.colorFont,
//                  borderRadius: BorderRadius.circular(6),
//                ),
//                alignment: Alignment.center,
//                child: Text(
//                  'ผลลัพธ์',
//                  style: appStyle.getTextStyle('normalText'),
//                ),
//              ),
//            ),
//          ),
        ],
      ),
    );
  }

  calculatorCC() async {
    setState(() {
      isProcess = true;
    });
    try {
      FocusScope.of(context).requestFocus(FocusNode());
      var f = NumberFormat("###.00#", "en_US");
      // All คือ คำตอบของ อัตราส่่วนกำลังอัด
      var input1 = double.parse(txtControllerInput1.text) / 10;
      var input2 = double.parse(txtControllerInput2.text) / 10;
      var cc1 = input1 * input1;
      var cc2 = (cc1 * 3.14 * input2) / 4;
      var cc3 = f.format(cc2);
      if (txtFR.text != "") {
        var water = double.parse(txtFR.text);
        var water1 = water + cc2;
        var water2 = water1 / water;
        var all = f.format(water2);
        setState(() {
          answerAll = all;
          answerCC = cc3;
          checkAll = true;
        });
      } else {
        setState(() {
          checkAll = false;
          answerCC = cc3;
          answerAll = "-";
        });
      }
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isProcess = false;
        });
      });
    } catch (error) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isProcess = false;
        });
      });
    }
  }

  void onChangedInput2(value) {
    var inputFirst = txtControllerInput1.text != "" ? txtControllerInput1.text : tempInput1;
    print("inputFirst");
    print(inputFirst);
    if (value != "") {
      var input3 = double.parse(value);
      var input2 = double.parse(widget.input2);
      var input;
      if (input3 > input2) {
        input = input3 - input2;
        var params1 = double.parse(inputFirst) * double.parse(inputFirst) * double.parse(value) * 3.14;
        var params2 = params1 / 4000;
        setState(() {
          answerCC = params2.toStringAsFixed(2);
        });
        setState(() {
//          (input *2).toStringAsFixed(2)
          txtControllerInput3.text = (input / 2).toStringAsFixed(2);
          tempInput2 = input3.toStringAsFixed(2);
        });
      } else {
        setState(() {
          txtControllerInput3.text = "";
          tempInput2 = widget.input2;
          answerCC = widget.cc;
        });
      }
    }
  }

  void onChangedInput3(value) {
    var inputFirst = txtControllerInput1.text != "" ? txtControllerInput1.text : tempInput1;
    if (value != "") {
      var input = (double.parse(value) * 2) + double.parse(widget.input2);
      setState(() {
        txtControllerInput2.text = input.toStringAsFixed(2);
        tempInput2 = input.toStringAsFixed(2);
      });
      var params1 = double.parse(inputFirst) * double.parse(inputFirst) * double.parse(txtControllerInput2.text) * 3.14;
      var params2 = params1 / 4000;
      setState(() {
        answerCC = params2.toStringAsFixed(2);
      });
    } else {
      setState(() {
        txtControllerInput2.text = "";
        tempInput2 = widget.input2;
      });
    }
  }

  void calculatorCC2(value) {
    if (value != "") {
      var params1 = double.parse(value) * double.parse(value) * double.parse(tempInput2) * 3.14;
      var params2 = params1 / 4000;
      setState(() {
        answerCC = params2.toStringAsFixed(2);
      });
    } else {
      if (txtControllerInput2.text != "") {
        var params1 = double.parse(widget.input1) * double.parse(widget.input1) * double.parse(txtControllerInput2.text) * 3.14;
        var params2 = params1 / 4000;
        setState(() {
          answerCC = params2.toStringAsFixed(2);
        });
      } else {
        setState(() {
          answerCC = widget.cc;
        });
      }
    }
//    onChangeWater();
  }

  void onChangeWater(value) {
    if (value != "") {
      var water = double.parse(value);
      var water1 = water + double.parse(answerCC);
      var water2 = water1 / water;
      setState(() {
        answerAll = water2.toStringAsFixed(2);
      });
    } else {
      setState(() {
        answerAll = widget.peroid;
      });
    }
  }
}
