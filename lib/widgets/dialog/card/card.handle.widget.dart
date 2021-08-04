import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';

class CardHandleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Container(
                decoration: appStyle.getCardStype('normalShadow'),
                width: appStyle.getWidth(percent: 80),
                height: appStyle.getHeight(percent: 20),
                child: new Center(
                  child: Text(
                    'ไม่มีข้อมูลในขณะนี้',
                    style: appStyle.getTextStyle('normalBlack'),
                  ),
                )),
          )
        ]);
  }
}