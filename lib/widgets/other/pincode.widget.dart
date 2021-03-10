import 'package:flutter/material.dart';
import 'numpad.widget.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.theme.config.dart';
import 'package:th.go.dms.cancer.anywhere/config/app.style.config.dart';
import 'package:underline_otp_text_field/underline_otp_text_field.dart';

class PinCodeWidget extends StatefulWidget {
  final int pinLength;
  final Function onChange;
  final Function onReset;

  // final Color backgroudColor;
  final Color fontColor;
  final String title;
  final String forgetText;
  final bool showForgetText;

  PinCodeWidget(
      {Key key,
        @required this.pinLength,
        @required this.fontColor,
        @required this.title,
        @required this.forgetText,
        @required this.showForgetText,
        @required this.onChange,
        this.onReset})
      : super(key: key);

  @override
  PinCodeWidgetState createState() => PinCodeWidgetState();
}

class PinCodeWidgetState extends State<PinCodeWidget> {
  String number = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      number = '';
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  setValue(String val) {
    if (number.length < widget.pinLength)
      setState(() {
        number += val;
        widget.onChange(number);
      });
  }

  backspace(String text) {
    if (text.length > 0) {
      setState(() {
        number = text.split('').sublist(0, text.length - 1).join('');
        widget.onChange(number);
      });
    }
  }

  clearPincode() {
    setState(() {
      number = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
            padding: appStyle.getEdgeInsetsFromRatio(top: 5),
            child: widget.title != 'ยืนยันรหัส OTP' ? Column(
              children: <Widget>[
                Text(
                  '${widget.title}',
                  style: appStyle.getTextStyle('titleText'),
                ),
                Preview(
                  text: number,
                  length: widget.pinLength,
                  circleColors: AppTheme.colorBackgroundWhite,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        widget.onReset();
                      },
                      child: Text(
                        '${widget.forgetText} ',
                        style: appStyle.getTextStyle('titleText'),
                      ),
                    ),
                    widget.showForgetText
                        ? Icon(
                      Icons.chevron_right,
                      color: AppTheme.colorBackgroundWhite,
                      size: 32,
                    )
                        : Container()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NumpadButtonWidget(
                      text: '1',
                      onPressed: () => setValue('1'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      text: '2',
                      onPressed: () => setValue('2'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      text: '3',
                      onPressed: () => setValue('3'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                  ],
                ), //TODO ตัวเลขแถวแรก
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NumpadButtonWidget(
                      text: '4',
                      onPressed: () => setValue('4'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      text: '5',
                      onPressed: () => setValue('5'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      text: '6',
                      onPressed: () => setValue('6'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                  ],
                ), //TODO ตัวเลขแถวสอง
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NumpadButtonWidget(
                      text: '7',
                      onPressed: () => setValue('7'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      text: '8',
                      onPressed: () => setValue('8'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      text: '9',
                      onPressed: () => setValue('9'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                  ],
                ), //TODO ตัวเลขแถวสาม
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NumpadButtonWidget(haveBorder: false,),
                    NumpadButtonWidget(
                      text: '0',
                      onPressed: () => setValue('0'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      haveBorder: false,
                      icon: Icons.backspace,
                      onPressed: () => backspace(number),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                  ],
                ),
              ],
            ) : Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${widget.title}',
                    style: appStyle.getTextStyle('titleText')
                  ),
                ),
                ShowOfOTP(
                  text: number,
                  length: widget.pinLength,
                  circleColors: AppTheme.colorBackgroundWhite,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NumpadButtonWidget(
                      text: '1',
                      onPressed: () => setValue('1'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      text: '2',
                      onPressed: () => setValue('2'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      text: '3',
                      onPressed: () => setValue('3'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                  ],
                ), //TODO ตัวเลขแถวแรก
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NumpadButtonWidget(
                      text: '4',
                      onPressed: () => setValue('4'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      text: '5',
                      onPressed: () => setValue('5'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      text: '6',
                      onPressed: () => setValue('6'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                  ],
                ), //TODO ตัวเลขแถวสอง
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NumpadButtonWidget(
                      text: '7',
                      onPressed: () => setValue('7'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      text: '8',
                      onPressed: () => setValue('8'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      text: '9',
                      onPressed: () => setValue('9'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                  ],
                ), //TODO ตัวเลขแถวสาม
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    NumpadButtonWidget(haveBorder: false,),
                    NumpadButtonWidget(
                      text: '0',
                      onPressed: () => setValue('0'),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                    NumpadButtonWidget(
                      haveBorder: false,
                      icon: Icons.backspace,
                      onPressed: () => backspace(number),
                      fontColor: AppTheme.colorBackgroundWhite,
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}

class ShowOfOTP extends StatelessWidget {
  final int length;
  final String text;
  final Color circleColors;

  const ShowOfOTP({Key key, this.length, this.text, this.circleColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Container(
      width: appStyle.getWidth100(),
      margin: appStyle.getEdgeInsets(left: 22,right: 22),
      alignment: Alignment.center,
      child: UnderlineOtpTextField(
        controller: TextEditingController(text: text),
        fieldCount: length,
        lineSpacing: 2,
        underLineColor: AppTheme.colorBackgroundWhite,
        enabled: false,
        textColor: AppTheme.colorBackgroundWhite,
      ),
      padding: appStyle.getEdgeInsets(top: 12,bottom: 32),
    );
  }
}


class Preview extends StatelessWidget {
  final int length;
  final String text;
  final Color circleColors;

  const Preview({Key key, this.length, this.text, this.circleColors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> previewLength = [];
    for (var i = 0; i < length; i++) {
      previewLength.add(Dot(
        isActive: text.length >= i + 1,
        circleColor: circleColors,
      ));
    }
    return Container(
        child: Wrap(children: previewLength));
  }
}

class Dot extends StatelessWidget {
  final bool isActive;
  final Color circleColor;

  const Dot({Key key, this.isActive = false, this.circleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    return Container(
      padding: appStyle.getEdgeInsetsFromRatio(all: 3),
      child: Container(
        width: appStyle.getWidth(percent: 6),
        height: appStyle.getHeight(percent: 6),
        decoration: BoxDecoration(
          color: isActive ? circleColor : Theme.of(context).primaryColor,
          border: Border.all(width: 1.0, color: circleColor),
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
