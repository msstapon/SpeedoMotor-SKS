import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/pages/bar_chart/samples/bar_chart_sample2.dart';

import '../../config/app.style.config.dart';
import '../../config/app.style.config.dart';
import '../../config/app.style.config.dart';

class CalculatorGearPage extends StatefulWidget {
  @override
  _CalculatorGearPageState createState() => _CalculatorGearPageState();
}

class _CalculatorGearPageState extends State<CalculatorGearPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController txtRPM1 = new TextEditingController();
  TextEditingController txtL1 = new TextEditingController();
  TextEditingController txtRP1 = new TextEditingController();
  TextEditingController txtM1 = new TextEditingController();
  TextEditingController txtC1 = new TextEditingController();

  TextEditingController txtRPM2 = new TextEditingController();
  TextEditingController txtL2 = new TextEditingController();
  TextEditingController txtRP2 = new TextEditingController();
  TextEditingController txtM2 = new TextEditingController();
  TextEditingController txtC2 = new TextEditingController();

  TextEditingController txtRPM3 = new TextEditingController();
  TextEditingController txtL3 = new TextEditingController();
  TextEditingController txtRP3 = new TextEditingController();
  TextEditingController txtM3 = new TextEditingController();
  TextEditingController txtC3 = new TextEditingController();

  TextEditingController txtRPM4 = new TextEditingController();
  TextEditingController txtL4 = new TextEditingController();
  TextEditingController txtRP4 = new TextEditingController();
  TextEditingController txtM4 = new TextEditingController();
  TextEditingController txtC4 = new TextEditingController();

  TextEditingController txtFR = new TextEditingController();
  TextEditingController txtRR = new TextEditingController();
  FocusNode myFocusNode;
  bool focus = true;
  List<Map> gear1;
  List<Map> gear2;
  List<Map> gear3;
  List<Map> gear4;

  List<Map> myProducts = List.generate(12, (index) => {"id": index, "name": "Motor", "image": "motor${index.toString()}.png"}).toList();

  @override
  void initState() {
    // TODO: implement initState
    setFirstText();
    setFirstData();

    super.initState();
  }

  setFirstText() async {
    //เกียร์ 1
    setState(() {
      txtRPM1.text = "10,500";
      txtL1.text = "1.670";
      txtRP1.text = "3.350";
      txtM1.text = "12";
      txtC1.text = "37";
    });
    //เกียร์ 2
    setState(() {
      txtRPM2.text = "10,500";
      txtL2.text = "1.670";
      txtRP2.text = "3.350";
      txtM2.text = "12";
      txtC2.text = "37";
    });
    //เกียร์ 3
    setState(() {
      txtRPM3.text = "10,500";
      txtL3.text = "1.670";
      txtRP3.text = "3.350";
      txtM3.text = "12";
      txtC3.text = "37";
    });
    //เกียร์ 4
    setState(() {
      txtRPM4.text = "10,500";
      txtL4.text = "1.670";
      txtRP4.text = "3.350";
      txtM4.text = "12";
      txtC4.text = "37";
    });
  }

  setFirstData() async {
    gear1 = List.generate(1, (index) => {"RPM": txtRPM1.text, "L": txtL1.text, "RP": txtRP1.text, "M": txtM1.text, "C": txtC1.text}).toList();

    gear2 = List.generate(1, (index) => {"RPM": txtRPM2.text, "L": txtL2.text, "RP": txtRP2.text, "M": txtM2.text, "C": txtC2.text}).toList();

    gear3 = List.generate(1, (index) => {"RPM": txtRPM3.text, "L": txtL3.text, "RP": txtRP3.text, "M": txtM3.text, "C": txtC3.text}).toList();

    gear4 = List.generate(1, (index) => {"RPM": txtRPM4.text, "L": txtL4.text, "RP": txtRP4.text, "M": txtM4.text, "C": txtC4.text}).toList();
  }

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'GEAR W100',
          style: appStyle.getTextStyle('titleText'),
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
      body: SafeArea(
        child: SingleChildScrollView(
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
                buildHeadTable(context, appStyle),
                buildGear1(context, appStyle),
                buildGear2(context, appStyle),
                buildGear3(context, appStyle),
                buildGear4(context, appStyle),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(
                    right: 2,
                    left: 2,
                  ),
                  width: appStyle.getWidth100(),
                  child: Text(
                    '* คำอธิบาย มีทั้งหมด 4 เกียร์',
                    style: appStyle.getTextStyle('normalText'),
                  ),
                ),
                buildContent(context, appStyle),
                buildHeadProcess2(context,appStyle),
                buildHeadProcess3(context,appStyle),
              ],
            ), /* add child content here */
          ),
        ),
      ),
    );
  }

  Widget buildHeadTable(BuildContext context, AppStyle appStyle) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: 1, crossAxisSpacing: 1, mainAxisSpacing: 1),
        itemCount: 5,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(all: 0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                      child: Text(
                        index == 0
                            ? 'รอบ'
                            : index == 1
                                ? 'รอบยางหลัง'
                                : index == 2
                                    ? 'อัตราทดเกียร์'
                                    : index == 3
                                        ? 'M'
                                        : 'C',
                        style: appStyle.getTextStyle('normalText'),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(1))),
          );
        });
  }

  Widget buildGear1(BuildContext content, AppStyle appStyle) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: 1.4, crossAxisSpacing: 1, mainAxisSpacing: 1),
        itemCount: 5,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: appStyle.getHeight(percent: 6),
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
                    controller: index == 0
                        ? txtRPM1
                        : index == 1
                            ? txtL1
                            : index == 2
                                ? txtRP1
                                : index == 3
                                    ? txtM1
                                    : txtC1,
                    keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                    style: appStyle.getTextStyle('normalText'),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildGear2(BuildContext content, AppStyle appStyle) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: 1.4, crossAxisSpacing: 1, mainAxisSpacing: 1),
        itemCount: 5,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: appStyle.getHeight(percent: 6),
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
                    controller: index == 0
                        ? txtRPM2
                        : index == 1
                            ? txtL2
                            : index == 2
                                ? txtRP2
                                : index == 3
                                    ? txtM2
                                    : txtC2,
//                                controller: txtControllerInput1,
//                                autofocus: focus,
//                                focusNode: myFocusNode,
                    keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                    style: appStyle.getTextStyle('normalText'),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildGear3(BuildContext content, AppStyle appStyle) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: 1.4, crossAxisSpacing: 1, mainAxisSpacing: 1),
        itemCount: 5,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: appStyle.getHeight(percent: 6),
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
                    controller: index == 0
                        ? txtRPM3
                        : index == 1
                            ? txtL3
                            : index == 2
                                ? txtRP3
                                : index == 3
                                    ? txtM3
                                    : txtC3,
//                                controller: txtControllerInput1,
//                                autofocus: focus,
//                                focusNode: myFocusNode,
                    keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                    style: appStyle.getTextStyle('normalText'),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildGear4(BuildContext content, AppStyle appStyle) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: 1.4, crossAxisSpacing: 1, mainAxisSpacing: 1),
        itemCount: 5,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: appStyle.getHeight(percent: 6),
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
                    controller: index == 0
                        ? txtRPM4
                        : index == 1
                            ? txtL4
                            : index == 2
                                ? txtRP4
                                : index == 3
                                    ? txtM4
                                    : txtC4,
//                                controller: txtControllerInput1,
//                                autofocus: focus,
//                                focusNode: myFocusNode,
                    keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                    style: appStyle.getTextStyle('normalText'),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildContent(BuildContext context, AppStyle appStyle) {
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
                        TextSpan(text: 'สเตอร์หน้า', style: appStyle.getTextStyle('normalText')),
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
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(text: 'สเตอร์หลัง', style: appStyle.getTextStyle('normalText')),
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
                          margin: appStyle.getEdgeInsetsFromRatio(left: 2, right: 2,),
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
                            controller: txtRR,
//                                autofocus: focus,
//                                focusNode: myFocusNode,
                            keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: RaisedButton(

              onPressed: () {
              },
              child: Text(
                'คำนวณ',
                style: appStyle.getTextStyle('normalText'),
              ),
              color: AppTheme.colorCard,
            ),
          ),
        ],
      ),
    );
  }


  Widget buildHeadProcess(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(top: 2,left: 5),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 3, crossAxisSpacing: 9, mainAxisSpacing: 1),
          itemCount: 2,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          index == 0
                              ? 'เกียร์'
                              : 'MAX Speed',
                          style: appStyle.getTextStyle('normalBlack'),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5))),
            );
          }),
    );
  }
  Widget buildProcessGear1(BuildContext context, AppStyle appStyle){
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 5,bottom: 0.5),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 3, crossAxisSpacing: 9, mainAxisSpacing: 1),
          itemCount: 2,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          index == 0
                              ? '1'
                              : '50',
                          style: appStyle.getTextStyle('normalText'),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5))),
            );
          }),
    );
  }
  Widget buildProcessGear2(BuildContext context, AppStyle appStyle){
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 5,bottom: 0.5),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 3, crossAxisSpacing: 9, mainAxisSpacing: 1),
          itemCount: 2,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          index == 0
                              ? '2'
                              : '60',
                          style: appStyle.getTextStyle('normalBlack'),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5))),
            );
          }),
    );
  }
  Widget buildProcessGear3(BuildContext context, AppStyle appStyle){
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 5,bottom: 1),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 3, crossAxisSpacing: 9, mainAxisSpacing: 1),
          itemCount: 2,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          index == 0
                              ? '3'
                              : '70',
                          style: appStyle.getTextStyle('normalText'),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5))),
            );
          }),
    );
  }
  Widget buildProcessGear4(BuildContext context, AppStyle appStyle){
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 5,bottom: 1),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 3, crossAxisSpacing: 9, mainAxisSpacing: 1),
          itemCount: 2,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          index == 0
                              ? '4'
                              : '80',
                          style: appStyle.getTextStyle('normalBlack'),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5))),
            );
          }),
    );
  }


  Widget buildHeadProcess2(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(top: 2,left: 5,),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 2, crossAxisSpacing: 5, mainAxisSpacing: 1),
          itemCount: 4,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('gear ${index+1}',
                          style: appStyle.getTextStyle('normalBlack'),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5))),
            );
          }),
    );
  }

  Widget buildHeadProcess3(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(top: 0.5,left: 5,bottom: 25),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 2, crossAxisSpacing: 5, mainAxisSpacing: 1),
          itemCount: 4,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('${(index+1)*50}',
                          style: appStyle.getTextStyle('normalBlack'),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5))),
            );
          }),
    );
  }





}
