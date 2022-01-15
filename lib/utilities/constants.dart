import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

Future<bool> kInternetConnectivityChecker() async {
  var connectivityResult = (await Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a mobile network or wifi network.
    return true;
  } else {
    return false;
  }
}



List<Color> kGradientBackground(
    {int cityID = 800,
    String cityIconID = '00n',
    double currentTemperature = 20}) {
  if (cityIconID[2] == 'd') {
    if (currentTemperature > 25) {
      return kHotDayGradient;
    } else if (cityID >= 200 && cityID <= 232) {
      return kStormGradient;
    } else if (cityID >= 300 && cityID <= 321) {
      return kCloudyGradient;
    } else if (cityID >= 500 && cityID <= 531) {
      return kCloudyGradient;
    } else if (cityID >= 600 && cityID <= 622) {
      return kSleetDayGradient;
    } else if (cityID == 701 ||
        cityID == 711 ||
        cityID == 721 ||
        cityID == 741) {
      return kFogGradient;
    } else if (cityID == 731 || cityID == 751 || cityID == 761) {
      return kSandStormGradient;
    } else if (cityID == 762 || cityID == 771 || cityID == 781) {
      return kTornadoGradient;
    } else
      return kClearSkyGradient;
  } else
    return kClearNightGradient;
}

const kInputTextDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter City Name ',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
    borderSide: BorderSide.none,
  ),
);
const kClearNightGradient = [
  Color(0xFF090926),
  Color(0xFF8F5E7D),
];
const kClearSkyGradient = [
  Color(0xFF29b6f6),
  Color(0xFF29b6f6),
];

const kSleetDayGradient = [
  Color(0xFF303030),
  Color(0xFFbdbdbd),
];

const kHotDayGradient = [
  Color(0xFF5A0418),
  Color(0xFFEA5A14),
];

const kStormGradient = [
  Color(0xFF252A5C),
  Color(0xFF976562),
];

const kSandStormGradient = [
  Color(0xFF8A390E),
  Color(0xFFD89045),
];

const kTornadoGradient = [
  Color(0xFF2b1e18),
  Color(0xFF795548),
];

const kFogGradient = [
  Color(0xFF976562),
  Color(0xFF252A5C),
];

const kCloudyGradient = [
  Color(0xFF1F6AB5),
  Color(0xFFb3e5fc),
];



const kDisabledButtonColor = Color(0x66FFFFFF);
const kDisabledButtonElevation = 0.0;
const kEnabledButtonColor = Color(0xFF1e88e5);
const kEnabledButtonElevation = 2.0;
const kTransparentBackgroundColor = Color(0xFF1AFFFFFF);
