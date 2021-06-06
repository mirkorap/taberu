import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taberu/core/application/services/i_device_storage.dart';

@LazySingleton(as: IDeviceStorage)
class DeviceStorage implements IDeviceStorage {
  final SharedPreferences _sharedPreferences;

  DeviceStorage(this._sharedPreferences);

  @override
  bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  @override
  Future<bool> setBool(String key, bool value) {
    return _sharedPreferences.setBool(key, value);
  }

  @override
  int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  @override
  Future<bool> setInt(String key, int value) {
    return _sharedPreferences.setInt(key, value);
  }

  @override
  double? getDouble(String key) {
    return _sharedPreferences.getDouble(key);
  }

  @override
  Future<bool> setDouble(String key, double value) {
    return _sharedPreferences.setDouble(key, value);
  }

  @override
  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  @override
  Future<bool> setString(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }

  @override
  List<String>? getStringList(String key) {
    return _sharedPreferences.getStringList(key);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) {
    return _sharedPreferences.setStringList(key, value);
  }

  @override
  Set<String> getKeys() {
    return _sharedPreferences.getKeys();
  }

  @override
  bool containsKey(String key) {
    return _sharedPreferences.containsKey(key);
  }

  @override
  Future<bool> clear() {
    return _sharedPreferences.clear();
  }

  @override
  Future<bool> remove(String key) {
    return _sharedPreferences.remove(key);
  }
}
