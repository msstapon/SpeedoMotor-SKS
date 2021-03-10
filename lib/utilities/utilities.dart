import 'dart:developer';

import 'package:th.go.dms.cancer.anywhere/config/app.sharedpreferences.config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kbt_flutter_package/utilities/shared.preferences.util.dart';
//import 'package:th.go.dms.cancer.anywhere/services/ authentication.service.api.dart';
import 'package:th.go.dms.cancer.anywhere/widgets/dialog/message.dialog.widget.dart';

class Utilities {
  static Future<Map<String, String>> getHeaderAuthorization() async {
    Map<String, String> header = new Map<String, String>();
    header['Authorization'] =
        'Bearer ' + await SharedPreferencesUtil.getString(AppSharedPreferences.accessToken);
    return header;
  }

  static defaultHandler(dynamic result, BuildContext context) async {
    String message = '';
    if (result is Exception) {
      // Exception
      Exception exception = result;
      log('Error exception :', error: exception.toString());
      message = 'เกิดข้อผิดพลาด กรุณาทำรายการใหม่ภายหลัง .';
    } else if (result is Map<String, dynamic> && result.containsKey('status')) {
      // API Error
      Map<String, dynamic> json = result;
      log("Error from api code : ${json['status']}",
          error: "${json['status']} => ${json['message']}");
      if (json['status'] == 103 || json['status'] == 104) {
        await SharedPreferencesUtil.clear();
        MessageDialogWidget(
            title: "ข้อผิดพลาด",
            message:
            "เกิดข้อผิดพลาดการเชื่อมต่อกับเซิร์ฟเวอร์ในขณะนี้ จำเป็นต้องให้ออกจากระบบ กรุณาทำลองใหม่อีกครั้ง",
            typeDialog: TypeMessageDialog.error,
            btnOkOnPress: () async {
              await Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (Route<dynamic> route) => false);
            }).showMessageDialog(context);
        return;
      } else if (json['status'] == 100 || json['status'] == 101 || json['status'] == 102 || json['status'] == 422) {
        message = json['message'];
      }else if(json['status'] == 404){
        MessageDialogWidget(
            title: 'ข้อผิดพลาด',
            message: 'ไม่พบข้อมูลผู้ใช้ กรุณาลองใหม่อีกครั้ง',
            typeDialog: TypeMessageDialog.error,
        btnOkOnPress: (){
              Navigator.pop(context);
        },).showMessageDialog(context);
      } else {
        message = 'เกิดข้อผิดพลาด กรุณาทำรายการใหม่ภายหลัง....';
      }
    } else if (result is Response) {
      // HTTP Error
      Response response = result;
      log('Error from http status code : ${response.request.url.toString()}',
          error: '${response.statusCode.toString()} => ${response.reasonPhrase}');
      if (response.statusCode == 401) {
        await SharedPreferencesUtil.clear();
        MessageDialogWidget(
            title: "ข้อผิดพลาด",
            message: response.reasonPhrase,
            typeDialog: TypeMessageDialog.error,
            btnOkOnPress: () async {
              await Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (Route<dynamic> route) => false);
            }).showMessageDialog(context);
        return;
      }
      message = response.reasonPhrase;
    } else if (result is TypeError) {
      TypeError typeError = result;
      log('Type Error : ${typeError.toString()}.',
          error: '${typeError.stackTrace.toString()}', stackTrace: typeError.stackTrace);
      message = 'เกิดข้อผิดพลาด กรุณาทำรายการใหม่ภายหลัง ..';
    } else {
      log('Error : ${result.runtimeType}', error: result.toString());
      message = 'เกิดข้อผิดพลาด กรุณาทำรายการใหม่ภายหลัง ...';
    }
    MessageDialogWidget(title: "ข้อผิดพลาด", message: message, typeDialog: TypeMessageDialog.error)
        .showMessageDialog(context);
  }
//
  static Future handleRetryApiError(dynamic error, int countRetry, Function function,
      {/*List<dynamic> arguments, */Map<Symbol, dynamic> namedArguments}) async {
    if (namedArguments == null) {
      namedArguments = new Map<Symbol, dynamic>();
    }

    // if (arguments == null) {
    //   arguments = new List<dynamic>();
    // }

    if (error is Response) {
      Response response = error;
      if (response.statusCode == 401 && countRetry == 0) {
        log('Error from http status code : ${response.request.url.toString()}',
            error: '${response.statusCode.toString()} => ${response.reasonPhrase}');

        // await AuthenticationServiceApi.refreshToken();
        namedArguments[#countRetry] = 1;

        return await Function.apply(function, new List<dynamic>(), namedArguments);
      } else {
        throw error;
      }
    } else if (error is Map<String, dynamic> && error.containsKey('status') && countRetry == 1) {
      // API Error
      Map<String, dynamic> json = error;
      log("Error from api code : ${json['status']}",
          error: "${json['status']} => ${json['message']}");
      if (json['status'] == 103 || json['status'] == 104) {
        String username = await SharedPreferencesUtil.getString(AppSharedPreferences.username);
        String password = await SharedPreferencesUtil.getString(AppSharedPreferences.password);
        int hospitalKey = await SharedPreferencesUtil.getInt(AppSharedPreferences.hospitalKey);
        String pid = await SharedPreferencesUtil.getString(AppSharedPreferences.pid);
//        await AuthenticationServiceApi().authenticateCancerMobile(pid: pid);
        // await AuthenticationServiceApi.authenticateCancerMobile(username: username, password: password, hospitalKey: hospitalKey);
        namedArguments[#countRetry] = 2;
        return await Function.apply(function, new List<dynamic>(), namedArguments);
      } else {
        throw error;
      }
    } else {
      throw error;
    }
  }
//
//  static String generateClientUniqueKey(int employeeKey) {
//    DateFormat dateFormat = new DateFormat('yyyyMMddHHmmss');
//    return 'M-' + employeeKey.toString() + '-' + dateFormat.format(DateTime.now());
//  }
//
//  static Map<String, dynamic> encodeMapSymbol(Map<Symbol, dynamic> map) {
//    DateFormatUtil dateFormatUtil = new DateFormatUtil();
//    Map<String, dynamic> _result = new Map<String, dynamic>();
//    if (map != null && map.length > 0) {
//      map.forEach((key, value) {
//        if (value is DateTime) {
//          _result[key.toString().replaceFirst('Symbol(\"', '').replaceFirst('\")', '')] =
//              dateFormatUtil.dateTimeToStringJson(value);
//        } else {
//          _result[key.toString().replaceFirst('Symbol(\"', '').replaceFirst('\")', '')] = value;
//        }
//      });
//    }
//    return _result;
//  }
//
//  static Map<String, dynamic> encodeMap(Map<String, dynamic> map) {
//    DateFormatUtil dateFormatUtil = new DateFormatUtil();
//    if (map != null && map.length > 0) {
//      map.forEach((key, value) {
//        if (value is DateTime) {
//          map[key] = dateFormatUtil.dateTimeToStringJson(value);
//        }
//      });
//    }
//    return map;
//  }
//
//  static List<dynamic> encodeList(List<dynamic> list) {
//    DateFormatUtil dateFormatUtil = new DateFormatUtil();
//    List<dynamic> _result = new List<dynamic>();
//    if (list != null && list.length > 0) {
//      list.forEach((value) {
//        if (value is DateTime) {
//          var a = dateFormatUtil.dateTimeToStringJson(value);
//          _result.add(a);
//        } else {
//          _result.add(value);
//        }
//      });
//    }
//    return _result;
//  }
//
//  static Map<Symbol, dynamic> decodeMapSymbol(Map<String, dynamic> map) {
//    DateFormatUtil dateFormatUtil = new DateFormatUtil();
//    Map<Symbol, dynamic> _result = new Map<Symbol, dynamic>();
//    if (map != null && map.length > 0) {
//      RegExp regExp = new RegExp(
//        //r"/([0-9]{4})-([0-9]{2})-([0-9]{2}T)([0-9]{2}):([0-9]{2}):([0-9]{2}).([0-9]{3})/",
//        r'^\d{4}-\d{2}-\d{2}[T]\d{2}:\d{2}:\d{2}.\d{3}?$',
//        caseSensitive: false,
//        multiLine: false,
//      );
//      map.forEach((key, value) {
//        if (value is String ) {
//          if(regExp.hasMatch(value)) {
//            _result[Symbol(key)] = dateFormatUtil.stringJsonToDateTime(value);
//          }else {
//            _result[Symbol(key)] = value;
//          }
//        } else {
//          _result[Symbol(key)] = value;
//        }
//      });
//    }
//    return _result;
//  }
//
//  static Map<String, dynamic> decodeMap(Map<String, dynamic> map) {
//    DateFormatUtil dateFormatUtil = new DateFormatUtil();
//    if (map != null && map.length > 0) {
//      RegExp regExp = new RegExp(
//        r'^\d{4}-\d{2}-\d{2}[T]\d{2}:\d{2}:\d{2}.\d{3}?$',
//        caseSensitive: false,
//        multiLine: false,
//      );
//      map.forEach((key, value) {
//        if (value is String && regExp.hasMatch(value)) {
//          map[key] = dateFormatUtil.stringJsonToDateTime(value);
//        }
//      });
//    }
//    return map;
//  }
//
//  static List<dynamic> decodeList(List<dynamic> list) {
//    DateFormatUtil dateFormatUtil = new DateFormatUtil();
//    List<dynamic> _result = new List<dynamic>();
//    if (list != null && list.length > 0) {
//      RegExp regExp = new RegExp(
//        r'^\d{4}-\d{2}-\d{2}[T]\d{2}:\d{2}:\d{2}.\d{3}?$',
//        caseSensitive: false,
//        multiLine: false,
//      );
//      list.forEach((value) {
//        if (value is String && regExp.hasMatch(value)) {
//          var a = dateFormatUtil.stringJsonToDateTime(value);
//          _result.add(a);
//        } else {
//          _result.add(value);
//        }
//      });
//    }
//    return _result;
//  }
}
