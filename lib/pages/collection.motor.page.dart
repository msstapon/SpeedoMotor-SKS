import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:th.go.sks.racing_2/pages/calculator-cc/calculator.page.dart';
import 'package:th.go.sks.racing_2/pages/calculator-gear/calculator_gear.page.dart';

class CollectionMotor extends StatefulWidget {
  final String type;
  final String step;
  final String brand;

  CollectionMotor({Key key, @required this.type, @required this.step, this.brand}) : super(key: key);

  @override
  _CollectionMotorState createState() => _CollectionMotorState();
}

class _CollectionMotorState extends State<CollectionMotor> {
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
    'MIO115',
  ];
  List<String> cc = [
    '109.17',
    '124.7',
    '124.89',
    '124.8',
    '79.1',
    '109.1',
    '124',
    '124.7',
    '124',
    '279.17',
    '249',
    '286',
    '113.7',
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
    '11.5',
    '11.5',
    '8.8',
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
    '62',
    '62',
    '50',
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
    '68.567',
    '68.567',
    '41.3',
    '57.9',
  ];

  List<Map> myProducts;

  @override
  void initState() {
    // TODO: implement initState
    setFirstText();
//     setFirstData();
    super.initState();
  }

  setFirstText() async {
    setState(() {
      myProducts = List.generate(
          12,
          (index) => {
                "id": index,
                "name": nameCar[index],
                "image": "motor${index.toString()}.png",
                "cc": cc[index],
                "peroid": peroid[index],
                "input1": input1[index],
                "input2": input2[index]
              }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.step}',
          style: appStyle.getTextStyle('titleText'),
          // style: appStyle.getTextStyle('titleText'),
        ),
        centerTitle: true,
        backgroundColor: AppTheme.colorPrimaryDark,
        actions: [
          Container(
            child: Image.asset(
              'lib/images/collection_motor/logo.png',
              width: appStyle.getWidth(percent: 30),
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
      backgroundColor: AppTheme.colorBlack.withOpacity(0.95),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/collection_motor/newbg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: appStyle.getEdgeInsetsFromRatio(all: 4),
          child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1, crossAxisSpacing: 1, mainAxisSpacing: 1),
              itemCount: widget.type == '4'
                  ? 3
                  : widget.type == '1'
                      ? myProducts.length
                      : 0,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
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
                      margin: appStyle.getEdgeInsetsFromRatio(all: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: appStyle.getEdgeInsetsFromRatio(top: 1),
                            child: Image.asset(
                              'lib/images/collection_motor/${myProducts[index]["name"]}.png',
                              width: index == 1 || index == 3 || index == 7 || index == 8 || index == 9 || index == 10 || index == 11
                                  ? appStyle.getWidth(percent: 17)
                                  : appStyle.getWidth(percent: 33),
                            ),
                          ),
                          Text(
                            '${myProducts[index]["name"]}',
                            style: appStyle.getTextStyle('normalText'),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15))),
                );

//                  Container(
//                    margin: appStyle.getEdgeInsetsFromRatio(all: 1),
//                    alignment: Alignment.center,
//                    child: Column(
//                      mainAxisSize: MainAxisSize.min,
//                      children: <Widget>[
//                        IconButton(
//                          icon: Image.asset(
//                            'lib/images/collection_motor/pngegg.png',
//                           width: 1000,
//                           height: 1000,
//                          ),
//                          onPressed: () {},
//                        ),

//                      ],
//                    ),
//                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15)));
              }),
        ), /* add child content here */
      ),
    );
  }
}

class CollectionCar {
  const CollectionCar({this.id, this.name, this.cc, this.period});

  final int id;
  final String name;
  final String cc;
  final String period;
}
