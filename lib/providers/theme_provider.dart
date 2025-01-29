import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  late ThemeMode _themeMode;

  ThemeProvider() {
    // Initialize with system default
    _themeMode = ThemeMode.system;
    _loadThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  // Get whether current theme is dark
  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      // Get system theme
      final window = WidgetsBinding.instance.window;
      return window.platformBrightness == Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  // Toggle between light and dark mode
  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.light) {
      await setThemeMode(ThemeMode.dark);
    } else {
      await setThemeMode(ThemeMode.light);
    }
  }

  // Load saved theme mode
  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(_themeKey);

    if (savedTheme != null) {
      _themeMode = _themeStringToThemeMode(savedTheme);
      notifyListeners();
    }
  }

  // Save and update theme mode
  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.toString());
    notifyListeners();
  }

  // Convert string to ThemeMode
  ThemeMode _themeStringToThemeMode(String themeString) {
    switch (themeString) {
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
