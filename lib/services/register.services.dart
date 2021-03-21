import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:th.go.dms.cancer.anywhere/config/app.config.dart';
import 'package:th.go.dms.cancer.anywhere/services/login.model.dart';

class RegisterServices{
  Future registerServicesApi({String username,String password, String firstName, String lastName, String phone}) async {

    var resData;

    Map data = {
      "username" : username,
      "password" : password,
      "firstName" : firstName,
      "lastName" : lastName,
      "phoneNo" : phone
    };

    var body = json.encode(data);
    log(body);

    try{
      final response = await http.post(AppConfig.hostApi + 'Users',
          headers: {
            // 'Username' : username ,
            // 'Password' : password,
            "Content-Type": "application/json",
          },body: body
      );
      resData = utf8.decode(response.bodyBytes);
      log(resData);
      return  LoginModel.fromJson(json.decode(resData));
    }catch(error){
      log('error in login $error' );
    }

  }
}