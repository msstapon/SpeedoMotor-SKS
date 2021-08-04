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

class CollectionKawazakiGear extends StatefulWidget {
  final String type;
  final String step;
  final String brand;
  CollectionKawazakiGear({Key key, @required this.type, @required this.step, this.brand}) : super(key: key);
  @override
  _CollectionKawazakiGearState createState() => _CollectionKawazakiGearState();
}

class _CollectionKawazakiGearState extends State<CollectionKawazakiGear> {
  List<String> nameCar = [
    'KR150',

  ];

  List<String> cc = [
    '124.5',
  ];
  List<String> peroid = [
    '9.3',

  ];
  List<String> input1 = [
    '57.5',

  ];
  List<String> input2 = [
    '48.8',
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
                image: AssetImage("lib/images/collection_motor/new_icon/sks-page-10-155.png"),
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
          children: List.generate(nameCar.length,(index) {
            return  InkWell(
              onTap: () async {
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
        ),
      ),
    );
  }

}
