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

class CollectionKawazaki extends StatefulWidget {
  final String type;
  final String step;
  final String brand;
  CollectionKawazaki({Key key, @required this.type, @required this.step, this.brand}) : super(key: key);
  @override
  _CollectionKawazakiState createState() => _CollectionKawazakiState();
}

class _CollectionKawazakiState extends State<CollectionKawazaki> {
  List<String> nameCar = [
    'Cheer110',
    'Kr150',
    'Ninja250',
    'Ninja300',

  ];

  List<String> cc = [
    '112',
    '148',
    '249',
    '296',
  ];
  List<String> peroid = [
    '9.5',
    '7.2',
    '11.3',
    '10.6',

  ];
  List<String> input1 = [
    '53',
    '59',
    '62',
    '62',

  ];
  List<String> input2 = [
    '50.6',
    '54.4',
    '41.2',
    '49',
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
        ),
      ),
    );
  }

}
