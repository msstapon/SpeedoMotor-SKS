import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:th.go.dms.cancer.anywhere/config/app.config.dart';
import 'package:th.go.dms.cancer.anywhere/services/login.model.dart';
import 'dart:convert';
import 'dart:async';

class LoginServices{
  Future<LoginModel> loginServicesApi({String username, String password}) async {

    var resData;
    Map data = {
      'username' : username,
      'password' : password
    };

    var body = json.encode(data);
    // log('login body '+body);
    //    final response = await http.post(Uri.parse(AppConfig.hostApi+"Auth/login"),
    final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    // try{
      final response = await http.post(Uri.parse(AppConfig.hostApi+"Auth/login"),
          headers: {
            // 'Authorization' : basicAuth,
            "Content-Type": "application/json",
          },body: body
      );
        if(response.statusCode == 200){
          resData = utf8.decode(response.bodyBytes);
          // log('login services '+resData);
          var result = LoginModel.fromJson(json.decode(resData));
          log('data '+result.toString());
          return LoginModel.fromJson(json.decode(resData));
        }else{
          log('code ${response.statusCode}');
        }
    // }catch(error){
    //   log('error in login $error' );
    // }
  }

}