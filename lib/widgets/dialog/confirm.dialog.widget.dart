import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';

class ConfirmDialogWidget /*extends StatelessWidget*/ {
  final String title, message, buttonOkText, buttonCancelText;
  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
  final Function btnOkOnPress;
  final Function btnCancelOnPress;
  bool swapPosition = false;

  ConfirmDialogWidget({@required this.title, @required this.message, this.buttonOkText, this.buttonCancelText, this.btnOkOnPress,this.btnCancelOnPress,this.swapPosition});

  @override
  Future<void> showConfirmDialog(BuildContext context) async {
    AppStyle appStyle = new AppStyle(context);
    _buildCustomStyle(context);
    FocusScope.of(context).requestFocus(new FocusNode());
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
            content: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                    height: appStyle.getHeight(percent: 4),
                    child: new Text(
                      title,
                      style: TextStyle(
                          fontSize: appStyle.getWidth(percent: 4),
                          color: AppTheme.colorBlack,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // SizedBox(
                  //   height: appStyle.getHeight(percent: 0.5),
                  // ),
                  Divider(
                    color: AppTheme.colorGrey,
                    height: appStyle.getHeight(percent: 1),
                  ),
                  Padding(
                    padding:appStyle.getEdgeInsetsFromRatio(all: 0),
                    child: new Text(
                        message,
                        style: TextStyle(
                            fontSize: appStyle.getWidth(percent: 4),
                            color: AppTheme.colorBlack,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.normal
                        ),
                        textAlign: TextAlign.left
                    ),
                  ),
                  // new Container(height: 20,),
                  swapPosition == true? Container(
                      height: appStyle.getHeight(percent: 6),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: new FlatButton(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon(
                                    //   Icons.check_circle,
                                    //   color: AppTheme.colorBackgroundWhite,
                                    //   size: appStyle.getWidth(percent: 2),
                                    // ),
                                    // new Container(width: appStyle.getWidth100(),),
                                    new Text(buttonOkText != null ? buttonOkText: 'ตกลง',
                                        style: TextStyle(
                                            fontSize: appStyle.getWidth(percent: 4),
                                            color: AppTheme.colorBlack,
                                            fontFamily: 'Kanit',
                                            fontWeight: FontWeight.normal
                                        ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  if(btnOkOnPress != null)
                                    btnOkOnPress();
                                  else Navigator.of(context).pop();
                                },
                                color: AppTheme.colorPrimaryDark,
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0))
                            ),
                          ),
                          SizedBox(
                            width: appStyle.getWidth(percent: 1),
                          ),
                          Expanded(
                            flex: 1,
                            child: new FlatButton(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon(
                                    //   Icons.cancel,
                                    //   color: AppTheme.colorBackgroundWhite,
                                    //   size: appStyle.getWidth(percent: 2),
                                    // ),
                                    // new Container(width: appStyle.getWidth100(),),
                                    new Text(buttonCancelText != null ? buttonCancelText: 'ยกเลิก',
                                        style: TextStyle(
                                            fontSize: appStyle.getWidth(percent: 4),
                                            color: AppTheme.colorBackgroundWhite,
                                            fontFamily: 'Kanit',
                                            fontWeight: FontWeight.normal
                                        ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  if(btnCancelOnPress != null)
                                    btnCancelOnPress();
                                  else Navigator.of(context).pop();
                                },
                                color: AppTheme.colorGrey,
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0))
                            ),
                          ),
                        ],
                      )
                  ) : Container(
                      height: appStyle.getHeight(percent: 6),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: new FlatButton(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon(
                                    //   Icons.cancel,
                                    //   color: AppTheme.colorBackgroundWhite,
                                    //   size: appStyle.getWidth(percent: 2),
                                    // ),
                                    // new Container(width: appStyle.getWidth100(),),
                                    new Text(buttonCancelText != null ? buttonCancelText: 'ยกเลิก',
                                        style: TextStyle(
                                            fontSize: appStyle.getWidth(percent: 4),
                                            color: AppTheme.colorBackgroundWhite,
                                            fontFamily: 'Kanit',
                                            fontWeight: FontWeight.normal
                                        ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  if(btnCancelOnPress != null)
                                    btnCancelOnPress();
                                  else Navigator.of(context).pop();
                                },
                                color: AppTheme.colorCard,
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0))
                            ),
                          ),
                          SizedBox(
                            width: appStyle.getWidth(percent: 1),
                          ),
                          Expanded(
                            flex: 1,
                            child: new FlatButton(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon(
                                    //   Icons.check_circle,
                                    //   color: AppTheme.colorBackgroundWhite,
                                    //   size: appStyle.getWidth(percent: 2),
                                    // ),
                                    // new Container(width: appStyle.getWidth100(),),
                                    new Text(buttonOkText != null ? buttonOkText: 'ตกลง',
                                        style: TextStyle(
                                            fontSize: appStyle.getWidth(percent: 4),
                                            color: AppTheme.colorBlack,
                                            fontFamily: 'Kanit',
                                            fontWeight: FontWeight.normal
                                        ),),
                                  ],
                                ),
                                onPressed: () {
                                  if(btnOkOnPress != null)
                                    btnOkOnPress();
                                  else Navigator.of(context).pop();
                                },
                                color: AppTheme.colorPrimaryDark,
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0))
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          );
        },
        barrierDismissible: false
    );
  }
  Map<String, dynamic> customStyle = new Map<String, dynamic>();
  _buildCustomStyle(BuildContext context) {
    customStyle['title'] = TextStyle(
        fontSize: Theme.of(context).textTheme.headline6.fontSize,
        fontWeight:FontWeight.normal,
        fontFamily: Theme.of(context).textTheme.headline6.fontFamily,
        color: AppTheme.colorFontBlack
    );
  }
}
