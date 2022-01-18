import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.config.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:th.go.sks.racing_2/pages/calculator-cc/calculator.page.dart';
import 'package:th.go.sks.racing_2/pages/calculator-gear/calculator_gear.page.dart';
import 'package:th.go.sks.racing_2/utilities/utilities.dart';
import 'package:th.go.sks.racing_2/widgets/dialog/confirm.dialog.widget.dart';
import 'package:kbt_flutter_package/utilities/shared.preferences.util.dart';

class CollectionHonda extends StatefulWidget {
  final String type;
  final String step;
  final String brand;
  CollectionHonda({Key key, @required this.type, @required this.step, this.brand}) : super(key: key);
  @override
  _CollectionHondaState createState() => _CollectionHondaState();
}

class _CollectionHondaState extends State<CollectionHonda> {
  List<String> nameCar = [
    'W110i',
    'Sonic',
    'W125i',
    'W125iบังลม',
    'W100',
    'Dream',
    'CT125',
    'PCX',
    'MSXsf',
    'Forza300',
    'CBR250rr',
    'CBR300',
    'MSX GROM Monkey'
  ];

  List<String> cc = [
    '109.17',
    '124.7',
    '124.89',
    '124.8',
    '97.1',
    '109.1',
    '124',
    '124.7',
    '124.9',
    '279',
    '249.60',
    '286',
    '124.9'
  ];
  List<String> peroid = [
    '9.3',
    '11',
    '9.3',
    '9.3',
    '9.0',
    '9.0',
    '9.3',
    '11',
    '9.3',
    '10.5',
    '10.7',
    '10.7',
    '10.0'
//  ลูก50 ชัก63.121
//  อัตราส่วน :1

  ];
  List<String> input1 = [
    '50',
    '58',
    '52.4',
    '52.4',
    '50',
    '50',
    '52.4',
    '58',
    '52.4',
    '72',
    '76',
    '76',
    '50'
  ];
  List<String> input2 = [
    '55.597',
    '47.2',
    '57.913',
    '57.9',
    '49.5',
    '55.6',
    '57.9',
    '47.2',
    '57.9',
    '68.6',
    '55',
    '63',
    '63.121'
  ];



  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: appStyle.getHeight100(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/images/collection_motor/new_icon/sks-page-08-118.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
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
                          margin: appStyle.getEdgeInsetsFromRatio(top: 6,left: 5),
                          height: appStyle.getHeight(percent: 7),
                          width: appStyle.getWidth(percent: 10),
                          child: new Image.asset(
                            'lib/images/collection_motor/new_icon/sks-page-07-117.png',
                          ),
                        )
                    ),
                    buildCarModel(context, appStyle),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarModel(BuildContext context, AppStyle appStyle) {
    return Container(
      margin: appStyle.getEdgeInsetsFromRatio(right: 2, left: 2, top: 12,bottom: 10),
//      color: AppTheme.colorBlack,
      decoration: BoxDecoration(
        color: AppTheme.colorBlack,
        borderRadius: BorderRadius.all(
            Radius.circular(25.0) //                 <--- border radius here
        ),
        border: Border.all(color : Colors.white, width: 0.5,),
        ),
      child: Container(
        margin: appStyle.getEdgeInsetsFromRatio(top: 2,bottom: 2),
        child: Column(
          children: List.generate(widget.type == "4" ?  3 : nameCar.length,(index) {
            return  InkWell(
              onTap: () async {
                if (widget.type == '1') {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppTheme(
                        child: CalculatorCCPage(
                          input1: input1[index],
                          input2: input2[index],
                          peroid: peroid[index],
                          cc: cc[index],
                          nameCar: nameCar[index],
                        ),
                      ),
                    ),
                  );
                } else if (widget.type == '4') {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppTheme(
                        child: CalculatorGearPage(
                          nameCar: nameCar[index],
                        ),
                      ),
                    ),
                  );
                }
              },
              child: Container(
                margin: appStyle.getEdgeInsetsFromRatio(bottom: 3,),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide( //                   <--- left side
                      color: Colors.white,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Container(
                  margin: appStyle.getEdgeInsetsFromRatio(left: 3,right: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${nameCar[index]}',
                        style: appStyle.getTextStyle('normalText'),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: AppTheme.colorFontWhite,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
//          [

//            Container(
//              height: appStyle.getHeight(percent: 0.1),
//              width: appStyle.getWidth100(),
//              color: AppTheme.colorBackgroundWhite,
//            ),
//          ],
        ),
      ),
    );
  }

}
