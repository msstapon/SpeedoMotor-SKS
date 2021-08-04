import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';

class NumpadButtonWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool haveBorder;
  final Function onPressed;
  final Color fontColor;
  const NumpadButtonWidget({Key key, this.text, this.icon, this.haveBorder = true, this.onPressed, this.fontColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    TextStyle buttonStyle = TextStyle(fontSize: appStyle.getWidth(percent: 6.5), color: fontColor);
    Widget label = icon != null
        ? Icon(
      icon,
      color: fontColor,
      size: 35.0,
    )
        : Text(this.text ?? '', style: buttonStyle);
    return Container(
     padding: appStyle.getEdgeInsetsFromRatio(top: 2),
      margin: appStyle.getEdgeInsets(all: 4),
      child: OutlineButton(
        borderSide: haveBorder ? BorderSide(color: AppTheme.colorBackgroundWhite) : BorderSide.none,
        highlightedBorderColor: icon != null ? Colors.transparent : Theme.of(context).primaryColor.withOpacity(0.3),
        splashColor: icon != null ? Colors.transparent : Theme.of(context).primaryColor.withOpacity(0.1),
        padding: appStyle.getEdgeInsetsFromRatio(all: 2),
        shape: CircleBorder(),
        onPressed: onPressed,
        child: label,
      ),
    );
  }
}
