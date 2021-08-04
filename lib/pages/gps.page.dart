import 'dart:async';
import 'dart:developer' as log;
import 'dart:ffi';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:duration/duration.dart';

import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.size.config.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:geolocator_platform_interface/geolocator_platform_interface.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:speedometer/speedometer.dart';
import 'package:th.go.sks.racing_2/getGPS.dart' as durationGPS;
import 'package:th.go.sks.racing_2/models/user.model.dart';
import 'package:th.go.sks.racing_2/pages/history.page.dart';
import 'package:th.go.sks.racing_2/pages/home.page.dart';
import 'package:th.go.sks.racing_2/pages/speed.range.page.dart';
import 'package:th.go.sks.racing_2/services/gps.service.dart';
import 'package:th.go.sks.racing_2/utilities/utilities.dart';
import 'package:th.go.sks.racing_2/widgets/other/loading.widget.dart';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart' as connectNet;
import 'package:th.go.sks.racing_2/config/app.sharedpreferences.config.dart';


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
  double _lowerValue = 0.0;
  double _upperValue = 0.0;
  int start = 20;
  int end = 360;
  int counter = 0;
  ThemeData somTheme;
  bool isProcess = false;
  Timer _timer;
  Timer _timerSpeedTest;
  Timer _timeSet;
  int _start = 3;
  String _start2 = "3";
  bool checkStartSpeedTest = false;
  List<double> speedAll = [];
  Timer _timerCountTime;
  double countTime;
  String countTimeDuration;
  double countDistance = 0.0;
  Timer _timerForStart; // ตอนกดปุ่ม start;
  Timer _timeDistance;
  Timer _timeDistance2; // ตอนคิดระยะทาง;

  double firstLongitude = 0.0;
  double firstLat = 0.0;

  double lastLongitude = 0.0;
  double lastLat = 0.0;

  String sixtyFeetTime = "-";
  String twoHundredTime = "-";
  String threeHundredTime = "-";
  String fourHundredTime = "-";
  String fiveHundredTime = "-";
  String sixHundredTime = "-";
  String sevenHundredTime = "-";
  String eightHundredTime = "-";
  String nineHundredTime = "-";
  String oneThousandTime = "-";
  String oneThousand1Time = "-";
  String oneThousand2Time = "-";
  String oneThousand3Time = "-";
  String oneThousand4Time = "-";
  String oneThousand5Time = "-";
  String oneThousand6Time = "-";
  String oneThousand7Time = "-";
  String oneThousand8Time = "-";
  String oneThousand9Time = "-";
  String twoThousandTime = "-";

  String sixtyFeetTime1 = "-";
  String twoHundredTime1 = "-";
  String threeHundredTime1 = "-";
  String fourHundredTime1 = "-";
  String fiveHundredTime1 = "-";
  String sixHundredTime1 = "-";
  String sevenHundredTime1 = "-";
  String eightHundredTime1 = "-";
  String nineHundredTime1 = "-";
  String oneThousandTime1 = "-";
  String oneThousand1Time1 = "-";
  String oneThousand2Time1 = "-";
  String oneThousand3Time1 = "-";
  String oneThousand4Time1 = "-";
  String oneThousand5Time1 = "-";
  String oneThousand6Time1 = "-";
  String oneThousand7Time1 = "-";
  String oneThousand8Time1 = "-";
  String oneThousand9Time1 = "-";
  String twoThousandTime1 = "-";

  List<String> sixtyFeetTimeList = ["-"];
  List<String> twoHundredTimeList = ["-"];
  List<String> threeHundredTimeList = ["-"];
  List<String> fourHundredTimeList = ["-"];
  List<String> fiveHundredTimeList = ["-"];
  List<String> sixHundredTimeList = ["-"];
  List<String> sevenHundredTimeList = ["-"];
  List<String> eightHundredTimeList = ["-"];
  List<String> nineHundredTimeList = ["-"];
  List<String> oneThousandTimeList = ["-"];
  List<String> oneThousand1TimeList = ["-"];
  List<String> oneThousand2TimeList = ["-"];
  List<String> oneThousand3TimeList = ["-"];
  List<String> oneThousand4TimeList = ["-"];
  List<String> oneThousand5TimeList = ["-"];
  List<String> oneThousand6TimeList = ["-"];
  List<String> oneThousand7TimeList = ["-"];
  List<String> oneThousand8TimeList = ["-"];
  List<String> oneThousand9TimeList = ["-"];
  List<String> twoThousandTimeList = ["-"];

  // ignore: cancel_subscriptions
  StreamSubscription<Position> positionStream;

  // ignore: cancel_subscriptions
  StreamSubscription<Position> positionStream2;
  StreamSubscription<Position> positionStream3;

//  StreamSubscription<Position> locator;
  // ignore: close_sinks
  PublishSubject<double> eventObservable = new PublishSubject();

  /// Geolocator is used to find velocity
  GeolocatorPlatform locator = GeolocatorPlatform.instance;
  double _velocity;

  /// Highest recorded velocity so far in m/s.
  double _highestVelocity;

  /// Velocity in m/s to km/hr converter
  double mpstokmph(double mps) => mps * 18 / 5;

  double avgSpeed = 0.0;
  Timer _timer2;

  StreamController<double> _velocityUpdatedStreamController = StreamController<double>();
  StreamController<double> _velocityUpdatedStreamController2 = StreamController<double>();
  StreamController<double> _velocityUpdatedStreamController3 = StreamController<double>();
  LocationPermission permission;
  bool checkRefresh = false;

  int userKey;

  getUser() async{
    var dataUser =  await GpsServices().getUser();
    setState(() {
      userKey = dataUser.userKey;
    });
  }


  @override
  void initState() {
    super.initState();
    getUser();
    _velocity = 0;
    _highestVelocity = 0.0;
//    startCountOnTime();
    setState(() {
//      _velocityUpdatedStreamController = BehaviorSubject();
//      _velocityUpdatedStreamController2 = BehaviorSubject();
      somTheme = new ThemeData(primaryColor: Colors.blue, accentColor: Colors.black, backgroundColor: Colors.grey);
    });
    checkPermissionGPS();
//    setData();
  }

  void startCountOnTime() async {
    const oneSec = const Duration(milliseconds: 900);
    _timer2 = new Timer.periodic(
      oneSec,
      (Timer timer) {
        countOnTime();
        _timer2.cancel();
      },
    );
  }

  void setData() async {
    const oneSec = const Duration(seconds: 1);
    _timeSet = new Timer.periodic(
      oneSec,
      (Timer timer) {
        eventObservable.add(0);
        if (timer.tick == 1) {
          _timeSet.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    _velocityUpdatedStreamController.close();
    _velocityUpdatedStreamController2.close();
    _velocityUpdatedStreamController3.close();
    positionStream2.cancel();


//    _timeSet.isActive ? _timeSet.cancel() : print('out');
    _timerSpeedTest == null ? print('out2') : _timerSpeedTest.cancel();
    _timer != null ? _timer.cancel() : print('out3');
    _timer2 != null ? _timer2.cancel() : print('out4');

    super.dispose();
  }

  checkPermissionGPS() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      } else {
        print("getSpeed");
        getSpeed();
      }
    } else {
      getSpeed();
    }
  }



  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("lib/images/collection_motor/new_icon/sks-page-01-04.png"),
            )),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("lib/images/collection_motor/new_icon/sks-page-01-05.png"),
                    ),
                  ),
                  margin: appStyle.getEdgeInsetsFromRatio(top: 13),
                  child: new Column(
//                  mainAxisAlignment : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                          padding: new EdgeInsets.all(40.0),
                          child: StreamBuilder<Object>(
                              stream: _velocityUpdatedStreamController3.stream,
                              builder: (context, snapshot) {
                                return new SpeedOMeter(
                                    start: start,
                                    end: end,
                                    themeData: somTheme,
                                    highlightStart: (0),
                                    highlightEnd: (0),
                                    eventObservable: this.eventObservable);
                              })),
                    ],
                  ),
                ),

                new Container(
                  color: Colors.black,
                  margin: appStyle.getEdgeInsetsFromRatio(right: 3,left: 2),
                  child:  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Container(width: appStyle.getWidth(percent: 20),),
                      !checkStartSpeedTest
                          ? Container(
                        color: Colors.black,
//                        width: appStyle.getWidth(percent: 100),
                        height: appStyle.getHeight(percent: 8),
                        child: InkWell(
                          onTap: () {
                            startTimer();
                          },
                          child: Container(
                            child: Image.asset(
                              "lib/images/collection_motor/new_icon/sks-page-01-07.png",
                              width: appStyle.getWidth(percent: 30),
                            ),
                          ),
                        ),
                      )
                          : checkRefresh
                          ? Container(
                        color: Colors.black,
//                        width: appStyle.getWidth(percent: 100),
                        height: appStyle.getHeight(percent: 8),
                        margin: appStyle.getEdgeInsetsFromRatio(top: 1),
                        child: FlatButton(
                          color: AppTheme.colorBlack,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: appStyle.getWidth(percent: 27),
                                height: appStyle.getHeight(percent: 5),
                                alignment: Alignment.center,
                                child: new Text(
                                  'Refresh',
                                  style:
                                  TextStyle(fontSize: appStyle.getWidth(percent: 5), fontFamily: 'spyagency3cond', color: AppTheme.colorRed),
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.colorBlack,
                                  borderRadius: BorderRadius.all(Radius.circular(4.0) //                 <--- border radius here
                                  ),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () async {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppTheme(
                                  child: HomePage(),
                                ),
                              ),
                            );
//                                setState(() {
//                                  checkStartSpeedTest = false;
//                                });
                          },
                        ),
                      )
                          : Container(
                        color: Colors.black,
//                        width: appStyle.getWidth(percent: 100),
                        height: appStyle.getHeight(percent: 8),
                        margin: appStyle.getEdgeInsetsFromRatio(top: 1),
                        child: FlatButton(
                          color: AppTheme.colorBlack,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: appStyle.getWidth(percent: 27),
                                height: appStyle.getHeight(percent: 5),
                                padding: appStyle.getEdgeInsetsFromRatio(left: 1),
                                alignment: Alignment.center,
                                child: new Text(
                                  'STOP',
                                  style: TextStyle(
                                      fontSize: appStyle.getWidth(percent: 5), fontFamily: 'spyagency3condital', color: AppTheme.colorRed),
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.colorBlack,
                                  borderRadius: BorderRadius.all(Radius.circular(4.0) //                 <--- border radius here
                                  ),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () async {
                            calculatorDistance();
                          },
                        ),
                      ),
    !checkStartSpeedTest ?
                      Container(
                        color: Colors.black,
                        height: appStyle.getHeight(percent: 8),
                        margin: appStyle.getEdgeInsetsFromRatio(top: 1),
                        child: FlatButton(
                          color: AppTheme.colorBlack,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Image.asset(
                                'lib/images/collection_motor/new_icon/sks-page-01-14.png',
                                height: appStyle.getHeight(percent: 5),
                              ),
                            ],
                          ),
                          onPressed: () async {
                            if(!checkStartSpeedTest){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_)=>HistoryPage(userKey: userKey,)
                                  )
                              );
                            }
                          },
                        ),
                      ) : new Container(width: appStyle.getWidth(percent: 20),height: 0,)
                    ],
                  ),
                ),
                new Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      Container(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: appStyle.getHeight(percent: 5),
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    ' ${convertTimeCount(countTimeDuration == null ? "0" : countTimeDuration)}',
                                    style:
                                        TextStyle(fontSize: appStyle.getWidth(percent: 5), fontFamily: 'spyagency3cond', color: AppTheme.colorGrey),
                                  ),
                                ),
                              ],
                            ),
                            StreamBuilder<Object>(
                                stream: _velocityUpdatedStreamController.stream,
                                builder: (context, snapshot) {
                                  if(snapshot.hasData){
                                    return Container(
                                      child: Text(
                                        ' ${mpstokmph(_velocity).toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontSize: appStyle.getWidth(percent: 13),
                                            fontFamily: 'spyagency3cond',
                                            color: AppTheme.colorBackgroundWhite),
                                      ),
                                    );
                                  }else{
                                    return Container(
                                      child: Text(
                                        '0.00',
                                        style: TextStyle(
                                            fontSize: appStyle.getWidth(percent: 13),
                                            fontFamily: 'spyagency3cond',
                                            color: AppTheme.colorBackgroundWhite),
                                      ),
                                    );
                                  }

                                }),
                            Container(
                              height: appStyle.getHeight(percent: 4),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                ' KM/H.',
                                style:
                                    TextStyle(fontSize: appStyle.getWidth(percent: 5), fontFamily: 'spyagency3condital', color: AppTheme.colorGrey),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        color: Colors.black,
                        margin: appStyle.getEdgeInsetsFromRatio(top: 1, left: 15),
                        child: new Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  'MAX.SPEED ',
                                  style:
                                      TextStyle(fontSize: appStyle.getWidth(percent: 4.5), fontFamily: 'spyagency3cond', color: AppTheme.colorGrey),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: StreamBuilder<Object>(
                                  stream: _velocityUpdatedStreamController2.stream,
                                  builder: (context, snapshot) {
                                    return Container(
                                      alignment: Alignment.bottomRight,
//                            decoration: BoxDecoration(
//                              color: AppTheme.colorPrimaryDark,
//                              borderRadius: BorderRadius.all(
//                                  Radius.circular(3.0)),
//                            ),
                                      child: Text(
                                        '${mpstokmph(_highestVelocity).toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontSize: appStyle.getWidth(percent: 4.5), fontFamily: 'spyagency3cond', color: AppTheme.colorAccent),
                                      ),
                                    );
                                  }),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  ' KM/H',
                                  style:
                                      TextStyle(fontSize: appStyle.getWidth(percent: 4.5), fontFamily: 'spyagency3cond', color: AppTheme.colorGrey),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: appStyle.getEdgeInsetsFromRatio(top: 1, left: 15),
                        child: new Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  'AVG.SPEED ',
                                  style:
                                      TextStyle(fontSize: appStyle.getWidth(percent: 4.5), fontFamily: 'spyagency3cond', color: AppTheme.colorGrey),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '${avgSpeed.toStringAsFixed(2)}',
                                  style:
                                      TextStyle(fontSize: appStyle.getWidth(percent: 4.5), fontFamily: 'spyagency3cond', color: AppTheme.colorAccent),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  ' KM/H',
                                  style:
                                      TextStyle(fontSize: appStyle.getWidth(percent: 4.5), fontFamily: 'spyagency3cond', color: AppTheme.colorGrey),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: appStyle.getEdgeInsetsFromRatio(top: 1, left: 15),
                        child: new Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  'TOTAL ',
                                  style:
                                      TextStyle(fontSize: appStyle.getWidth(percent: 4.5), fontFamily: 'spyagency3cond', color: AppTheme.colorGrey),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '${countDistance.toStringAsFixed(2)}',
                                  style:
                                      TextStyle(fontSize: appStyle.getWidth(percent: 4.5), fontFamily: 'spyagency3cond', color: AppTheme.colorAccent),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Text(
                                  ' KM    ',
                                  style:
                                      TextStyle(fontSize: appStyle.getWidth(percent: 4.5), fontFamily: 'spyagency3cond', color: AppTheme.colorGrey),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                checkStartSpeedTest ? buildDistance(context, appStyle) : new Container()
              ],
            ),
          ),
          Positioned(
            width: appStyle.getWidth100(),
            height: appStyle.getHeight100(),
            child: isProcess
                ? createLoadingDialog(context)
                : Container(
              width: 0.0,
              height: 0.0,
            ),
          ),
        ],
      ),
    ));
  }

  Widget createLoadingDialog(BuildContext context) {
    AppSizeConfig appSizeConfig = new AppSizeConfig(context);
    AppStyle appStyle = new AppStyle(context);
    return Container(
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppTheme.colorBackgroundWhite)),
        Container(
            margin: EdgeInsets.only(left: 0, top: 20),
            child: Text(
              "${this._start2}",
              style: TextStyle(fontSize: appStyle.getWidth(percent: 13), fontFamily: 'spyagency3condital', color: this._start2  == "Go" ? AppTheme.colorGreen2  : AppTheme.colorBlack),
            )),
      ])),
      color: Colors.white.withOpacity(0.6),
    );
  }

  void startTimer() async {
    try{
      setState(() {
        isProcess = true;
      });

      const oneSec = const Duration(seconds: 1);
      _timerForStart = new Timer.periodic(
        oneSec,
            (Timer timer) {
          if (timer.tick == 4) {
            _timerForStart.cancel();
            setState(() {
              _start = 3;
              isProcess = false;
            });
            setState(() {
              checkStartSpeedTest = true;
            });
            countOnPosition();
          }  else {

            if(timer.tick == 3){
              startCountOnTime();
              setState(() {
                _start2 = "Go";
              });
            }else{
              setState(() {
                _start--;
                _start2 = _start.toString();
              });
            }
          }
        },
      );
    }catch(error){
      Utilities.defaultHandler(error, context);
      setState(() {
      isProcess = false;
    });
    }

  }

  void countOnTime() async {
    const oneSec = const Duration(milliseconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          countTimeDuration = timer.tick.toString();
        });
//          if(timer.tick > 1000 && timer.tick <= 1100){
//            _onDistance();
//          }
      },
    );
  }

  void calculatorDistance() async {
    try {
      setState(() {
        isProcess = true;
      });
      print("int");
//      _timeSet.isActive ? _timeSet.cancel() : print('out2');
      _timerSpeedTest == null ? print('out22') : _timerSpeedTest.cancel();
      _timer != null ? _timer.cancel() : print('out3');
      _timeDistance != null ? _timeDistance.cancel() : print("out4");
//      positionStream.cancel();
      positionStream2.cancel();
//      _timerSpeedTest.cancel();
//      _timeDistance.cancel();
      print("sixtyFeetTime ${this.sixtyFeetTime}");
     await GpsServices().saveSpeedTest(
       userKey: this.userKey,
       speed100m: this.sixtyFeetTime,
       time100m: this.sixtyFeetTime1,
        speed200m: this.twoHundredTime,
        time200m: this.twoHundredTime1,
        speed300m: this.threeHundredTime,
        time300m: this.threeHundredTime,
        speed400m: this.fourHundredTime,
        time400m: this.fourHundredTime1,
        speed500m: this.fiveHundredTime,
        time500m: this.fiveHundredTime1,
        speed600m: this.sixHundredTime,
        time600m: this.sixHundredTime1,
        speed700m: this.sevenHundredTime,
        time700m: this.sixHundredTime1,

        speed800m: this.eightHundredTime,
        time800m: this.eightHundredTime1,

        speed900m: this.nineHundredTime,
        time900m: this.nineHundredTime1,

        speed1000m: this.oneThousandTime,
        time1000m: this.oneThousandTime1,

        speed1100m: this.oneThousand1Time,
        time1100m: this.oneThousand1Time1,

        speed1200m: this.oneThousand2Time,
        time1200m: this.oneThousand2Time1,

        speed1300m: this.oneThousand3Time,
        time1300m: this.oneThousand3Time1,

        speed1400m: this.oneThousand4Time,
        time1400m: this.oneThousand4Time1,

        speed1500m: this.oneThousand5Time,
        time1500m: this.oneThousand5Time1,

        speed1600m: this.oneThousand6Time,
        time1600m: this.oneThousand6Time1,

        speed1700m: this.oneThousand7Time,
        time1700m: this.oneThousand7Time,

        speed1800m: this.oneThousand8Time,
        time1800m: this.oneThousand8Time1,

        speed1900m: this.oneThousand9Time,
        time1900m: this.oneThousand9Time1,

        speed2000m: this.twoThousandTime,
        time2000m: this.twoThousandTime1,
        total: this.countDistance.toStringAsFixed(2),
        average: this.avgSpeed.toStringAsFixed(2),
        maxSpeed:mpstokmph(_highestVelocity).toStringAsFixed(2),
      );
      setState(() {
        checkRefresh = true;
        countTimeDuration = null;
        countDistance = 0.0;
        isProcess = false;
      });

//      await Navigator.pushReplacement(
//        context,
//        MaterialPageRoute(
//          builder: (context) => AppTheme(
//            child: SpeedRang(
//              sixtyFeetTime: this.sixtyFeetTime,
//              twoHundredTime: this.twoHundredTime,
//              threeHundredTime: this.threeHundredTime,
//              fourHundredTime: this.fourHundredTime,
//              fiveHundredTime: this.fiveHundredTime,
//              sixHundredTime: this.sixHundredTime,
//              sevenHundredTime: this.sevenHundredTime,
//              eightHundredTime: this.eightHundredTime,
//              oneThousandTime: this.oneThousandTime,
//              twoThousandTime: this.twoThousandTime,
//              sixtyFeetTime1: this.sixtyFeetTime1,
//              twoHundredTime1: this.twoHundredTime1,
//              threeHundredTime1: this.threeHundredTime1,
//              fourHundredTime1: this.fourHundredTime1,
//              fiveHundredTime1: this.fiveHundredTime1,
//              sixHundredTime1: this.sixHundredTime1,
//              sevenHundredTime1: this.sevenHundredTime1,
//              eightHundredTime1: this.eightHundredTime1,
//              nineHundredTime: this.nineHundredTime,
//              oneThousandTime1: this.oneThousandTime1,
//              oneThousand1Time1: this.oneThousand1Time1,
//              oneThousand2Time1: this.oneThousand2Time1,
//              oneThousand3Time1: this.oneThousand3Time1,
//              oneThousand4Time1: this.oneThousand4Time1,
//              oneThousand5Time1: this.oneThousand5Time1,
//              oneThousand6Time1: this.oneThousand6Time1,
//              oneThousand7Time1: this.oneThousand7Time1,
//              oneThousand8Time1: this.oneThousand8Time1,
//              oneThousand9Time1: this.oneThousand9Time1,
//              twoThousandTime1: this.twoThousandTime1,
//                oneThousand1Time : this.oneThousand1Time,
//              oneThousand2Time : this.oneThousand2Time,
//              oneThousand3Time : this.oneThousand3Time,
//              oneThousand4Time : this.oneThousand4Time,
//              oneThousand5Time : this.oneThousand5Time,
//              oneThousand6Time : this.oneThousand6Time,
//              oneThousand7Time : this.oneThousand7Time,
//              oneThousand8Time : this.oneThousand8Time,
//              oneThousand9Time : this.oneThousand9Time,
//                nineHundredTime1 : this.nineHundredTime1,
//              maxSpeed: mpstokmph(_highestVelocity).toStringAsFixed(2),
//              avgSpeed: this.avgSpeed.toStringAsFixed(2),
//              totalKm: this.countDistance.toStringAsFixed(2),
//            ),
//          ),
//        ),
//      );
    } catch (error) {}
  }

  getSpeed() async {
//    print("ijnt");
    positionStream2 = locator
        .getPositionStream(
          desiredAccuracy: LocationAccuracy.bestForNavigation,
        )
        .listen(
          (Position position) => _onAccelerate(position.speed),
        );
  }

//  getDistance() async {
////    positionStream3 =  locator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation)
//    const oneSec = const Duration(seconds: 1);
//    _timeDistance2 = new Timer.periodic(
//      oneSec,
//          (Timer timer) async {
//            Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//            _velocityUpdatedStreamController3.add(position.latitude);
//      },
//    );
//  }

  void countOnPosition() async {
    const oneSec = const Duration(milliseconds: 500);
    _timeDistance = new Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (timer.tick % 2 != 0) {
          final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
          print("position1 ${position.toJson()}");
          setState(() {
            firstLat = position.latitude;
            firstLongitude = position.longitude;
          });
        } else {
          final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
          print("position2 ${position.toJson()}");
          setState(() {
            lastLat = position.latitude;
            lastLongitude = position.longitude;
          });
        }
        _onDistance();
      },
    );
  }

  void _onDistance() async {
//    13.5732539,100.3572538 แถวบ้าน

//    13.5898637,100.779927 โรงงานพี่ตั้ม
  //  13.5722651,100.373688 บ้านมอส
    if (lastLat != 0.0) {
      double distanceInMeters = Geolocator.distanceBetween(firstLat, firstLongitude, lastLat, lastLongitude);
      double avg1 = double.parse(countTimeDuration) / 1000;
      var a1 = distanceInMeters / 1000.00;
      var a2 = a1 + countDistance;
      setState(() {
        countDistance = a2;
      });
      var avg2 = avg1 * 0.000277777777778;
      var avg3 = a2 / avg2;
      var avg4 = 0.0;
      if (avg3 > 500.0) {
        avg4 = 0.0;
      } else {
        avg4 = avg3;
      }
      setState(() {
        avgSpeed = avg4;
      });
//        print("avg ${avgSpeed.toString()}");
      print("countDistance ${countDistance}");
      if (this.countDistance > 0.09 && this.countDistance < 0.19) {
        print("int");
        sixtyFeetTimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(sixtyFeetTime == "-"){
          setState(() {
            this.sixtyFeetTime = convertTimeCount(countTimeDuration);
            this.sixtyFeetTime1 = sixtyFeetTimeList[1];
          });
        }

      } else if (this.countDistance > 0.19 && this.countDistance < 0.29) {
        twoHundredTimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(twoHundredTime == "-"){
          setState(() {
            this.twoHundredTime = convertTimeCount(countTimeDuration);
            this.twoHundredTime1 = twoHundredTimeList[1];
          });
        }

      } else if (this.countDistance > 0.29 && this.countDistance < 0.39) {
        threeHundredTimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(threeHundredTime == "-"){
          setState(() {
            this.threeHundredTime = convertTimeCount(countTimeDuration);
            this.threeHundredTime1 = threeHundredTimeList[1];
          });
        }

      } else if (this.countDistance > 0.39 && this.countDistance < 0.49) {
        fourHundredTimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(fourHundredTime == "-"){
          setState(() {
            this.fourHundredTime = convertTimeCount(countTimeDuration);
            this.fourHundredTime1 = fourHundredTimeList[1];
          });
        }

      } else if (this.countDistance > 0.49 && this.countDistance < 0.59) {
        fiveHundredTimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(fiveHundredTime == "-"){
          setState(() {
            this.fiveHundredTime = convertTimeCount(countTimeDuration);
            this.fiveHundredTime1 = fiveHundredTimeList[1];
          });
        }

      } else if (this.countDistance > 0.59 && this.countDistance < 0.69) {
        sixHundredTimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(sixHundredTime == "-"){
          setState(() {
            this.sixHundredTime = convertTimeCount(countTimeDuration);
            this.sixHundredTime1 = sixHundredTimeList[1];
          });
        }

      } else if (this.countDistance > 0.69 && this.countDistance < 0.79) {
        sevenHundredTimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(sevenHundredTime == "-"){
          setState(() {
            this.sevenHundredTime = convertTimeCount(countTimeDuration);
            this.sevenHundredTime1 = sevenHundredTimeList[1];
          });
        }

      } else if (this.countDistance > 0.79 && this.countDistance < 0.89) {
        eightHundredTimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(eightHundredTime == "-"){
          setState(() {
            this.eightHundredTime = convertTimeCount(countTimeDuration);
            this.eightHundredTime1 = eightHundredTimeList[1];
          });
        }

      } else if (this.countDistance > 0.89 && this.countDistance < 0.99) {
        nineHundredTimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(nineHundredTime == "-"){
          setState(() {
            this.nineHundredTime = convertTimeCount(countTimeDuration);
            this.nineHundredTime1 = nineHundredTimeList[1];
          });
        }

      } else if (this.countDistance > 0.99 && this.countDistance < 1.09) {
        oneThousandTimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(oneThousandTime == "-"){
          setState(() {
            this.oneThousandTime = convertTimeCount(countTimeDuration);
            this.oneThousandTime1 = oneThousandTimeList[1];
          });
        }

      } else if (this.countDistance > 1.09 && this.countDistance < 1.19) {
        oneThousand1TimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(oneThousand1Time == "-"){
          setState(() {
            this.oneThousand1Time = convertTimeCount(countTimeDuration);
            this.oneThousand1Time1 = oneThousand1TimeList[1];
          });
        }

      } else if (this.countDistance > 1.19 && this.countDistance < 1.29) {
        oneThousand2TimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(oneThousand2Time == "-"){
          setState(() {
            this.oneThousand2Time = convertTimeCount(countTimeDuration);
            this.oneThousand2Time1 = oneThousand2TimeList[1];
          });
        }

      } else if (this.countDistance > 1.29 && this.countDistance < 1.39) {
        oneThousand3TimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(oneThousand3Time == "-"){
          setState(() {
            this.oneThousand3Time = convertTimeCount(countTimeDuration);
            this.oneThousand3Time1 = oneThousand3TimeList[1];
          });
        }

      } else if (this.countDistance > 1.39 && this.countDistance < 1.49) {
        oneThousand4TimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(oneThousand4Time == "-"){
          setState(() {
            this.oneThousand4Time = convertTimeCount(countTimeDuration);
            this.oneThousand4Time1 = oneThousand4TimeList[1];
          });
        }

      } else if (this.countDistance > 1.49 && this.countDistance < 1.59999) {
        oneThousand5TimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(oneThousand5Time == "-"){
          setState(() {
            this.oneThousand5Time = convertTimeCount(countTimeDuration);
            this.oneThousand5Time1 = oneThousand5TimeList[1];
          });
        }

      } else if (this.countDistance > 1.59 && this.countDistance < 1.69) {
        oneThousand6TimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(oneThousand6Time == "-"){
          setState(() {
            this.oneThousand6Time = convertTimeCount(countTimeDuration);
            this.oneThousand6Time1 = oneThousand6TimeList[1];
          });
        }

      } else if (this.countDistance > 1.69 && this.countDistance < 1.79) {
        oneThousand7TimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(oneThousand7Time == "-"){
            setState(() {
              this.oneThousand7Time = convertTimeCount(countTimeDuration);
              this.oneThousand7Time1 = oneThousand7TimeList[1];
            });
        }

      } else if (this.countDistance > 1.79 && this.countDistance < 1.89) {
        oneThousand8TimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(oneThousand8Time == "-"){
          setState(() {
            this.oneThousand8Time = convertTimeCount(countTimeDuration);
            this.oneThousand8Time1 = oneThousand8TimeList[1];
          });
        }

      } else if (this.countDistance > 1.89 && this.countDistance < 1.99999) {
        oneThousand9TimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
        if(oneThousand9Time == "-"){
          setState(() {
            this.oneThousand9Time = convertTimeCount(countTimeDuration);
            this.oneThousand9Time1 = oneThousand9TimeList[1];
          });
        }

      } else if (this.countDistance > 1.9999 && this.countDistance < 2.99999) {
          twoThousandTimeList.add(mpstokmph(_velocity).toStringAsFixed(2));
          if (twoThousandTime == "-") {
            setState(() {
              this.twoThousandTime = convertTimeCount(countTimeDuration);
              this.twoThousandTime1 = twoThousandTimeList[1];
            });
          }
        }

      }
    }

  String convertTimeCount(String isTime) {
    var a1 = Duration(milliseconds: int.parse(isTime)).toString();
    var a2 = a1.substring(0, a1.length - 4);
    return a2;
  }



  void _onAccelerate(double speed) {
    print("Speed ${speed.toString()}");
    locator.getCurrentPosition().then(
      (Position updatedPosition) {
        _velocity = (speed + updatedPosition.speed) / 2;
        if (_velocity > 3) {
          _velocity = _velocity - 0.6;
        }
        if (_velocity > _highestVelocity) {
          _highestVelocity = _velocity;
        }
        _velocityUpdatedStreamController.add(_velocity);
        _velocityUpdatedStreamController2.add(_velocity);
        _velocityUpdatedStreamController3.add(_velocity);

        if (mpstokmph(_velocity) > 280) {
          eventObservable.add(mpstokmph(_velocity) + 30);
        } else if (mpstokmph(_velocity) > 200) {
          eventObservable.add(mpstokmph(_velocity));
        } else {
          eventObservable.add(mpstokmph(_velocity) - 10);
        }
      },
    );
//    print("_onAccelerate $_velocity");
  }

  Widget buildDistance(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(right: 2, left: 2, top: 1, bottom: 10),
//      color: AppTheme.colorBlack,
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
            ),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2, bottom: 2),
        child: Column(
          children: [
            build60FT(context, appStyle),
            build200(context, appStyle),
            build300(context, appStyle),
            build400(context, appStyle),
            build500(context, appStyle),
            build600(context, appStyle),
            build700(context, appStyle),
            build800(context, appStyle),
            build900(context, appStyle),
            build1000(context, appStyle),
            build1100(context, appStyle),
            build1200(context, appStyle),
            build1300(context, appStyle),
            build1400(context, appStyle),
            build1500(context, appStyle),
            build1600(context, appStyle),
            build1700(context, appStyle),
            build1800(context, appStyle),
            build1900(context, appStyle),
            build2000(context, appStyle),
          ],
        ),
      ),
    );
  }

  Widget build60FT(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '100m. ',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 45),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.sixtyFeetTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.sixtyFeetTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build200(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '200 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.twoHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.twoHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build300(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '300 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.threeHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.threeHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build400(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '400 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.fourHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.fourHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build500(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '500 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.fiveHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.fiveHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build600(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '600 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.sixHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.sixHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build700(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '700 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.sevenHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.sevenHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build800(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '800 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.eightHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.eightHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build900(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '900 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.nineHundredTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.nineHundredTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1000(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1000 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.oneThousandTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.oneThousandTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1100(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1100 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.oneThousand1Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.oneThousand1Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1200(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1200 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.oneThousand2Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.oneThousand2Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1300(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1300 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.oneThousand3Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.oneThousand3Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1400(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1400 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.oneThousand4Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.oneThousand4Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1500(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1500 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.oneThousand5Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.oneThousand5Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1600(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1600 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.oneThousand6Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.oneThousand6Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1700(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1700 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.oneThousand7Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.oneThousand7Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1800(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1800 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.oneThousand8Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.oneThousand8Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build1900(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1900 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.oneThousand9Time}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.oneThousand9Time1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build2000(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(
        bottom: 3,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                   <--- left side
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '2000 m.',
              style: appStyle.getTextStyle('normalText'),
            ),
            Container(
              width: appStyle.getWidth(percent: 40),
              height: appStyle.getHeight(percent: 5),
              margin: appStyle.getEdgeInsetsFromRatio(bottom: 1),
              decoration: BoxDecoration(
                color: AppTheme.colorBlack,
                borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                    ),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: appStyle.getEdgeInsetsFromRatio(right: 2),
                    child: Text(
                      '${this.twoThousandTime}',
                      style: TextStyle(fontSize: appStyle.getWidth(percent: 6), fontFamily: 'spyagency3cond', color: AppTheme.colorInfo),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '${this.twoThousandTime1}',
                  style: appStyle.getTextStyle('normalText'),
                ),
                Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 1),
                  child: Text(
                    'km/h',
                    style: appStyle.getTextStyle('smallGrey'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
