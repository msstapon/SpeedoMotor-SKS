import 'dart:developer';

class LoginModel{
  int status;
  String message;


  LoginModel({this.status, this.message});

  LoginModel.fromJson(Map<String , dynamic> json){
    status = json['status'];
    message = json['message'];
    // data = new DataLoginService.fromJson(json['data']);
  }

 Map<String , dynamic> toJson(){
   final Map<String, dynamic> data = new Map<String, dynamic>();

   data['status'] = this.status;
   data['message'] = this.message;
   // data['data'] = this.data != null ? this.data.toJson() : '';

   return data;
 }
}

class DataLoginService{
  String schema;
  String parameter;

  DataLoginService({this.parameter,this.schema});

  DataLoginService.fromJson(Map<String, dynamic> json){
    schema = json['schema'];
    parameter= json['parameter'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['schema'] = this.schema;
    data['parameter'] = this.parameter;
    log('login to json  '+data.toString());

    return data;
  }
}