import 'package:th.go.sks.racing_2/config/app.theme.config.dart';
import 'package:th.go.sks.racing_2/config/app.size.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppStyle {
  BuildContext _context;
  AppSizeConfig _appSizeConfig;

  AppStyle(BuildContext context) {
    _context = context;
    _appSizeConfig = new AppSizeConfig(_context);
    _buildCustomTextStyle();
    _buildCustomButtonStyle();
    _buildCustomCardStyle();
  }

  double getWidth({double percent}){
    if(percent != null) {
      return _appSizeConfig.getBlockSizeHorizontal(percent: percent);
    } else {
      return _appSizeConfig.getBlockSizeHorizontal(percent: 1);
    }
  }

  double getWidth100(){
    return _appSizeConfig.screenWidth;
  }

  double getHeight({double percent}){
    if(percent != null) {
      return _appSizeConfig.getBlockSizeVertical(percent: percent);
    } else {
      return _appSizeConfig.getBlockSizeVertical(percent: 1);
    }
  }

  double getHeight100(){
    return _appSizeConfig.screenHeight;
  }

  EdgeInsets getEdgeInsets({double all, double left, double top, double right, double bottom}){
    if(all != null){
      return EdgeInsets.all(all);
    } else {
      left = left != null ? left : 0;
      top = top != null ? top : 0;
      right = right != null ? right : 0;
      bottom = bottom != null ? bottom : 0;
      return EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
    }
  }

  EdgeInsets getEdgeInsetsFromRatio({double all, double left, double top, double right, double bottom}){
    if(all != null){
      return EdgeInsets.symmetric(vertical: getHeight(percent: all), horizontal:  getWidth(percent: all));
    } else {

      left = left != null ? left : 0;
      top = top != null ? top : 0;
      right = right != null ? right : 0;
      bottom = bottom != null ? bottom : 0;

      return EdgeInsets.only(left: getWidth(percent: left), top: getHeight(percent: top), right: getWidth(percent: right), bottom: getHeight(percent: bottom));
    }
  }

  Map<String, dynamic> _textStyle = new Map<String, dynamic>();
  Map<String, dynamic> _cardStyle = new Map<String, dynamic>();

  TextStyle getTextStyle(String styleName) {
    if (_textStyle.containsKey(styleName)) {
      return _textStyle[styleName];
    } else {
      return Theme.of(_context).textTheme.bodyText1;
    }
  }

  BoxDecoration getCardStype(String styleName) {
    if (_cardStyle.containsKey(styleName)) {
      return _cardStyle[styleName];
    } else {
    }
  }

  _buildCustomTextStyle() {

    _textStyle['titleSP'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.headline4.fontSize,
        fontWeight: Theme.of(_context).textTheme.bodyText1.fontWeight,
        fontFamily: Theme.of(_context).textTheme.bodyText1.fontFamily,
        color: AppTheme.colorFontWhite);

    _textStyle['titleText'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.headline6.fontSize,
        fontWeight: Theme.of(_context).textTheme.bodyText1.fontWeight,
        fontFamily: Theme.of(_context).textTheme.bodyText1.fontFamily,
        color: AppTheme.colorFontWhite);

    _textStyle['titleTextBlack'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.headline6.fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.bodyText1.fontFamily,
        color: AppTheme.colorFontBlack);

    _textStyle['titleTextBlackBold'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.headline6.fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: Theme.of(_context).textTheme.bodyText1.fontFamily,
        color: AppTheme.colorFontBlack);

    _textStyle['normalText'] = TextStyle(
        fontSize: getWidth(percent: 4.5),
        fontWeight: Theme.of(_context).textTheme.bodyText1.fontWeight,
        fontFamily: Theme.of(_context).textTheme.bodyText1.fontFamily,
        color: AppTheme.colorFontWhite);

    _textStyle['normalText2'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.bodyText1.fontSize,
        fontWeight: Theme.of(_context).textTheme.bodyText1.fontWeight,
        fontFamily: 'digital',
        color: AppTheme.colorFontWhite);

    _textStyle['normalBlack'] = TextStyle(
       fontSize: getWidth(percent: 4.5),
        fontWeight: Theme.of(_context).textTheme.bodyText1.fontWeight,
        fontFamily: Theme.of(_context).textTheme.bodyText1.fontFamily,
        color: AppTheme.colorFontBlack);

    _textStyle['normalTextBold'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.bodyText1.fontSize,
        fontWeight:FontWeight.bold,
        fontFamily: Theme.of(_context).textTheme.bodyText1.fontFamily,
        color: AppTheme.colorFontWhite);

    _textStyle['normalBlackBold'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.bodyText1.fontSize,
        fontWeight:FontWeight.bold,
        fontFamily: Theme.of(_context).textTheme.bodyText1.fontFamily,
        color: AppTheme.colorFontBlack);

    _textStyle['normalPrimary'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.bodyText1.fontSize,
        fontWeight: Theme.of(_context).textTheme.bodyText1.fontWeight,
        fontFamily: Theme.of(_context).textTheme.bodyText1.fontFamily,
        color: AppTheme.colorPrimaryDark);

    _textStyle['normalPrimaryBold'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.bodyText1.fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: Theme.of(_context).textTheme.bodyText1.fontFamily,
        color: AppTheme.colorPrimaryDark);

    _textStyle['normalBadge'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.caption.fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorPrimaryDark);

    _textStyle['normalBadgeGray'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.caption.fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorBlack);

    _textStyle['normalWhiteBadge'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.caption.fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorFontWhite);

    _textStyle['normalTitle'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.bodyText1.fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorGrey);

    _textStyle['newTitle'] = TextStyle(
        fontSize: getWidth(percent:7),
        fontWeight: Theme.of(_context).textTheme.bodyText1.fontWeight,
        fontFamily: 'grandsportlaserital',
        color: AppTheme.colorBackgroundWhite);

    _textStyle['newNormalTitle'] = TextStyle(
        fontSize: getWidth(percent:3.3),
        fontWeight: Theme.of(_context).textTheme.bodyText1.fontWeight,
        fontFamily: 'grandsportlaserital',
        color: AppTheme.colorBackgroundWhite);

    _textStyle['smallGrey'] = TextStyle(
        fontSize: getWidth(percent: 5),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorGrey);

    _textStyle['smallGrey2'] = TextStyle(
        fontSize: getWidth(percent: 1.3),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorGrey);


  }


  newBuildCustomTextStyle() {
    _textStyle['titleText'] = TextStyle(
        fontSize: getWidth(percent: 1.7),
        fontWeight: Theme.of(_context).textTheme.bodyText2.fontWeight,
        fontFamily: Theme.of(_context).textTheme.bodyText2.fontFamily,
        color: AppTheme.colorFontWhite);

    _textStyle['titleTextBlack'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.headline6.fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.bodyText2.fontFamily,
        color: AppTheme.colorFontBlack);

    _textStyle['normalText'] = TextStyle(
        fontSize: getWidth(percent: 3),
        fontWeight: Theme.of(_context).textTheme.bodyText2.fontWeight,
        fontFamily: Theme.of(_context).textTheme.bodyText2.fontFamily,
        color: AppTheme.colorFontWhite);

    _textStyle['normalBlack'] = TextStyle(
        fontSize: getWidth(percent: 2),
        fontWeight: Theme.of(_context).textTheme.bodyText2.fontWeight,
        fontFamily: Theme.of(_context).textTheme.bodyText2.fontFamily,
        color: AppTheme.colorFontBlack);

    _textStyle['normalTextBold'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.bodyText2.fontSize,
        fontWeight:FontWeight.bold,
        fontFamily: Theme.of(_context).textTheme.bodyText2.fontFamily,
        color: AppTheme.colorFontWhite);

    _textStyle['normalBlackBold'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.bodyText2.fontSize,
        fontWeight:FontWeight.bold,
        fontFamily: Theme.of(_context).textTheme.bodyText2.fontFamily,
        color: AppTheme.colorFontBlack);

    _textStyle['normalPrimary'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.bodyText2.fontSize,
        fontWeight: Theme.of(_context).textTheme.bodyText2.fontWeight,
        fontFamily: Theme.of(_context).textTheme.bodyText2.fontFamily,
        color: AppTheme.colorPrimaryLight);

    _textStyle['normalPrimaryBold'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.bodyText2.fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: Theme.of(_context).textTheme.bodyText2.fontFamily,
        color: AppTheme.colorPrimaryLight);

    _textStyle['normalBadge'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.caption.fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorPrimaryLight);

    _textStyle['normalWhiteBadge'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.caption.fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorFontWhite);


    _textStyle['normalBlackBadge'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.caption.fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorBlack);

    _textStyle['smallBlack'] = TextStyle(
        fontSize: getWidth(percent: 1.6),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorBlack);

    _textStyle['smallPrimary2'] = TextStyle(
        fontSize: getWidth(percent: 1.5),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorPrimaryLight);

    _textStyle['smallBlackBold'] = TextStyle(
        fontSize: getWidth(percent: 1.5),
        fontWeight: FontWeight.bold,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorBlack);

    _textStyle['smallBlack3'] = TextStyle(
        fontSize: getWidth(percent: 1.3),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorBlack);

    _textStyle['smallBlack2'] = TextStyle(
        fontSize: getWidth(percent: 2),
        fontWeight: FontWeight.bold,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorBlack);

    _textStyle['smallRed'] = TextStyle(
        fontSize: getWidth(percent: 1.5),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorRed);

    _textStyle['smallGreen'] = TextStyle(
        fontSize: getWidth(percent: 1.5),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorGreen);

    _textStyle['smallYellow'] = TextStyle(
        fontSize: getWidth(percent: 1.5),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorYellow);

    _textStyle['smallGrey'] = TextStyle(
        fontSize: getWidth(percent: 1.5),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorGrey);

    _textStyle['smallGrey2'] = TextStyle(
        fontSize: getWidth(percent: 1.3),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorGrey);

    _textStyle['smallWhite'] = TextStyle(
        fontSize:  getWidth(percent: 1.5),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorFontWhite);

    _textStyle['smallWhite3'] = TextStyle(
        fontSize: getWidth(percent: 2),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorFontWhite);

    _textStyle['smallWhite2'] = TextStyle(
        fontSize: getWidth(percent: 1.5),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorFontWhite);


    _textStyle['smallPrimary'] = TextStyle(
        fontSize: getWidth(percent: 1.8),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorPrimaryLight);

    _textStyle['smallRedCard'] = TextStyle(
        fontSize: getWidth(percent: 1.5),
        fontWeight: FontWeight.normal,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorCard);
  }

  _buildCustomButtonStyle() {}

  _buildCustomCardStyle(){
    _cardStyle['normalShadow']  =  BoxDecoration(
      color: AppTheme.colorBackgroundWhite,
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
      boxShadow: [
        BoxShadow(
          color: AppTheme.colorGrey.withOpacity(1.0),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 0), // changes position of shadow
        ),
      ],
    );

    _cardStyle['noShadow'] = BoxDecoration(
      color: AppTheme.colorBlack,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      boxShadow: [
        BoxShadow(
          color: AppTheme.colorGrey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );

    _cardStyle['textShadow'] = BoxDecoration(
      color: AppTheme.colorBackgroundWhite,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      boxShadow: [
        BoxShadow(
          color: AppTheme.colorGrey.withOpacity(1),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 0), // changes position of shadow
        ),
      ],
    );

    _cardStyle['titleShadow'] = BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppTheme.colorGrey.withOpacity(0.9),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: AppTheme.colorPrimary,
        ),
        color: AppTheme.colorPrimaryDark
    );
  }
}