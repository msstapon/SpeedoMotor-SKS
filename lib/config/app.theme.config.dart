import 'dart:math';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.size.config.dart';

class AppTheme extends StatelessWidget {
  final Widget child;

  AppTheme({this.child});

  static const Color colorFontWhite = Colors.white;
  static const Color colorFontBlack = const Color(0xFF363439);

  static const Color colorPrimary = Colors.black12;
  static const Color colorPrimaryDark = Colors.black12;
  static const Color colorPrimaryLight = Colors.black12;
  static const Color colorBGYellow = const Color(0xFFEAF4F4);
  static const Color colorAccent = const Color(0xFF9CE8FA);
  static const Color colorGrey = Colors.grey;
  static const Color colorGreybang = Colors.black12;
  static const Color colorBlack12 = Colors.black12;
  static const Color colorBlack54 = Colors.black54;
  static const Color colorBlack87 = Colors.black87;
  static const Color colorBlack = Colors.black;

  static const Color colorBackground = const Color(0xFFefefef);
  static const Color colorBackgroundWhite = Colors.white;
  static const Color colorBackgroundBlack = Colors.black;

  static const Color colorTransparent = const Color(0x00000000);

  static const Color colorWarning = const Color(0xFFffc107);
  static const Color colorError = const Color(0xFFda292f);
  static const Color colorInfo = const Color(0xFF17a2b8);
  static const Color colorSuccess = const Color(0xFF28a745);

  static const Color colorCard = const Color(0xFFda292f);
  static const Color colorCardGreen = const Color(0xFFddffdd);
  static const Color toolbarIconColor = const Color(0xFF004da7);

  static const Color colorGreen2 = Colors.lightGreenAccent;
  static const Color colorGreen = const Color(0xFF28a745);
  static const Color colorRed = const Color(0xFFdc3545);
  static const Color colorYellow = const Color(0xFFffc107);
  static const Color colorBorder = const Color(0xFFE27547);
  static const Color colorFont = const Color(0xFFD43333);

  /*Theme Indio
  static const Color primaryLightColor = const Color(0xFF9fa8da);
  static const Color colorPrimary_Dark = const Color(0xFF3f51b5);
  static const Color colorAccent_Dark = const Color(0xFF534bae);
  static const Color colorBackGround_Dark = const Color(0xFF1a237e);
  static const Color colorTransparent_bg = const Color(0x11111111);
  static const Color colorTransparent_black = const Color(0x913f51b5);
  static const Color colorTextBox = const Color(0xFF5c6bc0);
  static const Color colorTextFont = const Color(0xFF363439);
  static const Color colorBgFont = const Color(0xFFcfcfcf);
  static const Color colorBgGray = const Color(0xFFedf0f2);
  static const Color colorButton = const Color(0xFFda292f);*/

  final ThemeData themeLight = ThemeData.light();

  final double _divisor = 280.0;

  @override
  Widget build(BuildContext context) {
    AppSizeConfig appSizeConfig = new AppSizeConfig(context);

    final double _factorHorizontal = appSizeConfig.screenWidth  / _divisor;
    final double _factorVertical = appSizeConfig.screenHeight / _divisor;
    final double _safeFactorHorizontal = (appSizeConfig.screenWidth - appSizeConfig.safeAreaHorizontal) / _divisor;
    final double _safeFactorVertical = (appSizeConfig.screenHeight - appSizeConfig.safeAreaVertical) / _divisor;

    final _textScalingFactor = min(_factorVertical, _factorHorizontal);
    final _safeAreaTextScalingFactor = min(_safeFactorHorizontal, _safeFactorVertical);

    TextScalingFactors _textScalingFactors = TextScalingFactors(
        headline1ScaledSize: (Theme.of(context).textTheme.headline1.fontSize * _safeAreaTextScalingFactor),
        headline2ScaledSize: (Theme.of(context).textTheme.headline2.fontSize * _safeAreaTextScalingFactor),
        headline3ScaledSize: (Theme.of(context).textTheme.headline3.fontSize * _safeAreaTextScalingFactor),
        headline4ScaledSize: (Theme.of(context).textTheme.headline4.fontSize * _safeAreaTextScalingFactor),
        headline5ScaledSize: (Theme.of(context).textTheme.headline5.fontSize * _safeAreaTextScalingFactor),
        headline6ScaledSize: (Theme.of(context).textTheme.headline6.fontSize * _safeAreaTextScalingFactor),
        subtitle1ScaledSize: (Theme.of(context).textTheme.subtitle1.fontSize * _safeAreaTextScalingFactor),
        subtitle2ScaledSize: (Theme.of(context).textTheme.subtitle2.fontSize * _safeAreaTextScalingFactor),
        bodyText2ScaledSize: (Theme.of(context).textTheme.bodyText2.fontSize * _safeAreaTextScalingFactor),
        bodyText1ScaledSize: (Theme.of(context).textTheme.bodyText1.fontSize * _safeAreaTextScalingFactor),
        captionScaledSize: (Theme.of(context).textTheme.caption.fontSize * _safeAreaTextScalingFactor),
        buttonScaledSize: (Theme.of(context).textTheme.button.fontSize * _safeAreaTextScalingFactor));

    ThemeData themeData = _buildAppTheme(context, _textScalingFactors);

//    developer.log('_headline1: ${themeData.textTheme.headline1.fontSize} - ${themeData.textTheme.headline1.fontWeight}');
//    developer.log('_headline2: ${themeData.textTheme.headline2.fontSize} - ${themeData.textTheme.headline2.fontWeight}');
//    developer.log('_headline3: ${themeData.textTheme.headline3.fontSize} - ${themeData.textTheme.headline3.fontWeight}');
//    developer.log('_headline4: ${themeData.textTheme.headline4.fontSize} - ${themeData.textTheme.headline4.fontWeight}');
//    developer.log('_headline5: ${themeData.textTheme.headline5.fontSize} - ${themeData.textTheme.headline5.fontWeight}');
//    developer.log('_headline6: ${themeData.textTheme.headline6.fontSize} - ${themeData.textTheme.headline6.fontWeight}');
//    developer.log('_subtitle1: ${themeData.textTheme.subtitle1.fontSize} - ${themeData.textTheme.subtitle1.fontWeight}');
//    developer.log('_subtitle2: ${themeData.textTheme.subtitle2.fontSize} - ${themeData.textTheme.subtitle2.fontWeight}');
//    developer.log('_bodyText1: ${themeData.textTheme.bodyText1.fontSize} -${themeData.textTheme.bodyText1.fontWeight}');
//    developer.log('_bodyText2: ${themeData.textTheme.bodyText2.fontSize} - ${themeData.textTheme.bodyText2.fontWeight}');
//    developer.log('_caption: ${themeData.textTheme.caption.fontSize} - ${themeData.textTheme.caption.fontWeight}');
//    developer.log('_button: ${themeData.textTheme.button.fontSize} - ${themeData.textTheme.button.fontWeight}');

    return Theme(
      child: child,
      data: themeData,
    );
  }

  _buildAppTheme(BuildContext context, TextScalingFactors textScalingFactors) {
    final ThemeData customTheme = ThemeData();

    TextTheme textTheme =  _buildAppTextTheme(context, customTheme.textTheme, textScalingFactors);

    return customTheme.copyWith(
      brightness: Brightness.light,
      primaryColor: AppTheme.colorPrimary, //
      accentColor: AppTheme.colorBGYellow, //
      errorColor: AppTheme.colorError,  //
      // buttonColor: AppTheme.colorButton,
      buttonTheme: customTheme.buttonTheme.copyWith( //
        buttonColor: Colors.white,
        textTheme: ButtonTextTheme.normal,
      ),
      cardColor: AppTheme.colorCard, //
      inputDecorationTheme: InputDecorationTheme( //
        border: OutlineInputBorder(),
      ),
      primaryIconTheme: themeLight.iconTheme.copyWith(color: AppTheme.colorBackgroundWhite), //
      scaffoldBackgroundColor: colorPrimaryDark, //
      textSelectionColor: AppTheme.colorFontBlack, //
      textTheme: textTheme, //
      appBarTheme: customTheme.appBarTheme.copyWith(textTheme: textTheme), //
      primaryTextTheme: textTheme,
      accentTextTheme: textTheme,
    );
  }

  TextTheme _buildAppTextTheme(BuildContext context, TextTheme _customTextTheme, TextScalingFactors _scaledText) {
    return _customTextTheme
        .copyWith(
      headline1: _customTextTheme.headline1.copyWith(fontSize: _scaledText.headline1ScaledSize, fontWeight: Theme.of(context).textTheme.headline1.fontWeight, color: colorFontBlack),
      headline2: _customTextTheme.headline2.copyWith(fontSize: _scaledText.headline2ScaledSize, fontWeight: Theme.of(context).textTheme.headline2.fontWeight, color: colorFontBlack),
      headline3: _customTextTheme.headline3.copyWith(fontSize: _scaledText.headline3ScaledSize, fontWeight: Theme.of(context).textTheme.headline3.fontWeight, color: colorFontBlack),
      headline4: _customTextTheme.headline4.copyWith(fontSize: _scaledText.headline4ScaledSize, fontWeight: Theme.of(context).textTheme.headline4.fontWeight, color: colorFontBlack),
      headline5: _customTextTheme.headline5.copyWith(fontSize: _scaledText.headline5ScaledSize, fontWeight: Theme.of(context).textTheme.headline5.fontWeight, color: colorFontBlack),
      headline6: _customTextTheme.headline6.copyWith(fontSize: _scaledText.headline6ScaledSize, fontWeight: Theme.of(context).textTheme.headline6.fontWeight, color: colorFontBlack),
      subtitle1: _customTextTheme.subtitle1.copyWith(fontSize: _scaledText.subtitle1ScaledSize, fontWeight: Theme.of(context).textTheme.subtitle1.fontWeight, color: colorFontBlack),
      subtitle2: _customTextTheme.subtitle1.copyWith(fontSize: _scaledText.subtitle2ScaledSize, fontWeight: Theme.of(context).textTheme.subtitle2.fontWeight, color: colorFontBlack),
      bodyText1: _customTextTheme.bodyText1.copyWith(fontSize: _scaledText.bodyText1ScaledSize, fontWeight: Theme.of(context).textTheme.bodyText2.fontWeight, color: colorFontBlack),
      bodyText2: _customTextTheme.bodyText2.copyWith(fontSize: _scaledText.bodyText2ScaledSize, fontWeight: Theme.of(context).textTheme.bodyText2.fontWeight, color: colorFontBlack),
      caption: _customTextTheme.caption.copyWith(fontSize: _scaledText.captionScaledSize, fontWeight: Theme.of(context).textTheme.caption.fontWeight, color: colorFontBlack),
      button: _customTextTheme.button.copyWith(fontSize: _scaledText.buttonScaledSize, fontWeight: Theme.of(context).textTheme.button.fontWeight, color: colorFontBlack),
    ).apply(
      // bodyColor: colorNormalFont,
        fontFamily: 'CSChatThai'
    );
  }
}

class TextScalingFactors {
  final double headline1ScaledSize;
  final double headline2ScaledSize;
  final double headline3ScaledSize;
  final double headline4ScaledSize;
  final double headline5ScaledSize;
  final double headline6ScaledSize;
  final double subtitle1ScaledSize;
  final double subtitle2ScaledSize;
  final double bodyText2ScaledSize;
  final double bodyText1ScaledSize;
  final double captionScaledSize;
  final double buttonScaledSize;

  TextScalingFactors(
      {@required this.headline1ScaledSize,
        @required this.headline2ScaledSize,
        @required this.headline3ScaledSize,
        @required this.headline4ScaledSize,
        @required this.headline5ScaledSize,
        @required this.headline6ScaledSize,
        @required this.subtitle1ScaledSize,
        @required this.subtitle2ScaledSize,
        @required this.bodyText2ScaledSize,
        @required this.bodyText1ScaledSize,
        @required this.captionScaledSize,
        @required this.buttonScaledSize});
}
