import 'dart:convert';

class AppConfig{
  static const appName = 'Cancer anywhere';
  static const imagePath = './lib/images/-img/';
  static const iconPath = './lib/images/-ico/';
  static const int httpTimeOut = 30;

  static const List<Map<String, dynamic>> envMaster = [
    {"ENV": 'PRD',"VERSION": '1.0.2', 'BUILD': '20210112'},
    // https://demo.kabintech.co.th/pmttms/login
    // {"ENV": 'PRD', "VERSION": '1.0'}
  ];
  static const String appEnv = 'PRD';

  static final  String appVersion = envMaster.where((envMaster) => envMaster["ENV"] == appEnv).toList().elementAt(0)["VERSION"];
  static final String buildNumber = envMaster.where((envMaster) => envMaster["ENV"] == appEnv).toList().elementAt(0)["BUILD"];

  static const username = 'softcon_mobile';
  static const password = "TcbPl#\$OkeX";

  // static const username = 'softcon_web';
  // static const password = 'TCbYTRgeybG';
  static final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

  static final String hostApi = 'https://canceranywhere.com/tcbplus/';
  // static final String hostApi = 'http://202.139.197.33/tcbplus/';

  static const String keyCustomeAES = "0243BBD2F73512DF4A163663D2DC16D004F866D4092C87F4B4B0EDD5E9954356";
  static const String ivCustomeAES = "4A163663D2DC16D0DB7936DD217848BA";
  static const String keyPassPhraseAES = "E329B2308C8F3090";


  static const int pinLength = 6;

  static const int intervalCheckConnection = 3;
  static const int timeInterval = 30;

}