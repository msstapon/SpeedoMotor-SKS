import 'dart:developer';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.config.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:th.go.sks.racing_2/pages/calculator-cc/calculator.page.dart';
import 'package:th.go.sks.racing_2/pages/calculator-gear/calculator_gear.page.dart';
import 'package:th.go.sks.racing_2/utilities/utilities.dart';
import 'package:th.go.sks.racing_2/widgets/dialog/confirm.dialog.widget.dart';
import 'package:kbt_flutter_package/utilities/shared.preferences.util.dart';

class Weather extends StatefulWidget {
  Weather({Key key,this.weatherData,this.firstLat,this.firstLong}) : super(key: key);
  final weatherData;
  String firstLat;
  String firstLong;

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  int _currentCityId;
  String _currentDateTime;
  IconData _weatherIcon;
  String _weatherIconId;
  String _weatherStatus;
  String _cityName;
  double _temperature;
  double _temperatureFeelLike;
  double _wind;
  int _humidity;
  int _pressure;
  int _visibility;
  int _cloudiness;
  bool _celsiusButtonStatus;
  bool _fahrenheitButtonStatus;
  Color _celsiusButtonColor;
  Color _fahrenheitButtonColor;
  double _celsiusButtonElevation;
  double _fahrenheitButtonElevation;
  BoxDecoration _boxDecoration;
  List<Color> _gradientBackgroundColor;
  bool _pressAttention = true;



  void _updateUI(dynamic weatherData) {
    log(widget.firstLong);
    log(widget.firstLat);
    setState(() {
      try {
        _currentCityId = weatherData['weather'][0]['id'];
        _weatherIconId = weatherData['weather'][0]['icon'];
        _weatherStatus = weatherData['weather'][0]['main'];
        _cityName = weatherData['name'];
        _temperature = weatherData['main']['temp'].toDouble();
        _temperatureFeelLike = weatherData['main']['feels_like'].toDouble();
        _wind = weatherData['wind']['speed'].toDouble();
        _humidity = weatherData['main']['humidity'];
        _pressure = weatherData['main']['pressure'];
        _visibility = weatherData['visibility'];
        _cloudiness = weatherData['clouds']['all'];
        _celsiusButtonStatus = true;
        _fahrenheitButtonStatus = false;

      } catch (e) {
        _cityName = '';
        _weatherStatus = 'ERROR';
        _temperature = null;
        _temperatureFeelLike = null;
        _wind = null;
        _humidity = null;
        _pressure = null;
        _visibility = null;
        _cloudiness = null;
        print(e);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _updateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
      backgroundColor: AppTheme.colorBlack,
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(color: Colors.white),
        backgroundColor: AppTheme.colorBlack,
        title: Text(
          'สภาพอากาศ',
          style: TextStyle(
              fontSize: appStyle.getWidth(percent: 6), color: AppTheme.colorBackgroundWhite, fontFamily: 'Kanit', fontWeight: FontWeight.normal),
        ),
        actions: [
          Container(
            // margin: appStyle.getEdgeInsetsFromRatio(right: 1.5, top: 0.5, bottom: 0.5),
            child: Image.asset(
              'lib/images/collection_motor/logo.png',
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: appStyle.getHeight100(),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // profile, change pin , logout
                    buildLat(context, appStyle),
                    buildLong(context, appStyle),
                    buildTemp(context, appStyle),
                    buildMoisture(context, appStyle),
                    buildPressure(context, appStyle),
                    buildWindSpeed(context, appStyle),
//                    buildWindDirection(context, appStyle),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLat(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 2,right: 2,bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
            ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ละติจูด',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      '${double.parse(widget.firstLat).toStringAsFixed(2)} N',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget buildLong(BuildContext context, AppStyle appStyle) {
    return Container(
     margin: appStyle.getEdgeInsetsFromRatio(left: 2,right:2,bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
        ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ลองจิจูด',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      '${double.parse(widget.firstLong).toStringAsFixed(2)} E',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  //อุณหภูมื
  Widget buildTemp(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(left: 2,right:2,bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
        ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'อุณหภูมิ',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      '${this._temperatureFeelLike} °',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  //ความชื้น
  Widget buildMoisture(BuildContext context, AppStyle appStyle) {
    return Container(
     margin: appStyle.getEdgeInsetsFromRatio(left: 2,right:2,bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
        ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ความชื้น',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      '${this._humidity} %',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  //ความดัน
  Widget buildPressure(BuildContext context, AppStyle appStyle) {
    return Container(
     margin: appStyle.getEdgeInsetsFromRatio(left: 2,right:2,bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
        ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ความดัน',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      '${this._pressure}',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  // ความเร็วลม
  Widget buildWindSpeed(BuildContext context, AppStyle appStyle) {
    return Container(
     margin: appStyle.getEdgeInsetsFromRatio(left: 2,right:2,bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
        ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ความเร็วลม',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      '${this._wind} km/h',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  //ทิศลม
  Widget buildWindDirection(BuildContext context, AppStyle appStyle) {
    return Container(
     margin: appStyle.getEdgeInsetsFromRatio(left: 2,right:2,bottom: 1),
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
        ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(children: [
          InkWell(
            onTap: () async {},
            child: Container(
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ทิศลม',
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBackgroundWhite,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.normal),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: AppTheme.colorFontWhite,
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

}
