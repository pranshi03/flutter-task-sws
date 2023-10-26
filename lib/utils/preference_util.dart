

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtil {
  static void saveDeviceIdAndPairingCode(
      String pairingCode, String deviceId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(deviceId, pairingCode);
  }

  static void setLogin(bool isLogin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_login', isLogin);
  }
  static void setLogout(bool isLogout) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static void setEmployeeID( String empID) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('emp_id', empID);
  }

  static Future<String?> getEmployeeID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('emp_id');
  }



  static Future<bool?> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_login');
  }

  static void setAccessToken(String? accessToken) async {


    final prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', accessToken??'');

  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }


}
