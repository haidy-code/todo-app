import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String applang = 'en';
  ThemeMode apptheme = ThemeMode.light;

  Future<void> changelanguage(String langcode) async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    if (langcode == applang) {
      return;
    }
    applang = langcode;
    preferences.setString('lang', langcode);
    notifyListeners();
  }

  Future<void> changetheme(ThemeMode mode) async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    if (mode == apptheme) {
      return;
    }
    apptheme = mode;
    preferences.setString('theme', mode==ThemeMode.light?'light':'dark');
    notifyListeners();
  }
}
