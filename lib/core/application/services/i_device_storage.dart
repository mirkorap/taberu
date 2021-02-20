abstract class IDeviceStorage {
  bool getBool(String key);

  // ignore: avoid_positional_boolean_parameters
  Future<bool> setBool(String key, bool value);

  int getInt(String key);

  Future<bool> setInt(String key, int value);

  double getDouble(String key);

  Future<bool> setDouble(String key, double value);

  String getString(String key);

  Future<bool> setString(String key, String value);

  List<String> getStringList(String key);

  Future<bool> setStringList(String key, List<String> value);

  Set<String> getKeys();

  bool containsKey(String key);

  Future<bool> clear();

  Future<bool> remove(String key);
}
