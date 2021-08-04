// @dart=2.9
import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';

enum TypeMessageDialog { info, warning, error, success }

class MessageDialogWidget extends StatelessWidget {
  final String title, message, buttonText;
  final TypeMessageDialog typeDialog;
  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
  final Function btnOkOnPress;

  MessageDialogWidget(
      {@required this.title,
        @required this.message,
        this.buttonText,
        @required this.typeDialog,
        this.btnOkOnPress});

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    _buildCustomStyle(context);
    return _buildAlert(appStyle, context);
  }

  Future<void> showMessageDialog(BuildContext context) async {
    AppStyle appStyle = new AppStyle(context);
    _buildCustomStyle(context);
    FocusScope.of(context).requestFocus(new FocusNode());
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return _buildAlert(appStyle, context);
        },
        barrierDismissible: false);
  }

  _buildAlert(AppStyle appStyle, BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      content: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    getIconButtonAction(typeDialog),
                    color: AppTheme.colorPrimaryDark,
                    size: appStyle.getWidth(percent: 6),
                  ),
                  // new Container(width: 10,),
                  new Text(
                    title,
                    style: appStyle.getTextStyle('smallBlack'),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            SizedBox(
              height: appStyle.getHeight(percent: 0),
            ),
            Divider(
              color: AppTheme.colorGrey,
              height: appStyle.getHeight(percent: 1),
            ),
            Padding(
              padding: appStyle.getEdgeInsetsFromRatio(all: 0),
              child: new Text(
                message,
                style: appStyle.getTextStyle('smallBlack'),
                textAlign: TextAlign.center,
              ),
            ),
            new Container(
              height: appStyle.getHeight(percent: 2),
            ),
            new Container(
              margin: appStyle.getEdgeInsetsFromRatio(left: 3, right: 3),
              height: appStyle.getHeight(percent: 5),
//              padding: appStyle.getEdgeInsetsFromRatio(left: 22, right: 22),
              // EdgeInsets.only(top: 10.0, bottom: 0.0, left: 100.0, right: 100.0),
              child: new FlatButton(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text(buttonText != null ? buttonText : 'ตกลง',
                          style: appStyle.getTextStyle('smallWhite2')),
                    ],
                  ),
                  onPressed: () {
                    if (btnOkOnPress != null)
                      btnOkOnPress();
                    else
                      Navigator.of(context).pop();
                  },
                  color: getButtonColorAction(typeDialog),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> customStyle = new Map<String, dynamic>();

  _buildCustomStyle(BuildContext context) {
    customStyle['title'] = TextStyle(
        fontSize: Theme.of(context).textTheme.headline6.fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: "Kanit",
        color: AppTheme.colorFontBlack);
  }

  Color getButtonColorAction(TypeMessageDialog typeDialog) {
    if (TypeMessageDialog.info == typeDialog) {
      return AppTheme.colorInfo;
    } else if (TypeMessageDialog.error == typeDialog) {
      return AppTheme.colorError;
    } else if (TypeMessageDialog.warning == typeDialog) {
      return AppTheme.colorWarning;
    } else if (TypeMessageDialog.success == typeDialog) {
      return AppTheme.colorSuccess;
    } else {
      return AppTheme.colorPrimary;
    }
  }

  IconData getIconButtonAction(TypeMessageDialog typeDialog) {
    if (TypeMessageDialog.info == typeDialog) {
      return Icons.info_outline;
    } else if (TypeMessageDialog.error == typeDialog) {
      return Icons.error;
    } else if (TypeMessageDialog.warning == typeDialog) {
      return Icons.warning;
    } else if (TypeMessageDialog.success == typeDialog) {
      return Icons.check_circle;
    } else {
      return Icons.check_circle;
    }
  }
}
