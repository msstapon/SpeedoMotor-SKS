import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:th.go.sks.racing_2/widgets/other/loading.widget.dart';
import 'package:flutter/services.dart';
import "package:intl/intl.dart";

class CamshaftPage extends StatefulWidget {
  CamshaftPageState createState() => CamshaftPageState();
}

class CamshaftPageState extends State<CamshaftPage> {
  bool isProcess = false;
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController txtInput1 = new TextEditingController();
  TextEditingController txtInput2 = new TextEditingController();
  TextEditingController txtInput3 = new TextEditingController();
  TextEditingController txtInput4 = new TextEditingController();

  String answer1 = '0.00';
  String answer2   = '0.00';
  String answer3  = '0.00';
  String answer4  = '0.00';
  String answer5  = '0.00';
  String answer6  = '0.00';
  String answer7  = '0.00';
  final formatter = new NumberFormat("####.00");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          'วัดองศาแคม',
//          style: appStyle.getTextStyle('titleText'),
//          // style: appStyle.getTextStyle('titleText'),
//        ),
//        centerTitle: true,
//        backgroundColor: AppTheme.colorPrimaryDark,
//        actions: [
//          Container(
//            child: Image.asset(
//              'lib/images/collection_motor/logo.png',
//              width: appStyle.getWidth(percent: 30),
//              fit: BoxFit.fitWidth,
//            ),
//          ),
//        ],
//      ),
      backgroundColor: AppTheme.colorBlack.withOpacity(0.95),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/images/collection_motor/new_icon/sks-page-03-42.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // profile, change pin , logout
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
    return Form(
      key: _formKey,
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(right: 5, left: 5, top: 18.5),
        child: Column(
          children: [
            buildInputIntake(context, appStyle),
            buildInputExhaust(context, appStyle),
            Container(
              width: appStyle.getWidth100(),
              height: appStyle.getHeight(percent: 6),
              child: RaisedButton(
                onPressed: () {
                  calculatorCam();
                },
                child: Text(
                  'คำนวณ',
                  style: appStyle.getTextStyle('normalText'),
                ),
                color: AppTheme.colorCard,
              ),
            ),
            Container(
//                color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: appStyle.getHeight(percent: 3),),
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(bottom: 1,top: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Intake Ducation',
                              style: appStyle.getTextStyle('normalText'),
                            ),
                            Container(
                              width : appStyle.getWidth(percent: 28),
                              height: appStyle.getHeight(percent: 10),
                              decoration: BoxDecoration(
                                color: AppTheme.colorBlack,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0) //                 <--- border radius here
                                ),
                                border: Border.all(color : Colors.white, width: 0.5,),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${answer1.toString()}',
                                    style: appStyle.getTextStyle('smallGrey'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Exhaust Duration',
                              style: appStyle.getTextStyle('normalText'),
                            ),
                            Container(
                              width : appStyle.getWidth(percent: 28),
                              height: appStyle.getHeight(percent: 10),
                              decoration: BoxDecoration(
                                color: AppTheme.colorBlack,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0) //                 <--- border radius here
                                ),
                                border: Border.all(color : Colors.white, width: 0.5,),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${answer2.toString()}',
                                    style: appStyle.getTextStyle('smallGrey'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Total Duration',
                              style: appStyle.getTextStyle('normalText'),
                            ),
                            Container(
                              width : appStyle.getWidth(percent: 28),
                              height: appStyle.getHeight(percent: 10),
                              decoration: BoxDecoration(
                                color: AppTheme.colorBlack,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0) //                 <--- border radius here
                                ),
                                border: Border.all(color : Colors.white, width: 0.5,),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${answer3.toString()}',
                                    style: appStyle.getTextStyle('smallGrey'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Lobe-Separation Angle',
                              style: appStyle.getTextStyle('normalText'),
                            ),
                            Container(
                              width : appStyle.getWidth(percent: 44),
                              height: appStyle.getHeight(percent: 6),
                              decoration: BoxDecoration(
                                color: AppTheme.colorBlack,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0) //                 <--- border radius here
                                ),
                                border: Border.all(color : Colors.white, width: 0.5,),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                                    child: Text(
                                      '${answer4.toString()}',
                                      style: appStyle.getTextStyle('smallGrey'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(width: appStyle.getWidth(percent: 2),),
                        Column(
                          children: [
                            Text(
                              'Camshaft${"'"}s Overlapping',
                              style: appStyle.getTextStyle('normalText'),
                            ),
                            Container(
                              width : appStyle.getWidth(percent: 44),
                              height: appStyle.getHeight(percent: 6),
                              decoration: BoxDecoration(
                                color: AppTheme.colorBlack,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0) //                 <--- border radius here
                                ),
                                border: Border.all(color : Colors.white, width: 0.5,),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                                    child: Text(
                                      '${answer5.toString()}',
                                      style: appStyle.getTextStyle('smallGrey'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(bottom: 16,top: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Intake Lode Center',
                              style: appStyle.getTextStyle('normalText'),
                            ),
                            Container(
                              width : appStyle.getWidth(percent: 44),
                              height: appStyle.getHeight(percent: 6),
                              decoration: BoxDecoration(
                                color: AppTheme.colorBlack,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0) //                 <--- border radius here
                                ),
                                border: Border.all(color : Colors.white, width: 0.5,),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                                    child: Text(
                                      '${answer6.toString()}',
                                      style: appStyle.getTextStyle('smallGrey'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Exhaust Lode Center',
                              style: appStyle.getTextStyle('normalText'),
                            ),
                            Container(
                              width : appStyle.getWidth(percent: 44),
                              height: appStyle.getHeight(percent: 6),
                              decoration: BoxDecoration(
                                color: AppTheme.colorBlack,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0) //                 <--- border radius here
                                ),
                                border: Border.all(color : Colors.white, width: 0.5,),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                                    child: Text(
                                      '${answer7.toString()}',
                                      style: appStyle.getTextStyle('smallGrey'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            )


          ],
        ),
      ),
    );
  }

  Widget buildInputIntake(BuildContext context, AppStyle appStyle) {
    return  Container(
        height: appStyle.getHeight(percent: 19),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Container(
              alignment: Alignment.center,
              width: appStyle.getWidth100(),
              height: appStyle.getHeight(percent: 7),
              child: Text('Intake', style: appStyle.getTextStyle('titleText')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              TextSpan(text: 'ศูนย์ตายบน', style: appStyle.getTextStyle('smallGrey')),
                              TextSpan(text: ' *', style: appStyle.getTextStyle('smallGrey')),
                            ]),
                          ),
                        ),
                        Container(
                          child: Column(
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
                                      borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: appStyle.getWidth(percent: 0.25)),
                                    ),
                                  ),
                                   controller: txtInput1,
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
                              TextSpan(text: 'ศูนย์ตายล่าง', style: appStyle.getTextStyle('smallGrey')),
                              TextSpan(text: ' *', style: appStyle.getTextStyle('smallGrey')),
                            ]),
                          ),
                        ),
                        Container(
                          child: Column(
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
                                      borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: appStyle.getWidth(percent: 0.25)),
                                    ),
                                  ),
                                 controller: txtInput2,
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
          ],
        ),
    );

  }

  Widget buildInputExhaust(BuildContext context, AppStyle appStyle) {
    return Container(
      height: appStyle.getHeight(percent: 19),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Container(
            alignment: Alignment.center,
            width: appStyle.getWidth100(),
            height: appStyle.getHeight(percent: 7),
            child: Text('Exhaust', style: appStyle.getTextStyle('titleText')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            TextSpan(text: 'ศูนย์ตายบน', style: appStyle.getTextStyle('smallGrey')),
                            TextSpan(text: ' *', style: appStyle.getTextStyle('smallGrey')),
                          ]),
                        ),
                      ),
                      Container(
                        child: Column(
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
                                    borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: appStyle.getWidth(percent: 0.25)),
                                  ),
                                ),
                                          controller: txtInput3,
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
                            TextSpan(text: 'ศูนย์ตายล่าง', style: appStyle.getTextStyle('smallGrey')),
                            TextSpan(text: ' *', style: appStyle.getTextStyle('smallGrey')),
                          ]),
                        ),
                      ),
                      Container(
                        child: Column(
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
                                    borderSide: BorderSide(color: AppTheme.colorBackgroundWhite, width: appStyle.getWidth(percent: 0.25)),
                                  ),
                                ),
                                          controller: txtInput4,
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
        ],
      ),
    );

  }

  calculatorCam() async{
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      isProcess = true;
      txtInput1.text = txtInput1.text == "" ? '0.0' : txtInput1.text;
      txtInput2.text = txtInput2.text == "" ? '0.0' : txtInput2.text;
      txtInput3.text = txtInput3.text == "" ? '0.0' : txtInput3.text;
      txtInput4.text = txtInput4.text == "" ? '0.0' : txtInput4.text;
    });
    var a1 = double.parse(txtInput1.text) + double.parse(txtInput2.text) + 180;
    var a2 = double.parse(txtInput3.text) + double.parse(txtInput4.text) + 180;
    var a3 = (a1 + a2) /2;
    var a4 = (double.parse(txtInput1.text) - double.parse(txtInput2.text)) /2 + 90;
    var a5 = (double.parse(txtInput3.text) - double.parse(txtInput4.text)) /2 + 90;
    var a6 = (a4+a5) /2;
    var a7 =  double.parse(txtInput1.text)+double.parse(txtInput4.text);
    print(a1);
    print(a2);
    print(a3);
    print(a4);
    print(a5);
    print(a6);
    print(a7);
    setState(() {
      isProcess = false;
      answer1 = formatter.format(a1);
      answer2 = formatter.format(a2);
      answer3 = formatter.format(a3);
      answer4 = formatter.format(a4);
      answer5 = formatter.format(a5);
      answer6 = formatter.format(a6);
      answer7 = formatter.format(a7);

    });
  }
}



