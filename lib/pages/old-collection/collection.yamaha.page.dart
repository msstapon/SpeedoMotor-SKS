import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/pages/calculator-cc/calculator.page.dart';
import 'package:th.go.dms.cancer.anywhere/pages/calculator-gear/calculator_gear.page.dart';

class CollectionYamaha extends StatefulWidget {
  final String type;
  final String step;
  final String brand;

  CollectionYamaha({Key key, @required this.type, @required this.step,this.brand}) : super(key: key);

  @override
  _CollectionYamahaState createState() => _CollectionYamahaState();
}

class _CollectionYamahaState extends State<CollectionYamaha> {
  List<String> nameCar = [
    'Arrox',
  ];
  List<String> cc = [
    '155',

  ];
  List<String> peroid = [
    '10.5',
  ];
  List<String> input1 = [
    '58.0',
  ];
  List<String> input2 = [
    '55.597',

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
          1,
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
              itemCount:  widget.type == '1'
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
                            child: CalculatorGearPage(nameCar: nameCar[index],),
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
                              'lib/images/collection_motor/Arrox.png',
                              width: appStyle.getWidth(percent: 19),
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
