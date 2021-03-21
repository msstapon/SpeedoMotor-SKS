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
                fit: BoxFit.cover,
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
                    margin: appStyle.getEdgeInsetsFromRatio(top: 7),
                    child: StreamBuilder<double>(
                      stream: _countDown(),
                      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                        Widget _widget;
                        if (snapshot.hasError) {
                          _widget = new Container();
                        } else {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              _widget = new Container();
                              break;
                            case ConnectionState.waiting:
                              _widget = new Container();
                              break;
                            case ConnectionState.active:
                              _widget = new Container(child: Column(
                                children: <Widget>[
//                                  Text(
////                                    'ไม่ได้รับรหัส OTP ขออีกครั้งใน ${snapshot.data} วินาที',
////                                    style: TextStyle(
////                                        color: Colors.white, fontSize: 14),
////                                  ),
                                  SfRadialGauge(
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
                                          backgroundImage: NetworkImage('https://img.freepik.com/free-vector/power-electrical-energy-lightning-spark-electricity-effects-realistic-isolated-blitz-illustration-checkered-background_102902-116.jpg?size=626&ext=jpg'),
                                          startAngle: 130.0,
                                          showFirstLabel: false,
                                          maximumLabels: 4,
                                          showLastLabel: true,
                                          canRotateLabels: true,
                                          radiusFactor: 1,
                                          ticksPosition: ElementsPosition.inside,
                                          majorTickStyle: MajorTickStyle(length: 15,thickness: 3, color: AppTheme.colorCard),
                                          minorTickStyle: MinorTickStyle(length: 9,thickness: 2, color: Colors.blue),
                                          axisLabelStyle: GaugeTextStyle(color: AppTheme.colorFont,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'digital'),
                                          minorTicksPerInterval: 4,
                                          ranges: <GaugeRange>[
                                            GaugeRange(startValue: 0, endValue: 220, sizeUnit: GaugeSizeUnit.factor,startWidth: 0.03,endWidth: 0.03,
                                              gradient: SweepGradient(
                                                  colors: const<Color>[
                                                    Colors.blue,
                                                    Colors.blue,
                                                    Colors.blue,
                                                  ],
                                                  stops: const<double>[0.3,0.5,1]),
                                              rangeOffset: 0.005,),
                                          ],
                                          pointers: <GaugePointer>[
                                            NeedlePointer(value:double.parse(snapshot.data.toString()), needleLength: 0.95, enableAnimation: false,
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
                                                GlowText(double.parse(snapshot.data.toString()).floor().toString(), style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: AppTheme.colorFont,fontFamily: 'digital')),
                                                SizedBox(height: 20),
                                                GlowText('km/h', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppTheme.colorFont,fontFamily: 'digital'))],
                                              // Text('km/h', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white))]
                                            )), angle: 90, positionFactor: 1.4)]
                                      ),
                                    ],
                                  )
                                ],
                              ), );
                              break;
                            case ConnectionState.done:
                              return SfRadialGauge(
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
                                      backgroundImage: NetworkImage('https://img.freepik.com/free-vector/power-electrical-energy-lightning-spark-electricity-effects-realistic-isolated-blitz-illustration-checkered-background_102902-116.jpg?size=626&ext=jpg'),
                                      startAngle: 130.0,
                                      showFirstLabel: false,
                                      maximumLabels: 4,
                                      showLastLabel: true,
                                      canRotateLabels: true,
                                      radiusFactor: 1,
                                      ticksPosition: ElementsPosition.inside,
                                      majorTickStyle: MajorTickStyle(length: 15,thickness: 3, color: AppTheme.colorCard),
                                      minorTickStyle: MinorTickStyle(length: 9,thickness: 2, color: Colors.blue),
                                      axisLabelStyle: GaugeTextStyle(color: AppTheme.colorFont,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'digital'),
                                      minorTicksPerInterval: 4,
                                      ranges: <GaugeRange>[
                                        GaugeRange(startValue: 0, endValue: 220, sizeUnit: GaugeSizeUnit.factor,startWidth: 0.03,endWidth: 0.03,
                                          gradient: SweepGradient(
                                              colors: const<Color>[
                                                Colors.blue,
                                                Colors.blue,
                                                Colors.blue,
                                              ],
                                              stops: const<double>[0.3,0.5,1]),
                                          rangeOffset: 0.005,),
                                      ],
                                      pointers: <GaugePointer>[
                                        NeedlePointer(value:snapshot.data, needleLength: 0.95, enableAnimation: false,
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
                                            GlowText(snapshot.data.toString(), style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: AppTheme.colorFont,fontFamily: 'digital')),
                                            SizedBox(height: 20),
                                            GlowText('km/h', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppTheme.colorFont,fontFamily: 'digital'))],
                                          // Text('km/h', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white))]
                                        )), angle: 90, positionFactor: 1.4)]
                                  ),
                                ],
                              );
                          }
                        }
                        return Container(
                          child: _widget,
                        );
                      }
                    ),
                  ),
                  Container(
                    padding: appStyle.getEdgeInsetsFromRatio(top: 5,left: 2,right: 2),
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
                                  'Avg Speed',
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
                  RaisedButton(
                    onPressed: (){
                      getSpeed();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stream<double> _countDown(){
    Geolocator.getPositionStream(
        forceAndroidLocationManager: true,
        intervalDuration: Duration(milliseconds: 100),
        distanceFilter: 2,
        desiredAccuracy: LocationAccuracy.bestForNavigation
    ).listen((position){
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
        desiredAccuracy: LocationAccuracy.bestForNavigation
    ).listen((position){
      setState(() {
        speedInMps = position.speed;
      });
//      var speedInMps = position.speed;
      log(' Speed In Maps1 ' + speedInMps.toString());
    });
  }
}
