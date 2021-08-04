import 'dart:async';

import 'package:flutter/material.dart';
import 'package:th.go.sks.racing_2/config/app.style.config.dart';
import 'package:th.go.sks.racing_2/config/app.theme.config.dart';

class ConnectionStatusWidget extends StatefulWidget {
  ConnectionStatusWidget({Key key}) : super(key: key);

  @override
  _ConnectionStatusState createState() => new _ConnectionStatusState();
}

class _ConnectionStatusState extends State<ConnectionStatusWidget>{
  bool _isConnected = true;
  Timer _timer;

  @override
  void initState() {
//    _timer = new Timer.periodic(Duration(seconds:AppConfig.intervalCheckConnection),
//            (Timer timer) => _updateConnectionStatus());
    super.initState();
  }

  @override
  void dispose() {
//    _timer.cancel();
    super.dispose();
  }

  Map<String, dynamic> customStyle = new Map<String, dynamic>();

  _buildCustomStyle(BuildContext _context) {
    customStyle['txt-connected'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.caption.fontSize * 0.9,
        fontWeight: Theme.of(_context).textTheme.caption.fontWeight,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorFontWhite
    );

    customStyle['txt-disconnect'] = TextStyle(
        fontSize: Theme.of(_context).textTheme.caption.fontSize * 0.9,
        fontWeight: Theme.of(_context).textTheme.caption.fontWeight,
        fontFamily: Theme.of(_context).textTheme.caption.fontFamily,
        color: AppTheme.colorFontBlack
    );
  }

  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = new AppStyle(context);
    _buildCustomStyle(context);
    return Container(
        width: appStyle.getWidth100(),
        decoration: BoxDecoration(
          color: _isConnected ? AppTheme.colorPrimary : AppTheme.colorGrey,
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_isConnected ? 'เชื่อมต่อสำเร็จ' : 'เชื่อมต่อไม่สำเร็จ',
                style: _isConnected ? customStyle['txt-connected'] : customStyle['txt-disconnect']
            )
          ],
        )
    );
  }

//  _updateConnectionStatus() async {
//    try {
//      bool isConnect = await PingServiceApi.ping();
//      if (isConnect) {
//        if(mounted) {
//          setState(() {
//            _isConnected = true;
//          });
//        }
//      } else {
//        if(mounted) {
//          setState(() {
//            _isConnected = false;
//          });
//        }
//      }
//    }catch (error){
//      if (error is Exception) {
//        Exception exception = error;
//        log('Error exception :', error: exception.toString());
//
//      } else if (error is Response) {
//        // HTTP Error
//        Response response = error;
//        log('Error from http status code : ${response.request.url.toString()}',
//            error: '${response.statusCode.toString()} => ${response.reasonPhrase}');
//      } else if (error is TypeError) {
//        TypeError typeError = error;
//        log('Type Error : ${typeError.toString()}.',
//            error: '${typeError.stackTrace.toString()}', stackTrace: typeError.stackTrace);
//      } else {
//        log('Error : ${error.runtimeType}', error: error.toString());
//      }
//      if(mounted) {
//        setState(() {
//          _isConnected = false;
//        });
//      }
//    }
//  }
}
