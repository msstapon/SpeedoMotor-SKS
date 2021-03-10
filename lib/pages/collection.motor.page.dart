import 'package:flutter/material.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/pages/calculator-cc/calculator.page.dart';

class CollectionMotor extends StatefulWidget {
  final String type;
  final String step;

  CollectionMotor({Key key, @required this.type, @required this.step}) : super(key: key);

  @override
  _CollectionMotorState createState() => _CollectionMotorState();
}

class _CollectionMotorState extends State<CollectionMotor> {
  final List<Map> myProducts = List.generate(12, (index) => {"id": index, "name": "Motor", "image": "motor${index.toString()}.png"}).toList();

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
            margin: appStyle.getEdgeInsetsFromRatio(right: 1.5,top: 0.5,bottom: 0.5),
            child: Image.asset(
              'lib/images/collection_motor/logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      backgroundColor: AppTheme.colorBlack.withOpacity(0.95),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/images/collection_motor/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: appStyle.getEdgeInsetsFromRatio(all: 4),
          child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1, crossAxisSpacing: 1, mainAxisSpacing: 1),
              itemCount: myProducts.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: () async {
//                    AppTheme(child: PincodePage(),));
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppTheme(child: CalculatorCCPage(),),
                      ),
                    );
                  },
                  child: Container(
                      margin: appStyle.getEdgeInsetsFromRatio(all: 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                    Container(
                      padding: appStyle.getEdgeInsetsFromRatio(top: 1),
                    child : Image.asset(
                          'lib/images/collection_motor/pngegg.png',
                          width: appStyle.getWidth(percent: 19),
                        ),
                    ),
                        Text(
                          '${myProducts[index]["name"]} ${index + 1}',
                          style: appStyle.getTextStyle('normalText'),
                        )
                      ],
                    ),
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15))
                  ),
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
