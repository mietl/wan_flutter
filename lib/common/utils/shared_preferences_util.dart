import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static late final SharedPreferences _preferences;

  // 示例化单例
  static final _instance = SharedPreferencesUtil._internal();

  factory SharedPreferencesUtil() => _instance;

  // 私有构造方法
  SharedPreferencesUtil._internal();

  static Future<void> init() async{
     _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key,String value)=>_preferences.setString(key, value);
  
  Future<bool> setStringList(String key, List<String> value) => _preferences.setStringList(key, value);

  Future<bool> setInt(String key, int value) => _preferences.setInt(key, value);

  Future<bool> setDouble(String key, double value) => _preferences.setDouble(key, value);

  Future<bool> setBool(String key, bool value) => _preferences.setBool(key, value);

  List<String> getStringList(String key, {List<String> defaultValue = const []}) =>
      _preferences.getStringList(key) ?? defaultValue;

  String getString(String key,{ defaultValue }) => _preferences.getString(key) ?? defaultValue;

  int getInt(String key, {int defaultValue = 0}) => _preferences.getInt(key) ?? defaultValue;

  double getDouble(String key, {double defaultValue = 0.0}) => _preferences.getDouble(key) ?? defaultValue;

  bool getBool(String key, {bool defaultValue = false}) => _preferences.getBool(key) ?? defaultValue;


  bool containsKey(String key) => _preferences.containsKey(key);


  Future remove(String key)=>_preferences.remove(key);

  Future<bool> clear()=> _preferences.clear();
}