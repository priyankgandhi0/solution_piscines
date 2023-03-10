import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferences = SharedPreference();

class SharedPreference {
  static SharedPreferences? _preferences;

  init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static const String IS_NOTIFICATION_ON = "isNotificationOn";
  static const String IS_SELECTED = "isSelected";
  static const String WEEK_LIST = "weeklist";

  saveNotification(bool isNotificationOn,List<String> weekList) async {
    _preferences!.setBool(IS_NOTIFICATION_ON, isNotificationOn);
    _preferences!.setStringList(WEEK_LIST, weekList);
  }




  void clearUserItem() async {
    // await SignInRepo().logoutUSer();
    // _preferences!.remove(IS_LOGGED_IN);
    // _preferences!.remove(USER_NAME);
    // _preferences!.remove(
    //   USER_EMAIL,
    // );
    // _preferences!.remove(
    //   AUTH_TOKEN,
    // );
    // _preferences!.remove(
    //   USER_TOKEN,
    // );
    //
    // _preferences!.remove(
    //   USER_PROFILE_IMAGE,
    // );
  }

/*
  putAppDeviceInfo() async {
    if (kIsWeb) {
      putString(APP_DEVICE_MODEL, "Test");
      putString(APP_OS_VERSION, "Web 1.0");
      putString(APP_STORE_VERSION, "1.0.0");
      putString(APP_STORE_BUILD_NUMBER, "1.0.0");
      putString(APP_DEVICE_TYPE, "web");
    } else {
      bool isiOS = Platform.isIOS;
      putString(APP_DEVICE_TYPE, isiOS ? "iOS" : "android");
      var deviceInfo = await appDeviceInfo();
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      if (isiOS) {
        IosDeviceInfo iosDeviceInfo = (deviceInfo as IosDeviceInfo);
        putString(APP_DEVICE_MODEL, deviceInfo.model);
        putString(APP_OS_VERSION, "iOS ${iosDeviceInfo.systemVersion}");
      } else {
        AndroidDeviceInfo androidDeviceInfo = (deviceInfo as AndroidDeviceInfo);
        putString(APP_DEVICE_MODEL, androidDeviceInfo.model);
        putString(APP_OS_VERSION, androidDeviceInfo.version.release);
      }
      putString(APP_STORE_VERSION, packageInfo.version);
      putString(APP_STORE_BUILD_NUMBER, packageInfo.buildNumber);
    }
  }
*/
  Future<bool?> putList(String key, List<String> value) async {
    return _preferences == null
        ? null
        : _preferences!.setStringList(key, value);
  }
  List<String>? getList(String key, {List<String> defValue = const []}) {
    return _preferences == null
        ? defValue
        : _preferences!.getStringList(key)
        ?? defValue;
  }
  Future<dynamic> appDeviceInfo() async {
    return Platform.isIOS
        ? await DeviceInfoPlugin().iosInfo
        : await DeviceInfoPlugin().androidInfo;
  }

  Future<bool?> putString(String key, String value) async {
    return _preferences == null ? null : _preferences!.setString(key, value);
  }

  String? getString(String key, {String defValue = ""}) {
    return _preferences == null
        ? defValue
        : _preferences!.getString(key) ?? defValue;
  }

  Future<bool?> putInt(String key, int value) async {
    return _preferences == null ? null : _preferences!.setInt(key, value);
  }

  int? getInt(String key, {int defValue = 0}) {
    return _preferences == null
        ? defValue
        : _preferences!.getInt(key) ?? defValue;
  }

  Future<bool?> putDouble(String key, double value) async {
    return _preferences == null ? null : _preferences!.setDouble(key, value);
  }

  double getDouble(String key, {double defValue = 0.0}) {
    return _preferences == null
        ? defValue
        : _preferences!.getDouble(key) ?? defValue;
  }

  Future<bool?> putBool(String key, bool value) async {
    return _preferences == null ? null : _preferences!.setBool(key, value);
  }

  bool? getBool(String key, {bool defValue = false}) {
    return _preferences == null
        ? defValue
        : _preferences!.getBool(key) ?? defValue;
  }

  Future<bool?> putBoolForLanguage(String key, bool value) async {
    return _preferences == null ? null : _preferences!.setBool(key, value);
  }

  bool? getBoolForLanguage(String key) {
    return _preferences!.getBool(key) ?? null;
  }

}
