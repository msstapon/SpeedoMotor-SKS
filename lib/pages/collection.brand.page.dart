import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:th.go.sks.racing_2/pages/calculator-cc/calculator.page.dart';
import 'package:th.go.sks.racing_2/pages/calculator-gear/calculator_gear.page.dart';
import 'package:th.go.sks.racing_2/pages/collection.motor.page.dart';
import 'package:th.go.sks.racing_2/pages/old-collection/collection.yamaha.page.dart';
import 'package:th.go.sks.racing_2/pages/new_collection/new_collection.honda.page.dart';
import 'package:th.go.sks.racing_2/pages/new_collection/new_collection.kawazaki.page.dart';
import 'package:th.go.sks.racing_2/pages/new_collection/new_collection.suzuki.page.dart';
import 'package:th.go.sks.racing_2/pages/new_collection/new_collection.vespa.page.dart';
import 'package:th.go.sks.racing_2/pages/new_collection/new_collection.yamaha.page.dart';
import 'package:th.go.sks.racing_2/widgets/dialog/message.dialog.widget.dart';

class CollectionBrand extends StatefulWidget {
  final String type;
  final String step;
  final String brand;

  CollectionBrand({Key key, @required this.type, @required this.step,this.brand}) : super(key: key);

  @override
  _CollectionBrandState createState() => _CollectionBrandState();
}

class _CollectionBrandState extends State<CollectionBrand> {
  List<String> nameCar = [
    'Yamaha',
    'Honda',
    'Kawazaki',
    'Suzuki',
    'Vespa',
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
    '9.3',
    '68.567',
    '68.567',
    '41.3',
    '57.9',
  ];

  List<String> image = [
    'lib/images/collection_motor/yamaha.png',
    'lib/images/collection_motor/honda.png',
    'lib/images/collection_motor/kawa2.jpeg',
    'lib/images/collection_motor/suzu2.jpeg',
    'lib/images/collection_motor/ves3.png',
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
          5,
              (index) => {
            "id": index,
            "name": nameCar[index],
            "image": image[index],
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Scaffold(
      backgroundColor: AppTheme.colorBlack.withOpacity(0.95),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/collection_motor/new_icon/sks-page-07-111.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: appStyle.getHeight(percent: 50),
              child: Padding(
                padding: appStyle.getEdgeInsetsFromRatio(top: 15,left: 4,right: 4),
                child: GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1, crossAxisSpacing: 1, mainAxisSpacing: 1),
                    itemCount: 5,
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                        onTap: () async {
                            if(index == 0){
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppTheme(
                                    child: NewCollectionYamaha(type: widget.type,),
                                  ),
                                ),
                              );
                            }else if(index == 1){
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppTheme(
                                    child: CollectionHonda(type: widget.type,),
                                  ),
                                ),
                              );
                            }else if(index == 2){
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppTheme(
                                    child: CollectionKawazaki(type: widget.type,),
                                  ),
                                ),
                              );
                            }else if(index == 3){
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppTheme(
                                    child: CollectionSuzuki(type: widget.type,),
                                  ),
                                ),
                              );
                            }else if(index == 4){
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppTheme(
                                    child: CollectionVespa(type: widget.type,),
                                  ),
                                ),
                              );
                            }
                        },
                        child: Container(
                            margin: appStyle.getEdgeInsetsFromRatio(all: 1),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
//                                  padding:  appStyle.getEdgeInsetsFromRatio(top: 1),
                                  child: Image.asset(
                                    'lib/images/collection_motor/Artboard_${index+1}.png',
                                    width: appStyle.getWidth(percent: 26),
                                    fit: BoxFit.fill,
//                                    color: index ==4 ? AppTheme.colorBackgroundWhite: null,
                                  ),
                                ),
//                                index == 3  || index == 4 ? new Container() :
//                                Container(
//                                  alignment: Alignment.center,
//                                  child: Text(
//                                    '${myProducts[index]["name"]}',
//                                    style: TextStyle(fontSize: appStyle.getWidth(percent: 5), fontFamily: 'spyagency3cond', color: AppTheme.colorBackgroundWhite),
//                                  ),
//                                )
                              ],
                            ),
                            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15))),
                      );
                    }),
              ),
            ),

          ],
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
