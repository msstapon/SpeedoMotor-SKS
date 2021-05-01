import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/pages/bar_chart/samples/bar_chart_sample2.dart';
import "package:intl/intl.dart";
import '../../config/app.style.config.dart';
import '../../config/app.style.config.dart';
import '../../config/app.style.config.dart';

class CalculatorGearPage extends StatefulWidget {
  final String input1;
  final String input2;
  final String cc;
  final String peroid;
  final String nameCar;

  CalculatorGearPage({Key key, @required this.input1, @required this.input2, @required this.cc, @required this.peroid, this.nameCar})
      : super(key: key);

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
  TextEditingController txtCM1 = new TextEditingController();
  TextEditingController txtDiff1 = new TextEditingController();

  TextEditingController txtRPM2 = new TextEditingController();
  TextEditingController txtL2 = new TextEditingController();
  TextEditingController txtRP2 = new TextEditingController();
  TextEditingController txtM2 = new TextEditingController();
  TextEditingController txtC2 = new TextEditingController();
  TextEditingController txtCM2 = new TextEditingController();
  TextEditingController txtDiff2 = new TextEditingController();

  TextEditingController txtRPM3 = new TextEditingController();
  TextEditingController txtL3 = new TextEditingController();
  TextEditingController txtRP3 = new TextEditingController();
  TextEditingController txtM3 = new TextEditingController();
  TextEditingController txtC3 = new TextEditingController();
  TextEditingController txtCM3 = new TextEditingController();
  TextEditingController txtDiff3 = new TextEditingController();

  TextEditingController txtRPM4 = new TextEditingController();
  TextEditingController txtL4 = new TextEditingController();
  TextEditingController txtRP4 = new TextEditingController();
  TextEditingController txtM4 = new TextEditingController();
  TextEditingController txtC4 = new TextEditingController();
  TextEditingController txtCM4 = new TextEditingController();
  TextEditingController txtDiff4 = new TextEditingController();

  TextEditingController txtRPM5 = new TextEditingController();
  TextEditingController txtL5 = new TextEditingController();
  TextEditingController txtRP5 = new TextEditingController();
  TextEditingController txtM5 = new TextEditingController();
  TextEditingController txtC5 = new TextEditingController();
  TextEditingController txtCM5 = new TextEditingController();
  TextEditingController txtDiff5 = new TextEditingController();

  TextEditingController txtDiff0 = new TextEditingController();

  TextEditingController txtFR = new TextEditingController();
  TextEditingController txtRR = new TextEditingController();
  FocusNode myFocusNode;
  bool focus = true;
  List<Map> gear1;
  List<Map> gear2;
  List<Map> gear3;
  List<Map> gear4;
  List<Map> gear5;

  List<Map> myProducts = List.generate(12, (index) => {"id": index, "name": "Motor", "image": "motor${index.toString()}.png"}).toList();
  double answerGear1;
  double answerGear2;
  double answerGear3;
  double answerGear4;

  TextEditingController txtL = new TextEditingController();
  TextEditingController txtRP = new TextEditingController();
  TextEditingController txtRP0 = new TextEditingController();

  List<String> answerAll = ["0", "0", "0", "0"];
  final formatter = new NumberFormat("#,###.00");
  bool checkGear = false;
  int countGear = 4;

  @override
  void initState() {
    // TODO: implement initState
    setFirstText();
    setFirstData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      calculatorFirst();
    });
    super.initState();
  }

  calculatorFirst() async {
    await calculatorGear1();
    await calculatorGear2();
    await calculatorGear3();
    await calculatorGear4();
    await calculatorGear5();
    await calculatorDiff();
  }

  setFirstText() async {
    //เกียร์ 1
    String rom;
    var C1;
    var C2;
    var C3;
    var C4;
    var C5;
    var M1;
    var M2;
    var M3;
    var M4;
    var M5;
    print('${widget.nameCar}');
    if (widget.nameCar == 'W110i') {
      rom = '10000';
      C1 = 34;
      C2 = 28;
      C3 = 25;
      C4 = 22;
      C5 = 22;

      M1 = 13;
      M2 = 18;
      M3 = 22;
      M4 = 23;
      M5 = 24;
      setState(() {
        txtRP.text = "69";
        txtRP0.text = "17";
      });
    } else if (widget.nameCar == 'Sonic') {
      rom = '10500';

      C1 = 37;
      C2 = 32;
      C3 = 25;
      C4 = 23;
      C5 = 24;

      M1 = 12;
      M2 = 17;
      M3 = 18;
      M4 = 21;
      M5 = 26;
      setState(() {
        checkGear = true;
        countGear = 5;
        answerAll.add('0');
        txtRP.text = "67";
        txtRP0.text = "20";
      });
    } else {
      rom = '9300';
      C1 = 35;
      C2 = 31;
      C3 = 23;
      C4 = 24;
      C5 = 22;

      M1 = 14;
      M2 = 20;
      M3 = 20;
      M4 = 26;
      M5 = 24;

      setState(() {
        txtRP.text = "67";
        txtRP0.text = "20";
      });
    }
    setState(() {
      txtRPM1.text = rom;
      txtL1.text = "1.670";
      txtRP1.text = "3.350";
      txtM1.text = M1.toString();
      txtC1.text = C1.toString();
      txtCM1.text = (C1 / M1).toStringAsFixed(3).toString();
      txtDiff1.text = '-';
    });
    //เกียร์ 2
    setState(() {
      txtRPM2.text = rom;
      txtL2.text = "1.670";
      txtRP2.text = "3.350";
      txtM2.text = M2.toString();
      txtC2.text = C2.toString();
      txtCM2.text = (C2 / M2).toStringAsFixed(3).toString();
      txtDiff2.text = '-';
    });
    //เกียร์ 3
    setState(() {
      txtRPM3.text = rom;
      txtL3.text = "1.670";
      txtRP3.text = "3.350";
      txtM3.text = M3.toString();
      txtC3.text = C3.toString();
      txtCM3.text = (C3 / M3).toStringAsFixed(3).toString();
      txtDiff3.text = '-';
    });
    //เกียร์ 4
    setState(() {
      txtRPM4.text = rom;
      txtL4.text = "1.670";
      txtRP4.text = "3.350";
      txtM4.text = M4.toString();
      txtC4.text = C4.toString();
      txtCM4.text = (C4 / M4).toStringAsFixed(3).toString();
      txtDiff4.text = '-';
    });
//เกียร์ 5
    setState(() {
      txtRPM5.text = rom;
      txtL5.text = "1.670";
      txtRP5.text = "3.350";
      txtM5.text = M5.toString();
      txtC5.text = C5.toString();
      txtCM5.text = (C5 / M5).toStringAsFixed(3).toString();
      txtDiff5.text = '-';
    });

    setState(() {
      txtL.text = "1.670";
      txtFR.text = "14";
      txtRR.text = '25';
      txtDiff0.text = '0.00';
    });
  }

  setFirstData() async {
    gear1 = List.generate(1, (index) => {"RPM": txtRPM1.text, "L": txtL1.text, "RP": txtRP1.text, "M": txtM1.text, "C": txtC1.text}).toList();

    gear2 = List.generate(1, (index) => {"RPM": txtRPM2.text, "L": txtL2.text, "RP": txtRP2.text, "M": txtM2.text, "C": txtC2.text}).toList();

    gear3 = List.generate(1, (index) => {"RPM": txtRPM3.text, "L": txtL3.text, "RP": txtRP3.text, "M": txtM3.text, "C": txtC3.text}).toList();

    gear4 = List.generate(1, (index) => {"RPM": txtRPM4.text, "L": txtL4.text, "RP": txtRP4.text, "M": txtM4.text, "C": txtC4.text}).toList();

    gear5 = List.generate(1, (index) => {"RPM": txtRPM5.text, "L": txtL5.text, "RP": txtRP5.text, "M": txtM5.text, "C": txtC5.text}).toList();

//    answerAll = List.generate(1, (index) => {"RPM": txtRPM4.text, "L": txtL4.text, "RP": txtRP4.text, "M": txtM4.text, "C": txtC4.text}).toList();
  }

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
      backgroundColor: AppTheme.colorBlack.withOpacity(0.95),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/images/collection_motor/new_icon/sks-page-06-84.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: (){
                          Navigator.pop(context);
                      },
                      child: new Container(
                        margin: appStyle.getEdgeInsetsFromRatio(top: 4,left: 5),
                        height: appStyle.getHeight(percent: 7),
                        width: appStyle.getWidth(percent: 10),
                        child: new Image.asset(
                          'lib/images/collection_motor/new_icon/sks-page-07-117.png',
                        ),
                      )
                  ),
                  new Container(
                    margin: appStyle.getEdgeInsetsFromRatio(top: 4,bottom: 1,right: 2,left: 1,),
                    decoration: BoxDecoration(
                      color: AppTheme.colorBlack,
                      borderRadius: BorderRadius.all(Radius.circular(15.0) //                 <--- border radius here
                      ),
                      border: Border.all(
                        color: AppTheme.colorGrey,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        buildHeadTable(context, appStyle),
                        buildGear1(context, appStyle),
                        buildGear2(context, appStyle),
                        buildGear3(context, appStyle),
                        buildGear4(context, appStyle),
                      ],
                    ),
                  ),
                  checkGear ? buildGear5(context, appStyle) : new Container(),
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(
                      right: 2,
                      left: 2,
                    ),
                    width: appStyle.getWidth100(),
                    child: Text(
                      '* คำอธิบาย ตารางคือ  ${countGear} เกียร์ นับจาก บนลงล่าง\n* DIFF คือ ระยะห่างระหว่างเกียร์',
                      style: appStyle.getTextStyle('normalText'),
                    ),
                  ),
                  new Container(
                    margin: appStyle.getEdgeInsetsFromRatio(left: 1, right: 2),
                    padding: appStyle.getEdgeInsetsFromRatio(top: 1, bottom: 2),
                    decoration: BoxDecoration(
                      color: AppTheme.colorBlack,
                      borderRadius: BorderRadius.all(Radius.circular(15.0) //                 <--- border radius here
                      ),
                      border: Border.all(
                        color: AppTheme.colorGrey,
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        buildLRP(context, appStyle),
                        buildContent(context, appStyle),
                      ],
                    ),
                  ),
                  buildHeadProcess2(context, appStyle),
                  buildHeadProcess3(context, appStyle),
                ],
              ),
            ),
          ), /* add child content here */
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 60,
                        child: Container(
                          alignment: Alignment.center,
                          margin: appStyle.getEdgeInsetsFromRatio(left: 1,),
                          child: Text(
                            index == 0
                                ? 'รอบ'
                                : index == 1
                                    ? 'เฟื่องขับ'
                                    : index == 2
                                        ? 'เฟื่องตาม'
                                        : index == 3
                                            ? 'อัตราทดเกียร์'
                                            : 'DIFF',
                            style: appStyle.getTextStyle('normalText'),
                          ),
                        ),
                      ),
                      index != 4
                          ? Expanded(
                              flex: 1,
                              child: Container(
                                height: appStyle.getHeight(percent: 6),
                                color: AppTheme.colorBackgroundWhite,
                              ),
                            )
                          : new Container(
                              width: 0.0,
                              height: 0.0,
                            )
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
//                color: Colors.black,
//                borderRadius: BorderRadius.circular(15),
                border: Border(
                  bottom: BorderSide(
                    //                   <--- left side
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
            ),
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
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: Container(
                        height: appStyle.getHeight(percent: 6),
                        child: TextFormField(
                          onChanged: (value) {
                            if (index != 0) {
                              changC(index, value);
                            }
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
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(4.0),
                              borderSide: new BorderSide(
                                color: AppTheme.colorBackgroundWhite,
                                width: appStyle.getWidth(percent: 0.25),
                              ),
                            ),
//                      enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                        borderSide: BorderSide(color: AppTheme.colorRed, width: appStyle.getWidth(percent: 0.25)),
//                      ),
                          ),
                          controller: index == 0
                              ? txtRPM1
                              : index == 1
                                  ? txtM1
                                  : index == 2
                                      ? txtC1
                                      : index == 3
                                          ? txtCM1
                                          : txtDiff0,
                          keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                          style: appStyle.getTextStyle('smallGrey'),
                        ),
                      ),
                    ),
                    index != 4
                        ? Expanded(
                            flex: 1,
                            child: Container(
                              height: appStyle.getHeight(percent: 5),
                              color: AppTheme.colorGrey,
                            ),
                          )
                        : new Container(
                            width: 0.0,
                            height: 0.0,
                          )
                  ],
                ),
                Divider(height: 1, color: AppTheme.colorGrey)
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
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: Container(
                        height: appStyle.getHeight(percent: 6),
                        child: TextFormField(
                          onChanged: (value) {
                            if (index != 0) {
                              changC(index, value);
                            }
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
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(4.0),
                              borderSide: new BorderSide(
                                color: AppTheme.colorBackgroundWhite,
                                width: appStyle.getWidth(percent: 0.25),
                              ),
                            ),
//                      enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                        borderSide: BorderSide(color: AppTheme.colorRed, width: appStyle.getWidth(percent: 0.25)),
//                      ),
                          ),
                          controller: index == 0
                              ? txtRPM2
                              : index == 1
                                  ? txtM2
                                  : index == 2
                                      ? txtC2
                                      : index == 3
                                          ? txtCM2
                                          : txtDiff1,
                          keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                          style: appStyle.getTextStyle('smallGrey'),
                        ),
                      ),
                    ),
                    index != 4
                        ? Expanded(
                            flex: 1,
                            child: Container(
                              height: appStyle.getHeight(percent: 5),
                              color: AppTheme.colorGrey,
                            ),
                          )
                        : new Container(
                            width: 0.0,
                            height: 0.0,
                          )
                  ],
                ),
                Divider(height: 1, color: AppTheme.colorGrey)
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
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: Container(
                        height: appStyle.getHeight(percent: 6),
                        child: TextFormField(
                          onChanged: (value) {
                            if (index != 0) {
                              changC(index, value);
                            }
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
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(4.0),
                              borderSide: new BorderSide(
                                color: AppTheme.colorBackgroundWhite,
                                width: appStyle.getWidth(percent: 0.25),
                              ),
                            ),
//                      enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                        borderSide: BorderSide(color: AppTheme.colorRed, width: appStyle.getWidth(percent: 0.25)),
//                      ),
                          ),
                          controller: index == 0
                              ? txtRPM3
                              : index == 1
                                  ? txtM3
                                  : index == 2
                                      ? txtC3
                                      : index == 3
                                          ? txtCM3
                                          : txtDiff2,
                          keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                          style: appStyle.getTextStyle('smallGrey'),
                        ),
                      ),
                    ),
                    index != 4
                        ? Expanded(
                            flex: 1,
                            child: Container(
                              height: appStyle.getHeight(percent: 5),
                              color: AppTheme.colorGrey,
                            ),
                          )
                        : new Container(
                            width: 0.0,
                            height: 0.0,
                          )
                  ],
                ),
                Divider(height: 1, color: AppTheme.colorGrey)
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
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: Container(
                        height: appStyle.getHeight(percent: 6),
                        child: TextFormField(
                          onChanged: (value) {
                            if (index != 0) {
                              changC(index, value);
                            }
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
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(4.0),
                              borderSide: new BorderSide(
                                color: AppTheme.colorBackgroundWhite,
                                width: appStyle.getWidth(percent: 0.25),
                              ),
                            ),
//                      enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                        borderSide: BorderSide(color: AppTheme.colorRed, width: appStyle.getWidth(percent: 0.25)),
//                      ),
                          ),
                          controller: index == 0
                              ? txtRPM4
                              : index == 1
                                  ? txtM4
                                  : index == 2
                                      ? txtC4
                                      : index == 3
                                          ? txtCM4
                                          : txtDiff3,
                          keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                          style: appStyle.getTextStyle('smallGrey'),
                        ),
                      ),
                    ),
                    index != 4
                        ? Expanded(
                            flex: 1,
                            child: Container(
                              height: appStyle.getHeight(percent: 6),
                              color: AppTheme.colorGrey,
                            ),
                          )
                        : new Container(
                            width: 0.0,
                            height: 0.0,
                          )
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget buildGear5(BuildContext content, AppStyle appStyle) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: 1.4, crossAxisSpacing: 1, mainAxisSpacing: 1),
        itemCount: 5,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: Container(
                        height: appStyle.getHeight(percent: 6),
                        child: TextFormField(
                          onChanged: (value) {
                            if (index != 0) {
                              changC(index, value);
                            }
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
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(4.0),
                              borderSide: new BorderSide(
                                color: AppTheme.colorBackgroundWhite,
                                width: appStyle.getWidth(percent: 0.25),
                              ),
                            ),
//                      enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                        borderSide: BorderSide(color: AppTheme.colorRed, width: appStyle.getWidth(percent: 0.25)),
//                      ),
                          ),
                          controller: index == 0
                              ? txtRPM5
                              : index == 1
                                  ? txtM5
                                  : index == 2
                                      ? txtC5
                                      : index == 3
                                          ? txtCM5
                                          : txtDiff4,
                          keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                          style: appStyle.getTextStyle('smallGrey'),
                        ),
                      ),
                    ),
                    index != 4
                        ? Expanded(
                            flex: 1,
                            child: Container(
                              height: appStyle.getHeight(percent: 6),
                              color: AppTheme.colorGrey,
                            ),
                          )
                        : new Container(
                            width: 0.0,
                            height: 0.0,
                          )
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget buildContent(BuildContext context, AppStyle appStyle) {
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
                              labelStyle: appStyle.getTextStyle('smallGrey'),
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
                          margin: appStyle.getEdgeInsetsFromRatio(
                            left: 2,
                            right: 2,
                          ),
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
                              labelStyle: appStyle.getTextStyle('smallGrey'),
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
                            controller: txtRR,
//                                autofocus: focus,
//                                focusNode: myFocusNode,
                            keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                            style: appStyle.getTextStyle('smallGrey'),
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
            child: Container(
              height: appStyle.getHeight(percent: 6),
              child: FlatButton(
                color: AppTheme.colorRed,
                textColor: AppTheme.colorBackgroundWhite,
                child: new Text(
                  'คำนวณ ',
                  style: appStyle.getTextStyle('normalText'),
                ),
                onPressed: () async {
                  await calculatorGear1();
                  await calculatorGear2();
                  await calculatorGear3();
                  await calculatorGear4();
                  await calculatorGear5();
                  await calculatorDiff();
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLRP(BuildContext context, AppStyle appStyle) {
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
                        TextSpan(text: 'รอบยางหลัง', style: appStyle.getTextStyle('normalText')),
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
                              labelStyle: appStyle.getTextStyle('smallGrey'),
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
                            controller: txtL,
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
                        TextSpan(text: 'อัตราทดคลัทช์', style: appStyle.getTextStyle('normalText')),
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
                          margin: appStyle.getEdgeInsetsFromRatio(
                            left: 2,
                            right: 2,
                          ),
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
                              labelStyle: appStyle.getTextStyle('smallGrey'),
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
                            controller: txtRP,
//                                autofocus: focus,
//                                focusNode: myFocusNode,
                            keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                            style: appStyle.getTextStyle('smallGrey'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(text: 'X', style: appStyle.getTextStyle('normalText')),
              ]),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: appStyle.getHeight(percent: 6),
                          margin: appStyle.getEdgeInsetsFromRatio(
                            left: 2,
                            right: 2,
                          ),
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
                              labelStyle: appStyle.getTextStyle('smallGrey'),
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
                            controller: txtRP0,
//                                autofocus: focus,
//                                focusNode: myFocusNode,
                            keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                            style: appStyle.getTextStyle('smallGrey'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildHeadProcess(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(top: 2, left: 5),
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
                          index == 0 ? 'เกียร์' : 'MAX Speed',
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

  Widget buildProcessGear1(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 5, bottom: 0.5),
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
                          index == 0 ? '1' : '50',
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

  Widget buildProcessGear2(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 5, bottom: 0.5),
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
                          index == 0 ? '2' : '60',
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

  Widget buildProcessGear3(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 5, bottom: 1),
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
                          index == 0 ? '3' : '70',
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

  Widget buildProcessGear4(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 5, bottom: 1),
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
                          index == 0 ? '4' : '80',
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
      margin: appStyle.getEdgeInsetsFromRatio(
        top: 2,
        left: 2,
        right: 2

      ),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: countGear, childAspectRatio: 2, crossAxisSpacing: 5, mainAxisSpacing: 1),
          itemCount: countGear,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Gear ${index + 1}',
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
      margin: appStyle.getEdgeInsetsFromRatio(top: 0.5, left: 2,right: 2,bottom: 1),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: countGear, childAspectRatio: 2, crossAxisSpacing: 5, mainAxisSpacing: 1),
          itemCount: answerAll.length,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        '${answerAll[index]}',
                        style: appStyle.getTextStyle('normalText'),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
              ),
            );
          }),
    );
  }

  calculatorGear1() async {
    FocusScope.of(context).requestFocus(FocusNode());
    double tempRpm1 = double.parse(txtRPM1.text); //TODO รอบ
    var tempL1 = double.parse(txtL.text); //TODO รอบยางหลัง
    var tempRp1 = double.parse(txtRP.text) / double.parse(txtRP0.text); //TODO อัตราทดเกียร์
    var tempM1 = double.parse(txtM1.text); //TODO M
    var tempC1 = double.parse(txtC1.text); //TODO C
    var tempFR = double.parse(txtFR.text); //TODO FR
    var tempRR = double.parse(txtRR.text);
    var equation1 = (tempRpm1 * 60) / 1000;
    var equation2 = equation1 * tempL1;

    var equation3 = tempC1 / tempM1;

    var equation4 = tempRR / tempFR;

    var equation5 = tempRp1 * equation3 * equation4;

    var equation6 = equation2 / equation5;

    print('Gear1 =>');
    setState(() {
//      answerGear1 = equation6;
      answerAll[0] = equation6.toStringAsFixed(3);
    });
  }

  calculatorGear2() async {
    FocusScope.of(context).requestFocus(FocusNode());
    double tempRpm1 = double.parse(txtRPM2.text); //TODO รอบ
    var tempL1 = double.parse(txtL.text); //TODO รอบยางหลัง
    var tempRp1 = double.parse(txtRP.text) / double.parse(txtRP0.text); //TODO อัตราทดเกียร์
    var tempM1 = double.parse(txtM2.text); //TODO M
    var tempC1 = double.parse(txtC2.text); //TODO C
    var tempFR = double.parse(txtFR.text); //TODO FR
    var tempRR = double.parse(txtRR.text);
    var equation1 = (tempRpm1 * 60) / 1000;
    var equation2 = equation1 * tempL1;

    var equation3 = tempC1 / tempM1;

    var equation4 = tempRR / tempFR;

    var equation5 = tempRp1 * equation3 * equation4;

    var equation6 = equation2 / equation5;

    print('Gear1 =>');
    setState(() {
      answerAll[1] = equation6.toStringAsFixed(3);
    });
  }

  calculatorGear3() async {
    FocusScope.of(context).requestFocus(FocusNode());
    double tempRpm1 = double.parse(txtRPM3.text); //TODO รอบ
    var tempL1 = double.parse(txtL.text); //TODO รอบยางหลัง
    var tempRp1 = double.parse(txtRP.text) / double.parse(txtRP0.text); //TODO อัตราทดเกียร์
    var tempM1 = double.parse(txtM3.text); //TODO M
    var tempC1 = double.parse(txtC3.text); //TODO C
    var tempFR = double.parse(txtFR.text); //TODO FR
    var tempRR = double.parse(txtRR.text);
    var equation1 = (tempRpm1 * 60) / 1000;
    var equation2 = equation1 * tempL1;

    var equation3 = tempC1 / tempM1;

    var equation4 = tempRR / tempFR;

    var equation5 = tempRp1 * equation3 * equation4;

    var equation6 = equation2 / equation5;

    print('Gear1 =>');
    setState(() {
      answerAll[2] = equation6.toStringAsFixed(3);
    });
  }

  calculatorGear4() async {
    FocusScope.of(context).requestFocus(FocusNode());
    double tempRpm1 = double.parse(txtRPM4.text); //TODO รอบ
    var tempL1 = double.parse(txtL.text); //TODO รอบยางหลัง
    var tempRp1 = double.parse(txtRP.text) / double.parse(txtRP0.text); //TODO อัตราทดเกียร์
    var tempM1 = double.parse(txtM4.text); //TODO M
    var tempC1 = double.parse(txtC4.text); //TODO C
    var tempFR = double.parse(txtFR.text); //TODO FR
    var tempRR = double.parse(txtRR.text);
    var equation1 = (tempRpm1 * 60) / 1000;
    var equation2 = equation1 * tempL1;

    var equation3 = tempC1 / tempM1;

    var equation4 = tempRR / tempFR;

    var equation5 = tempRp1 * equation3 * equation4;

    var equation6 = equation2 / equation5;

    print('Gear1 =>${tempRpm1}');
    setState(() {
      answerAll[3] = equation6.toStringAsFixed(3);
    });
  }

  calculatorGear5() async {
    FocusScope.of(context).requestFocus(FocusNode());
    double tempRpm1 = double.parse(txtRPM5.text); //TODO รอบ
    var tempL1 = double.parse(txtL.text); //TODO รอบยางหลัง
    var tempRp1 = double.parse(txtRP.text) / double.parse(txtRP0.text); //TODO อัราทดเกียร์
    var tempM1 = double.parse(txtM5.text); //TODO M
    var tempC1 = double.parse(txtC5.text); //TODO C
    var tempFR = double.parse(txtFR.text); //TODO FR
    var tempRR = double.parse(txtRR.text);
    var equation1 = (tempRpm1 * 60) / 1000;
    var equation2 = equation1 * tempL1;

    var equation3 = tempC1 / tempM1;

    var equation4 = tempRR / tempFR;

    var equation5 = tempRp1 * equation3 * equation4;

    var equation6 = equation2 / equation5;

    print('Gear1 =>');
    if (countGear == 5) {
      setState(() {
        answerAll[4] = equation6.toStringAsFixed(3);
      });
    }
  }

  calculatorDiff() async {
    var diff1 = double.parse(answerAll[1]) - double.parse(answerAll[0]);
    var diff2 = double.parse(answerAll[2]) - double.parse(answerAll[1]);
    var diff3 = double.parse(answerAll[3]) - double.parse(answerAll[2]);
    var diff4;
    if (countGear == 5) {
      diff4 = double.parse(answerAll[4]) - double.parse(answerAll[3]);
      setState(() {
        txtDiff4.text = diff4.toStringAsFixed(2);
      });
    }
    setState(() {
      txtDiff1.text = diff1.toStringAsFixed(2);
      txtDiff2.text = diff2.toStringAsFixed(2);
      txtDiff3.text = diff3.toStringAsFixed(2);
    });
  }

  changC(int index, value) {
    print(index);
    print(value);
    var C;
    if (value != "") {
      if (index == 1) {
        C = double.parse(txtC1.text) / double.parse(value);
      } else {
        C = double.parse(value) / double.parse(txtM1.text);
      }
      setState(() {
        txtCM1.text = C.toStringAsFixed(3).toString();
      });
    }
  }

  changC2(int index, value) {
    print(index);
    print(value);
    var C;
    if (value != "") {
      if (index == 1) {
        C = double.parse(txtC2.text) / double.parse(value);
      } else {
        C = double.parse(value) / double.parse(txtM2.text);
      }
      setState(() {
        txtCM2.text = C.toStringAsFixed(3).toString();
      });
    }
  }

  changC3(int index, value) {
    print(index);
    print(value);
    var C;
    if (value != "") {
      if (index == 1) {
        C = double.parse(txtC3.text) / double.parse(value);
      } else {
        C = double.parse(value) / double.parse(txtM3.text);
      }
      setState(() {
        txtCM3.text = C.toStringAsFixed(3).toString();
      });
    }
  }

  changC4(int index, value) {
    print(index);
    print(value);
    var C;
    if (value != "") {
      if (index == 1) {
        C = double.parse(txtC4.text) / double.parse(value);
      } else {
        C = double.parse(value) / double.parse(txtM4.text);
      }
      setState(() {
        txtCM4.text = C.toStringAsFixed(3).toString();
      });
    }
  }

  changC5(int index, value) {
    print(index);
    print(value);
    var C;
    if (value != "") {
      if (index == 1) {
        C = double.parse(txtC5.text) / double.parse(value);
      } else {
        C = double.parse(value) / double.parse(txtM5.text);
      }
      setState(() {
        txtCM5.text = C.toStringAsFixed(3).toString();
      });
    }
  }
}
