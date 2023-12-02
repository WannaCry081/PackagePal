import "package:flutter/material.dart"; 
import "package:shared_preferences/shared_preferences.dart";

class SettingsProvider extends ChangeNotifier{
  SharedPreferences? _preference;

  SettingsProvider() {
    init();
  }

  Future<void> init() async {
    _preference = await SharedPreferences.getInstance();
    notifyListeners();
    return;
  }

  bool getBoolPreference(String key){
    return _preference?.getBool(key) ?? false;
  }

  Future<void> setBoolPreference(String key, bool value) async {
    await _preference?.setBool(key, value);
    notifyListeners();
    return;
  }

  String getStringPreference(String key){
    return _preference?.getString(key) ?? "";
  }

  Future<void> setStringPreference(String key, String value ) async {
    await _preference?.setString(key, value);
    notifyListeners();
    return; 
  }

  int getIntPreference(String key){
    return _preference?.getInt(key) ?? 0;
  }

  Future<void> setIntPreference(String key, int value) async {
    await _preference?.setInt(key, value);
    notifyListeners();
    return;
  }
}