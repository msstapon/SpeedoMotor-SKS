import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';


class GPSPage extends StatefulWidget {
  @override
  _GPSPageState createState() => _GPSPageState();
}

class _GPSPageState extends State<GPSPage> {

  double _value = 199.0;
  TextEditingController txtSizeChild = TextEditingController();
  TextEditingController txtRange = TextEditingController();
  TextEditingController txtCCEngine = TextEditingController();
  TextEditingController txtCCWater = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'SPEEDOMETER',
          style: appStyle.getTextStyle('titleText'),),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("lib/images/collection_motor/bg.png"),
              )
            ),
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Container(
                  //   // width: appStyle.getWidth100(),
                  //   // height: appStyle.getHeight(percent: 30),
                  //   alignment: Alignment.topRight,
                  //   margin: appStyle.getEdgeInsetsFromRatio(right: 4,top: 2),
                  //   child: GlowText(
                  //     _value.floor().toString(),
                  //     style: TextStyle(
                  //         fontSize: 100,
                  //         color: Colors.red.shade900,
                  //         fontFamily: 'digital'
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(top: 3),
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                            minimum: 0,
                            maximum: 220,
                            labelOffset: 20,
                            showTicks: true,
                            // useRangeColorForAxis: true,
                            axisLineStyle: AxisLineStyle(
                              thicknessUnit: GaugeSizeUnit.factor,thickness: 0.03,
                            ),
                            // backgroundImage: NetworkImage('https://img.freepik.com/free-vector/power-electrical-energy-lightning-spark-electricity-effects-realistic-isolated-blitz-illustration-checkered-background_102902-116.jpg?size=626&ext=jpg'),
                            startAngle: 130.0,
                            showFirstLabel: false,
                            maximumLabels: 4,
                            showLastLabel: true,
                            canRotateLabels: true,
                            radiusFactor: 1,
                            ticksPosition: ElementsPosition.inside,
                            majorTickStyle: MajorTickStyle(length: 15,thickness: 3, color: AppTheme.colorCard),
                            minorTickStyle: MinorTickStyle(length: 9,thickness: 2, color: AppTheme.colorRed),
                            axisLabelStyle: GaugeTextStyle(color: AppTheme.colorFont,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'digital'),
                            minorTicksPerInterval: 4,
                            ranges: <GaugeRange>[
                              GaugeRange(startValue: 0, endValue: 220, sizeUnit: GaugeSizeUnit.factor,startWidth: 0.03,endWidth: 0.03,
                                gradient: SweepGradient(
                                    colors: const<Color>[
                                      AppTheme.colorBorder,
                                      Color(0xFFE33C1A),
                                      Color(0xFFD43333),
                                    ],
                                    stops: const<double>[0.3,0.5,1]),
                                rangeOffset: 0.005,),
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(value:_value, needleLength: 0.95, enableAnimation: false,
                                animationType: AnimationType.linear, needleStartWidth: 0.5, needleEndWidth: 7,
                                lengthUnit: GaugeSizeUnit.factor,
                                knobStyle: KnobStyle(knobRadius: 0.1),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.red.withOpacity(1),
                                    Colors.red.shade900,
                                    Colors.red.withOpacity(1)
                                  ],
                                  stops: <double>[0.0,0.5,1],
                                ),
                              ),
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(widget: Container(child:
                              Column(
                                children: <Widget>[
                                  GlowText(_value.floor().toString(), style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: AppTheme.colorFont,fontFamily: 'digital')),
                                  // Text(_value.toString(), style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)),
                                  SizedBox(height: 20),
                                  GlowText('km/h', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppTheme.colorFont,fontFamily: 'digital'))],
                                // Text('km/h', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white))]
                              )), angle: 90, positionFactor: 1.4)]
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: appStyle.getEdgeInsetsFromRatio(left: 2,right: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: appStyle.getWidth(percent: 28),
                          height: appStyle.getHeight(percent: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: appStyle.getWidth(percent: 3),
                              color: AppTheme.colorBorder,
                            ),
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Distance',
                                  style: appStyle.getTextStyle('normalText'),
                                ),
                                Text(
                                  '1162 km',
                                  style: appStyle.getTextStyle('normalText'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: appStyle.getWidth(percent: 28),
                          height: appStyle.getHeight(percent: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: appStyle.getWidth(percent: 3),
                              color: AppTheme.colorBorder,
                            ),
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Max Speed',
                                  style: appStyle.getTextStyle('normalText'),
                                ),
                                Text(
                                  '90 km/h',
                                  style: appStyle.getTextStyle('normalText'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: appStyle.getWidth(percent: 28),
                          height: appStyle.getHeight(percent: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: appStyle.getWidth(percent: 3),
                              color: AppTheme.colorBorder,
                            ),
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Avg. Speed',
                                  style: appStyle.getTextStyle('normalText'),
                                ),
                                Text(
                                  '55 km/h',
                                  style: appStyle.getTextStyle('normalText'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: appStyle.getEdgeInsetsFromRatio(left: 4,top: 1),
                    child: Text(
                      'Engine Capacity',
                      style: appStyle.getTextStyle('titleText'),
                    ),
                  ),
                  Container(
                    padding: appStyle.getEdgeInsetsFromRatio(left: 4,right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ขนาดลูก',
                              style: appStyle.getTextStyle('normalTitle'),
                            ),
                            Container(
                              margin: appStyle.getEdgeInsetsFromRatio(top: 1),
                              decoration: appStyle.getCardStype('noShadow'),
                              height: appStyle.getHeight(percent: 5),
                              width: appStyle.getWidth(percent: 30),
                              child: TextFormField(
                                validator: (val){
                                  if(val.isEmpty){
                                    return 'กรุณากรอกขนาดลูก';
                                  }else{
                                    return null;
                                  }
                                },
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                controller: txtSizeChild,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: appStyle.getTextStyle('normalTextBlack'),
                                keyboardType: TextInputType.numberWithOptions(decimal: false),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
                                ],
                                decoration: InputDecoration(
                                  hintText: '0',
                                  // isCollapsed: true,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(
                                        color: AppTheme.colorBackgroundWhite,
                                        width: 1,
                                        style: BorderStyle.solid
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ช่วงชัก',
                              style: appStyle.getTextStyle('normalTitle'),
                            ),
                            Container(
                              margin: appStyle.getEdgeInsetsFromRatio(top: 1),
                              decoration: appStyle.getCardStype('noShadow'),
                              height: appStyle.getHeight(percent: 5),
                              width: appStyle.getWidth(percent: 30),
                              child: TextFormField(
                                validator: (val){
                                  if(val.isEmpty){
                                    return 'กรุณากรอกช่วงชัก';
                                  }else{
                                    return null;
                                  }
                                },
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                controller: txtRange,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: appStyle.getTextStyle('normalTextBlack'),
                                keyboardType: TextInputType.numberWithOptions(decimal: false),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
                                ],
                                decoration: InputDecoration(
                                  hintText: '0',
                                  // isCollapsed: true,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(
                                        color: AppTheme.colorBackgroundWhite,
                                        width: 1,
                                        style: BorderStyle.solid
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            //todo
                            log('fuck');
                          },
                          child: Container(
                            margin: appStyle.getEdgeInsetsFromRatio(top: 4),
                            width: appStyle.getWidth(percent: 30),
                            height: appStyle.getHeight(percent: 5),
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
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: appStyle.getEdgeInsetsFromRatio(top: 1,left: 4),
                    child: Text(
                      'CC เครื่องยนต์ : 300',
                      style: appStyle.getTextStyle('normalText'),
                    ),
                  ),
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(left: 4,right: 4,top: 2,bottom: 2),
                    child: Divider(
                      height: appStyle.getHeight(percent: 1),
                      color: AppTheme.colorBackgroundWhite,
                      thickness: 1.1,
                    ),
                  ),
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(left: 4),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Engine Compression Ratio',
                      style: appStyle.getTextStyle('titleText'),
                    ),
                  ),
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(left: 4,right: 4,bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CC เครื่องยนต์',
                              style: appStyle.getTextStyle('normalTitle'),
                            ),
                            Container(
                              margin: appStyle.getEdgeInsetsFromRatio(top: 1),
                              decoration: appStyle.getCardStype('noShadow'),
                              height: appStyle.getHeight(percent: 5),
                              width: appStyle.getWidth(percent: 30),
                              child: TextFormField(
                                validator: (val){
                                  if(val.isEmpty){
                                    return 'กรุณากรอก CCเครื่องยนต์';
                                  }else{
                                    return null;
                                  }
                                },
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                controller: txtCCEngine,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: appStyle.getTextStyle('normalTextBlack'),
                                keyboardType: TextInputType.numberWithOptions(decimal: false),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
                                ],
                                decoration: InputDecoration(
                                  hintText: '0',
                                  // isCollapsed: true,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(
                                        color: AppTheme.colorBackgroundWhite,
                                        width: 1,
                                        style: BorderStyle.solid
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CC น้ำที่วัดได้',
                              style: appStyle.getTextStyle('normalTitle'),
                            ),
                            Container(
                              margin: appStyle.getEdgeInsetsFromRatio(top: 1),
                              decoration: appStyle.getCardStype('noShadow'),
                              height: appStyle.getHeight(percent: 5),
                              width: appStyle.getWidth(percent: 30),
                              child: TextFormField(
                                validator: (val){
                                  if(val.isEmpty){
                                    return 'กรุณากรอก CCน้ำที่วัดได้';
                                  }else{
                                    return null;
                                  }
                                },
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                controller: txtCCWater,
                                textAlignVertical: TextAlignVertical.bottom,
                                style: appStyle.getTextStyle('normalTextBlack'),
                                keyboardType: TextInputType.numberWithOptions(decimal: false),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
                                ],
                                decoration: InputDecoration(
                                  hintText: '0',
                                  // isCollapsed: true,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(
                                        color: AppTheme.colorBackgroundWhite,
                                        width: 1,
                                        style: BorderStyle.solid
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            //todo
                            log('fuck');
                          },
                          child: Container(
                            margin: appStyle.getEdgeInsetsFromRatio(top: 4),
                            width: appStyle.getWidth(percent: 30),
                            height: appStyle.getHeight(percent: 5),
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
                        )
                      ],
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
}
