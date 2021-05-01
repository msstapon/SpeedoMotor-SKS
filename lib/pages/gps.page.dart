import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:geolocator_platform_interface/geolocator_platform_interface.dart';
import 'package:geolocator/geolocator.dart';
import 'package:th.go.dms.cancer.anywhere/pages/camshaft/camshaft.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/collection.brand.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/setting/setting.page.dart';

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
  double speedInMps = 0.0;

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text(
//          'SKS RACING',
//          style: appStyle.getTextStyle('newTitle'),
//        ),
//      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("lib/images/collection_motor/new_icon/sks-page-01-04.png"),
            )),
          ),
//          Form(
//            key: _formKey,
//            child: SingleChildScrollView(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: [
//                  new Container(
//                    margin: appStyle.getEdgeInsetsFromRatio(top: 5),
//                    child: Column(
//                      children: <Widget>[
//                        SfRadialGauge(
//                          axes: <RadialAxis>[
//                            RadialAxis(
//                                minimum: 0,
//                                maximum: 240,
//                                labelOffset: 20,
//                                showTicks: true,
//                                // useRangeColorForAxis: true,
//                                axisLineStyle: AxisLineStyle(
//                                  thicknessUnit: GaugeSizeUnit.factor,
//                                  thickness: 0.03,
//                                ),
//                                backgroundImage: AssetImage("lib/images/collection_motor/bgmile2.png"),
//                                startAngle: 130.0,
//                                showFirstLabel: false,
//                                maximumLabels: 4,
//                                showLastLabel: true,
//                                canRotateLabels: true,
//                                radiusFactor: 1,
//                                ticksPosition: ElementsPosition.inside,
//                                majorTickStyle: MajorTickStyle(length: 15, thickness: 3, color: AppTheme.colorWarning),
//                                minorTickStyle: MinorTickStyle(length: 9, thickness: 2, color: AppTheme.colorWarning),
//                                axisLabelStyle:
//                                    GaugeTextStyle(color: AppTheme.colorWarning, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'digital'),
//                                minorTicksPerInterval: 4,
//                                ranges: <GaugeRange>[
//                                  GaugeRange(
//                                    startValue: 0,
//                                    endValue: 240,
//                                    sizeUnit: GaugeSizeUnit.factor,
//                                    startWidth: 0.03,
//                                    endWidth: 0.03,
//                                    gradient: SweepGradient(colors: const <Color>[
//                                      AppTheme.colorError,
//                                      AppTheme.colorError,
//                                      AppTheme.colorError,
//                                    ], stops: const <double>[
//                                      0.3,
//                                      0.5,
//                                      1
//                                    ]),
//                                    rangeOffset: 0.005,
//                                  ),
//                                ],
//                                pointers: <GaugePointer>[
//                                  NeedlePointer(
//                                    value: double.parse("120"),
//                                    needleLength: 0.95,
//                                    enableAnimation: false,
//                                    animationType: AnimationType.linear,
//                                    needleStartWidth: 0.5,
//                                    needleEndWidth: 7,
//                                    lengthUnit: GaugeSizeUnit.factor,
//                                    knobStyle: KnobStyle(knobRadius: 0.1),
//                                    gradient: LinearGradient(
//                                      colors: [Colors.green.withOpacity(1), Colors.green.shade100, Colors.green.withOpacity(1)],
//                                      stops: <double>[0.0, 0.5, 1],
//                                    ),
//                                  ),
//                                ],
//                                annotations: <GaugeAnnotation>[
//                                  GaugeAnnotation(
//                                      widget: Container(
//                                          child: Column(
//                                        children: <Widget>[
//                                          GlowText(double.parse("120").floor().toString(),
//                                              style: TextStyle(
//                                                  fontSize: 32,
//                                                  fontWeight: FontWeight.bold,
//                                                  color: AppTheme.colorBackgroundWhite,
//                                                  fontFamily: 'digital')),
//                                          SizedBox(height: 20),
//                                          GlowText('km/h',
//                                              style: TextStyle(
//                                                  fontSize: 20,
//                                                  fontWeight: FontWeight.bold,
//                                                  color: AppTheme.colorBackgroundWhite,
//                                                  fontFamily: 'digital'))
//                                        ],
//                                        // Text('km/h', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white))]
//                                      )),
//                                      angle: 90,
//                                      positionFactor: 1.4)
//                                ]),
//                          ],
//                        )
//                      ],
//                    ),
//                  ),
//                  // Container(
//                  //   // width: appStyle.getWidth100(),
//                  //   // height: appStyle.getHeight(percent: 30),
//                  //   alignment: Alignment.topRight,
//                  //   margin: appStyle.getEdgeInsetsFromRatio(right: 4,top: 2),
//                  //   child: GlowText(
//                  //     _value.floor().toString(),
//                  //     style: TextStyle(
//                  //         fontSize: 100,
//                  //         color: Colors.red.shade900,
//                  //         fontFamily: 'digital'
//                  //     ),
//                  //   ),
//                  // ),
////                  Container(
////                    margin: appStyle.getEdgeInsetsFromRatio(top: 7),
////                    child: StreamBuilder<double>(
////                      stream: _countDown(),
////                      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
////                        Widget _widget;
////                        if (snapshot.hasError) {
////                          _widget = new Container(child: Column(
////                            children: <Widget>[
////                              SfRadialGauge(
////                                axes: <RadialAxis>[
////                                  RadialAxis(
////                                      minimum: 0,
////                                      maximum: 240,
////                                      labelOffset: 20,
////                                      showTicks: true,
////                                      // useRangeColorForAxis: true,
////                                      axisLineStyle: AxisLineStyle(
////                                        thicknessUnit: GaugeSizeUnit.factor,thickness: 0.03,
////                                      ),
////                                      backgroundImage: AssetImage("lib/images/collection_motor/bgmile2.png"),
////                                      startAngle: 130.0,
////                                      showFirstLabel: false,
////                                      maximumLabels: 4,
////                                      showLastLabel: true,
////                                      canRotateLabels: true,
////                                      radiusFactor: 1,
////                                      ticksPosition: ElementsPosition.inside,
////                                      majorTickStyle: MajorTickStyle(length: 15,thickness: 3, color: AppTheme.colorWarning),
////                                      minorTickStyle: MinorTickStyle(length: 9,thickness: 2, color: AppTheme.colorWarning),
////                                      axisLabelStyle: GaugeTextStyle(color: AppTheme.colorWarning,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'digital'),
////                                      minorTicksPerInterval: 4,
////                                      ranges: <GaugeRange>[
////                                        GaugeRange(startValue: 0, endValue: 240, sizeUnit: GaugeSizeUnit.factor,startWidth: 0.03,endWidth: 0.03,
////                                          gradient: SweepGradient(
////                                              colors: const<Color>[
////                                                AppTheme.colorError,
////                                                AppTheme.colorError,
////                                                AppTheme.colorError,
////                                              ],
////                                              stops: const<double>[0.3,0.5,1]),
////                                          rangeOffset: 0.005,),
////                                      ],
////                                      pointers: <GaugePointer>[
////                                        NeedlePointer(value:double.parse(snapshot.data.toString()), needleLength: 0.95, enableAnimation: false,
////                                          animationType: AnimationType.linear, needleStartWidth: 0.5, needleEndWidth: 7,
////                                          lengthUnit: GaugeSizeUnit.factor,
////                                          knobStyle: KnobStyle(knobRadius: 0.1),
////                                          gradient: LinearGradient(
////                                            colors: [
////                                              Colors.green.withOpacity(1),
////                                              Colors.green.shade100,
////                                              Colors.green.withOpacity(1)
////                                            ],
////                                            stops: <double>[0.0,0.5,1],
////                                          ),
////                                        ),
////                                      ],
////                                      annotations: <GaugeAnnotation>[
////                                        GaugeAnnotation(widget: Container(child:
////                                        Column(
////                                          children: <Widget>[
////                                            GlowText(double.parse(snapshot.data.toString()).floor().toString(), style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: AppTheme.colorBackgroundWhite,fontFamily: 'digital')),
////                                            SizedBox(height: 20),
////                                            GlowText('km/h', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppTheme.colorBackgroundWhite,fontFamily: 'digital'))],
////                                          // Text('km/h', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white))]
////                                        )), angle: 90, positionFactor: 1.4)]
////                                  ),
////                                ],
////                              )
////                            ],
////                          ), );
////                        } else {
////                          switch (snapshot.connectionState) {
////                            case ConnectionState.active:
////                              _widget = new Container(child: Column(
////                                children: <Widget>[
////                                  SfRadialGauge(
////                                    axes: <RadialAxis>[
////                                      RadialAxis(
////                                          minimum: 0,
////                                          maximum: 240,
////                                          labelOffset: 20,
////                                          showTicks: true,
////                                          // useRangeColorForAxis: true,
////                                          axisLineStyle: AxisLineStyle(
////                                            thicknessUnit: GaugeSizeUnit.factor,thickness: 0.03,
////                                          ),
////                                          backgroundImage: AssetImage("lib/images/collection_motor/bgmile2.png"),
////                                          startAngle: 130.0,
////                                          showFirstLabel: false,
////                                          maximumLabels: 4,
////                                          showLastLabel: true,
////                                          canRotateLabels: true,
////                                          radiusFactor: 1,
////                                          ticksPosition: ElementsPosition.inside,
////                                          majorTickStyle: MajorTickStyle(length: 15,thickness: 3, color: AppTheme.colorWarning),
////                                          minorTickStyle: MinorTickStyle(length: 9,thickness: 2, color: AppTheme.colorWarning),
////                                          axisLabelStyle: GaugeTextStyle(color: AppTheme.colorWarning,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'digital'),
////                                          minorTicksPerInterval: 4,
////                                          ranges: <GaugeRange>[
////                                            GaugeRange(startValue: 0, endValue: 240, sizeUnit: GaugeSizeUnit.factor,startWidth: 0.03,endWidth: 0.03,
////                                              gradient: SweepGradient(
////                                                  colors: const<Color>[
////                                                    AppTheme.colorError,
////                                                    AppTheme.colorError,
////                                                    AppTheme.colorError,
////                                                  ],
////                                                  stops: const<double>[0.3,0.5,1]),
////                                              rangeOffset: 0.005,),
////                                          ],
////                                          pointers: <GaugePointer>[
////                                            NeedlePointer(value:double.parse(snapshot.data.toString()), needleLength: 0.95, enableAnimation: false,
////                                              animationType: AnimationType.linear, needleStartWidth: 0.5, needleEndWidth: 7,
////                                              lengthUnit: GaugeSizeUnit.factor,
////                                              knobStyle: KnobStyle(knobRadius: 0.1),
////                                              gradient: LinearGradient(
////                                                colors: [
////                                                  Colors.green.withOpacity(1),
////                                                  Colors.green.shade100,
////                                                  Colors.green.withOpacity(1)
////                                                ],
////                                                stops: <double>[0.0,0.5,1],
////                                              ),
////                                            ),
////                                          ],
////                                          annotations: <GaugeAnnotation>[
////                                            GaugeAnnotation(widget: Container(child:
////                                            Column(
////                                              children: <Widget>[
////                                                GlowText(double.parse(snapshot.data.toString()).floor().toString(), style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: AppTheme.colorBackgroundWhite,fontFamily: 'digital')),
////                                                SizedBox(height: 20),
////                                                GlowText('km/h', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppTheme.colorBackgroundWhite,fontFamily: 'digital'))],
////                                              // Text('km/h', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white))]
////                                            )), angle: 90, positionFactor: 1.4)]
////                                      ),
////                                    ],
////                                  )
////                                ],
////                              ), );
////                              break;
////                          }
////                        }
////                        return Container(
////                          child: _widget,
////                        );
////                      }
////                    ),
////                  ),
//                  Container(
//                    height: appStyle.getHeight(percent: 35),
//                    padding: appStyle.getEdgeInsetsFromRatio(top: 5, left: 2, right: 2),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: [
//                        Container(
//                          width: appStyle.getWidth(percent: 18),
//                          height: appStyle.getHeight(percent: 9.5),
//                          child: Container(
//                            decoration: BoxDecoration(
//                                border: Border.all(
//                                  width: appStyle.getWidth(percent: 0.5),
//                                  color: AppTheme.colorBackgroundWhite,
//                                ),
//                                borderRadius: BorderRadius.circular(20),
//                                image: DecorationImage(
//                                  fit: BoxFit.fill,
//                                  image: AssetImage("lib/images/collection_motor/1.png"),
//                                )),
//                          ),
//                        ),
//                        InkWell(
//                          onTap: () {
//                             Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) => AppTheme(
//                                  child: CollectionBrand(type: '1',step: 'คำนวณ CC',),
//                                ),
//                              ),
//                            );
//                          },
//                          child: Container(
//                            width: appStyle.getWidth(percent: 18),
//                            height: appStyle.getHeight(percent: 9.5),
//                            child: Container(
//                              decoration: BoxDecoration(
//                                  border: Border.all(
//                                    width: appStyle.getWidth(percent: 0.5),
//                                    color: AppTheme.colorBackgroundWhite,
//                                  ),
//                                  borderRadius: BorderRadius.circular(20),
//                                  image: DecorationImage(
//                                    fit: BoxFit.fill,
//                                    image: AssetImage("lib/images/collection_motor/2.png"),
//                                  )),
//                            ),
//                          ),
//                        ),
//                        InkWell(
//                          onTap: (){
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) => AppTheme(
//                                  child: CamshaftPage(),
//                                ),
//                              ),
//                            );
//                          },
//                          child: Container(
//                            width: appStyle.getWidth(percent: 18),
//                            height: appStyle.getHeight(percent: 9.5),
//                            child: Container(
//                              decoration: BoxDecoration(
//                                  border: Border.all(
//                                    width: appStyle.getWidth(percent: 0.5),
//                                    color: AppTheme.colorBackgroundWhite,
//                                  ),
//                                  borderRadius: BorderRadius.circular(20),
//                                  image: DecorationImage(
//                                    fit: BoxFit.fill,
//                                    image: AssetImage("lib/images/collection_motor/3.png"),
//                                  )),
//                            ),
//                          ),
//                        ),
//                        InkWell(
//                          onTap: (){
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) => AppTheme(
//                                  child: CollectionBrand(type: '4',step: 'คำนวณวความเร็ว',),
//                                ),
//                              ),
//                            );
//                          },
//                          child: Container(
//                            width: appStyle.getWidth(percent: 18),
//                            height: appStyle.getHeight(percent: 9.5),
//                            child: Container(
//                              decoration: BoxDecoration(
//                                  border: Border.all(
//                                    width: appStyle.getWidth(percent: 0.5),
//                                    color: AppTheme.colorBackgroundWhite,
//                                  ),
//                                  borderRadius: BorderRadius.circular(20),
//                                  image: DecorationImage(
//                                    fit: BoxFit.fill,
//                                    image: AssetImage("lib/images/collection_motor/4.png"),
//                                  )),
//                            ),
//                          ),
//                        ),
//                        InkWell(
//                          onTap: (){
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) => AppTheme(
//                                  child: Setting(),
//                                ),
//                              ),
//                            );
//                          },
//                          child: Container(
//                            width: appStyle.getWidth(percent: 18),
//                            height: appStyle.getHeight(percent: 9.5),
//                            child: Container(
//                              decoration: BoxDecoration(
//                                  border: Border.all(
//                                    width: appStyle.getWidth(percent: 0.5),
//                                    color: AppTheme.colorBackgroundWhite,
//                                  ),
//                                  borderRadius: BorderRadius.circular(20),
//                                  image: DecorationImage(
//                                    fit: BoxFit.fitHeight,
//                                    image: AssetImage("lib/images/collection_motor/5.png"),
//                                  )),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
////                  RaisedButton(
////                    onPressed: (){
////                      getSpeed();
////                    },
////                  )
//                ],
//              ),
//            ),
//          ),
        ],
      ),
    );
  }

  Stream<double> _countDown() {
    Geolocator.getPositionStream(
            forceAndroidLocationManager: true,
            intervalDuration: Duration(milliseconds: 100),
            distanceFilter: 2,
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .listen((position) {
      setState(() {
        speedInMps = position.speed;
      });
//      var speedInMps = position.speed;
      log(' Speed In Maps2 ' + speedInMps.toString());
    });
    StreamController<double> resetCountDown;
    void _bids() async {
//      for (int i = 30; i >= 0; i--) {
//        await Future<void>.delayed(Duration(seconds: 1));
//        resetCountDown.sink.add(double.parse(i.toString()));
//      }
      resetCountDown.sink.add(speedInMps);
    }

    resetCountDown = new StreamController<double>(onListen: _bids);
    return resetCountDown.stream;
  }

  getSpeed() async {
    var geoLocator = Geolocator();
    Geolocator.getPositionStream(
            forceAndroidLocationManager: true,
            intervalDuration: Duration(milliseconds: 100),
            distanceFilter: 2,
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .listen((position) {
      setState(() {
        speedInMps = position.speed;
      });
//      var speedInMps = position.speed;
      log(' Speed In Maps1 ' + speedInMps.toString());
    });
  }
}
