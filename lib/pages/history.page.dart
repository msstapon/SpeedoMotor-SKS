import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:th.go.sks.racing_2/models/history.model.dart';
import 'package:th.go.sks.racing_2/models/response-upload.model.api.dart';
import 'package:th.go.sks.racing_2/pages/speed.range.page.dart';
import 'package:th.go.sks.racing_2/services/gps.service.dart';
import 'package:kbt_flutter_package/utilities/date.format.util.dart';
import 'package:th.go.sks.racing_2/utilities/utilities.dart';
import 'package:th.go.sks.racing_2/widgets/dialog/confirm.dialog.widget.dart';
import 'package:th.go.sks.racing_2/widgets/dialog/message.dialog.widget.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key, this.userKey}) : super(key: key);
  int userKey;

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<HistoryModel> getFutureRecord() async {
    return await GpsServices.getHistory(userKey: widget.userKey);
  }

  submitDeleteSpeedTest({int userKey, int speedTestKey}) async {
    try {
      Navigator.of(context, rootNavigator: true).pop();
      ResponseUploadModelApi result = await GpsServices().deleteSpeedTest(userKey: userKey, speedTestKey: speedTestKey);
      if (result.isSucces) {
        MessageDialogWidget(
          title: 'สำเร็จ',
          message: 'ลบรายการสำร็จ',
          typeDialog: TypeMessageDialog.success,
          btnOkOnPress: () {
            Navigator.pop(context);
          },
        ).showMessageDialog(context);
      }
    } catch (error) {
      Utilities.defaultHandler(error, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    DateFormatUtil dateFormatUtil = new DateFormatUtil();
    final appStyle = AppStyle(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppTheme.colorBlack,
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(color: Colors.white),
        backgroundColor: AppTheme.colorBlack,
        title: Text(
          'ประวัติ',
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage("lib/images/collection_motor/new_icon/sks-page-01-04.png"),
          )),
          child: Container(
            child: Column(
              children: [
                FutureBuilder<HistoryModel>(
                  future: getFutureRecord(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      if (snapshot.data.data.length == 0) {
                        return Container(
                          alignment: Alignment.center,
                          margin: appStyle.getEdgeInsetsFromRatio(top: 2.5),
                          height: appStyle.getHeight(percent: 50),
//                      width: appStyle.getWidth(percent: 100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: appStyle.getEdgeInsetsFromRatio(top: 2),
                                child: Text(
                                  'ไม่มีข้อมูล',
                                  style: TextStyle(
                                      fontSize: appStyle.getWidth(percent: 6),
                                      color: AppTheme.colorBackgroundWhite,
                                      fontFamily: 'Kanit',
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Container(
                            margin: appStyle.getEdgeInsetsFromRatio(
                              top: 0,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: appStyle.getEdgeInsetsFromRatio(top: 0),
                              itemCount: snapshot.data.data.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3, top: 1, bottom: 1),
                                        decoration: BoxDecoration(
                                            borderRadius: new BorderRadius.all(Radius.circular(8)),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 0, // has the effect of softening the shadow
                                                spreadRadius: 0.0, // has the effect of extending the shadow
                                                offset: Offset(
                                                  0.0, // horizontal, move right 10
                                                  0.0, // vertical, move down 10,
                                                ),
                                              )
                                            ]),
                                        width: appStyle.getWidth(percent: 100),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    margin: appStyle.getEdgeInsetsFromRatio(left: 4, top: 1),
                                                    child: Row(
                                                      textBaseline: TextBaseline.alphabetic,
                                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            child: Text(
                                                              'วันที่ : ${dateFormatUtil.formatDateTimeWithFormat(snapshot.data.data[index].createdDt, 'th', 'dd MMMM HH:mm')} น.',
                                                              style: TextStyle(
                                                                  fontSize: appStyle.getWidth(percent: 4),
                                                                  color: AppTheme.colorBlack,
                                                                  fontFamily: 'Kanit',
                                                                  fontWeight: FontWeight.normal),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: appStyle.getEdgeInsetsFromRatio(left: 4, top: 1),
                                                    child: Row(
                                                      textBaseline: TextBaseline.alphabetic,
                                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            child: Text(
                                                              'กิโลเมตรที่วิ่ง : ',
                                                              style: TextStyle(
                                                                  fontSize: appStyle.getWidth(percent: 4),
                                                                  color: AppTheme.colorBlack,
                                                                  fontFamily: 'Kanit',
                                                                  fontWeight: FontWeight.normal),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 4,
                                                          child: Text(
                                                            '${snapshot.data.data[index].total} KM',
                                                            style: TextStyle(
                                                                fontSize: appStyle.getWidth(percent: 4),
                                                                color: AppTheme.colorBlack,
                                                                fontFamily: 'Kanit',
                                                                fontWeight: FontWeight.normal),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: appStyle.getEdgeInsetsFromRatio(left: 4, top: 1),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            'Max.Speed : ',
                                                            style: TextStyle(
                                                                fontSize: appStyle.getWidth(percent: 4),
                                                                color: AppTheme.colorBlack,
                                                                fontFamily: 'Kanit',
                                                                fontWeight: FontWeight.normal),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 4,
                                                          child: Text(
                                                            '${snapshot.data.data[index].maxSpeed} KM/H',
                                                            style: TextStyle(
                                                                fontSize: appStyle.getWidth(percent: 4),
                                                                color: AppTheme.colorBlack,
                                                                fontFamily: 'Kanit',
                                                                fontWeight: FontWeight.normal),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: appStyle.getEdgeInsetsFromRatio(left: 4, top: 1),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            'AVG.Speed : ',
                                                            style: TextStyle(
                                                                fontSize: appStyle.getWidth(percent: 4),
                                                                color: AppTheme.colorBlack,
                                                                fontFamily: 'Kanit',
                                                                fontWeight: FontWeight.normal),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 4,
                                                          child: Text(
                                                            '${snapshot.data.data[index].average} KM/H',
                                                            style: TextStyle(
                                                                fontSize: appStyle.getWidth(percent: 4),
                                                                color: AppTheme.colorBlack,
                                                                fontFamily: 'Kanit',
                                                                fontWeight: FontWeight.normal),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                ConfirmDialogWidget(
                                                    title: 'แจ้งเตือน',
                                                    message: 'คุณต้องการลบข้อมูลใช่หรือไม่',
                                                    btnOkOnPress: () {
                                                      submitDeleteSpeedTest(
                                                          userKey: snapshot.data.data[index].userKey,
                                                          speedTestKey: snapshot.data.data[index].speedTestKey);
//                                                    submit();
                                                    }).showConfirmDialog(context);
                                              },
                                              child: Container(
//                                              width: appStyle.getWidth(percent: 5),
                                                child: Icon(
                                                  Icons.delete_outline_outlined,
                                                  color: AppTheme.colorRed,
                                                  size: 35,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_right_rounded,
                                              color: AppTheme.colorBlack,
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AppTheme(
                                              child: SpeedRang(
                                                sixtyFeetTime: snapshot.data.data[index].speed100m,
                                                twoHundredTime: snapshot.data.data[index].speed200m,
                                                threeHundredTime: snapshot.data.data[index].speed300m,
                                                fourHundredTime: snapshot.data.data[index].speed400m,
                                                fiveHundredTime: snapshot.data.data[index].speed500m,
                                                sixHundredTime: snapshot.data.data[index].speed600m,
                                                sevenHundredTime: snapshot.data.data[index].speed700m,
                                                eightHundredTime: snapshot.data.data[index].speed800m,
                                                oneThousandTime: snapshot.data.data[index].speed1000m,
                                                twoThousandTime: snapshot.data.data[index].speed2000m,
                                                sixtyFeetTime1: snapshot.data.data[index].time100m,
                                                twoHundredTime1: snapshot.data.data[index].time200m,
                                                threeHundredTime1: snapshot.data.data[index].time300m,
                                                fourHundredTime1: snapshot.data.data[index].time400m,
                                                fiveHundredTime1: snapshot.data.data[index].time500m,
                                                sixHundredTime1: snapshot.data.data[index].time600m,
                                                sevenHundredTime1: snapshot.data.data[index].time700m,
                                                eightHundredTime1: snapshot.data.data[index].time800m,
                                                nineHundredTime: snapshot.data.data[index].speed900m,
                                                oneThousandTime1: snapshot.data.data[index].time1000m,
                                                oneThousand1Time1: snapshot.data.data[index].time1100m,
                                                oneThousand2Time1: snapshot.data.data[index].time1200m,
                                                oneThousand3Time1: snapshot.data.data[index].time1300m,
                                                oneThousand4Time1: snapshot.data.data[index].time1400m,
                                                oneThousand5Time1: snapshot.data.data[index].time1500m,
                                                oneThousand6Time1: snapshot.data.data[index].time1600m,
                                                oneThousand7Time1: snapshot.data.data[index].time1700m,
                                                oneThousand8Time1: snapshot.data.data[index].time1800m,
                                                oneThousand9Time1: snapshot.data.data[index].time1900m,
                                                twoThousandTime1: snapshot.data.data[index].time2000m,
                                                oneThousand1Time: snapshot.data.data[index].speed1100m,
                                                oneThousand2Time: snapshot.data.data[index].speed1200m,
                                                oneThousand3Time: snapshot.data.data[index].speed1300m,
                                                oneThousand4Time: snapshot.data.data[index].speed1400m,
                                                oneThousand5Time: snapshot.data.data[index].speed1500m,
                                                oneThousand6Time: snapshot.data.data[index].speed1600m,
                                                oneThousand7Time: snapshot.data.data[index].speed1700m,
                                                oneThousand8Time: snapshot.data.data[index].speed1800m,
                                                oneThousand9Time: snapshot.data.data[index].speed1900m,
                                                nineHundredTime1: snapshot.data.data[index].time900m,
                                                maxSpeed: snapshot.data.data[index].maxSpeed,
                                                avgSpeed: snapshot.data.data[index].average,
                                                totalKm: snapshot.data.data[index].total,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        }
                      }
                    } else {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
