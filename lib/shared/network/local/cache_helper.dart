import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static final CacheHelper _instance = CacheHelper._();
  late SharedPreferences _sharedPreferences;

  factory CacheHelper() {
    return _instance;
  }
  CacheHelper._();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void putBoolean({
    required String key,
    required bool value,
  }) async {
    SharedPreferences prefs = await getInstance();
    prefs.setBool(key, value);
  }

  Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }

  SharedPreferences getSharedPreferences() {
    return _sharedPreferences;
  }

  String get token {
    return getSharedPreferences().getString('token') ?? '';
  }

  void addStringToSF(String key, String value) async {
    SharedPreferences prefs = await getInstance();
    prefs.setString(key, value);
  }

  dynamic getData({
    required String? key,
  }) {
    return _sharedPreferences.get(key!);
  }

  void saveData({
    required String? key,
    required dynamic value,
  }) async {
    SharedPreferences prefs = await getInstance();
    if (value is String) prefs.setString(key!, value);
    if (value is int) prefs.setInt(key!, value);
    if (value is bool) prefs.setBool(key!, value);
    if (value is double) prefs.setDouble(key!, value);
  }

  Future<bool> removeData({
    required String? key,
  }) async {
    return await _sharedPreferences.remove(key!);
  }

  Future<bool> get isLoggedIn async {
    SharedPreferences _sharedPreferences = await getInstance();
    return _sharedPreferences.getBool('logged_in') ?? false;
  }
  void addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await getInstance();
    prefs.setBool(key, value);
  }
  Future<dynamic> getBoolSF(String key) async {
    SharedPreferences prefs = await getInstance();
    bool? boolValue = prefs.getBool(key);

    return boolValue != null ? boolValue : false;
  }
}
