import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:th.go.sks.racing_2/config/app.config.dart';
import 'package:th.go.sks.racing_2/config/app.sharedpreferences.config.dart';
import 'package:th.go.sks.racing_2/models/history.model.dart';
import 'package:th.go.sks.racing_2/models/response-upload.model.api.dart';
import 'package:th.go.sks.racing_2/models/user.model.dart';
import 'package:th.go.sks.racing_2/services/login.model.dart';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


class GpsServices{

  Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var username =  pref.getString(AppSharedPreferences.username);
    var password =  pref.get(AppSharedPreferences.password);
    Map data = {
      'keyword' : username.trim(),
    };
    var body = json.encode(data);
    final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final response = await http.post(Uri.parse(AppConfig.hostApi+"Users/search"),
        headers: {
           'Authorization' : basicAuth,
          "Content-Type": "application/json",
        },body: body
    );
    if(response.statusCode == 200){
      String bodyData = utf8.decode(response.bodyBytes);
      Map<String, dynamic> json = jsonDecode(bodyData);
//      List<dynamic> rows = result['data'];
//      print(result['data']);
      return UserModel.fromJson(json['data'][0]);
//      List<RequestTeleConsultModelApi> _data =
//      new List<RequestTeleConsultModelApi>();
//      rows.forEach((row) {
//        _data.add(RequestTeleConsultModelApi.fromJson(row));
//      });
    }else{
      return null;
    }
    // }catch(error){
    //   log('error in login $error' );
    // }
  }


  Future<ResponseUploadModelApi> saveSpeedTest({int userKey,
    String speed100m,
    String time100m,
    String speed200m,
    String time200m,

    String speed300m,
    String time300m,

    String speed400m,
    String time400m,

    String speed500m,
    String time500m,

    String speed600m,
    String time600m,

    String speed700m,
    String time700m,

    String speed800m,
    String time800m,

    String speed900m,
    String time900m,

    String speed1000m,
    String time1000m,

    String speed1100m,
    String time1100m,

    String speed1200m,
    String time1200m,

    String speed1300m,
    String time1300m,

    String speed1400m,
    String time1400m,

    String speed1500m,
    String time1500m,

    String speed1600m,
    String time1600m,

    String speed1700m,
    String time1700m,

    String speed1800m,
    String time1800m,

    String speed1900m,
    String time1900m,

    String speed2000m,
    String time2000m,
    String total,
  String average,
  String maxSpeed

  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var username =  pref.getString(AppSharedPreferences.username);
    var password =  pref.get(AppSharedPreferences.password);
    Map data = {
        "speed100m": speed100m,
        "time100m": time100m,
        "speed200m": speed200m,
        "time200m": time200m,
        "speed300m": speed300m,
        "time300m": time300m,
        "speed400m": speed400m,
        "time400m": time400m,
        "speed500m": speed500m,
        "time500m": time500m,
        "speed600m": speed600m,
        "time600m": time600m,
        "speed700m": speed700m,
        "time700m": time700m,
        "speed800m": speed800m,
        "time800m": time800m,
        "speed900m": speed900m,
        "time900m": time900m,
        "speed1000m": speed1000m,
        "time1000m": time1000m,
        "speed1100m": speed1100m,
        "time1100m": time1100m,
        "speed1200m": speed1200m,
        "time1200m": time1200m,
        "speed1300m": speed1300m,
        "time1300m": time1300m,
        "speed1400m": speed1400m,
        "time1400m": time1400m,
        "speed1500m": speed1500m,
        "time1500m": time1500m,
        "speed1600m": speed1600m,
        "time1600m": time1600m,
        "speed1700m": speed1700m,
        "time1700m": time1700m,
        "speed1800m": speed1800m,
        "time1800m": time1800m,
        "speed1900m": speed1900m,
        "time1900m": time1900m,
        "speed2000m": speed2000m,
        "time2000m": time2000m,
        "total": total,
        "average": average,
        "maxSpeed": maxSpeed
    };
    var body = json.encode(data);
    log("body ${body.toString()}");
    log("userKEy ${userKey.toString()}");
    final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final response = await http.post(Uri.parse("http://139.5.147.234/sks-motospeed-api"+"/User/${userKey.toString()}"),
        headers: {
          'Authorization' : basicAuth,
          "Content-Type": "application/json",
        },body: body
    );
    if(response.statusCode == 200){
      String bodyData = utf8.decode(response.bodyBytes);
      Map<String, dynamic> json = jsonDecode(bodyData);
      return ResponseUploadModelApi(
          isSucces: json['status'] == 200 ? true : false,
          status: json['status'],
          message: json['message']);
    }else{
      return null;
    }
  }

//  /User/{userKey}/SpeedTest/{speedTestKey}
  Future<ResponseUploadModelApi> deleteSpeedTest({int userKey,
    int speedTestKey,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var username =  pref.getString(AppSharedPreferences.username);
    var password =  pref.get(AppSharedPreferences.password);
    final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final response = await http.delete(Uri.parse("http://139.5.147.234/sks-motospeed-api"+"/User/${userKey.toString()}/SpeedTest/${speedTestKey.toString()}"),
        headers: {
          'Authorization' : basicAuth,
          "Content-Type": "application/json",
        },
    );
    if(response.statusCode == 200){
      String bodyData = utf8.decode(response.bodyBytes);
      Map<String, dynamic> json = jsonDecode(bodyData);
      return ResponseUploadModelApi(
          isSucces: json['status'] == 200 ? true : false,
          status: json['status'],
          message: json['message']);
    }else{
      return null;
    }
  }

  static Future<HistoryModel> getHistory({int userKey}) async {
    try{
      log("userKEy $userKey");
      SharedPreferences pref = await SharedPreferences.getInstance();
      var username =  pref.getString(AppSharedPreferences.username);
      var password =  pref.get(AppSharedPreferences.password);
      final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
      String resData;
      String api = "http://139.5.147.234/sks-motospeed-api" + '/User/$userKey';
      var url = Uri.parse(api);
      var response = await http.get(
          url,
          headers: {'authorization' : basicAuth,
            'Content-Type' : 'application/json',
          }
      );
      log('responseVaccineRecord ${response.statusCode}');
      resData = utf8.decode(response.bodyBytes);
      log('resDataVaccineRecord ${resData.toString()}');
      return HistoryModel.fromJson(json.decode(resData));
    }catch(error){
      Map<Symbol, dynamic> namedArguments = new Map<Symbol, dynamic>();
      namedArguments[#userKey] = userKey;
      throw error;
    }
  }




}