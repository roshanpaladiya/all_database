import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceServices {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void removePreference() {}

  void clearPreference() {}

  static Future<void> setValue(String key, dynamic value) async {
    if (value is String) {
      await _prefs!.setString(key, value);
    } else if (value is double) {
      await _prefs!.setDouble(key, value);
    } else if (value is bool) {
      await _prefs!.setBool(key, value);
    } else if (value is int) {
      await _prefs!.setInt(key, value);
    } else if (value is List<String>) {
      await _prefs!.setStringList(key, value);
    } else {
      Get.snackbar(
        'Preference ERROR',
        'Send Valid value for Store Data in Preferences',
      );
    }
  }

  static String getString(String key) => _prefs!.getString(key) ?? '';

  static int getInt(String key) => _prefs!.getInt(key) ?? 0;

  static double getDouble(String key) => _prefs!.getDouble(key) ?? 0;

  static bool getBool(String key) => _prefs!.getBool(key) ?? false;

  static List<String> getListString(String key) =>
      _prefs!.getStringList(key) ?? [];
}
