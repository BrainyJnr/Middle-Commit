import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  // Boolean to track if dark mode is active
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = _loadThemeFromStorage(); // Load theme on app start
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  // Load theme from storage
  bool _loadThemeFromStorage() => _box.read(_key) ?? false;

  // Save theme to storage
  void _saveThemeToStorage(bool isDarkMode) => _box.write(_key, isDarkMode);

  // Toggle the theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    _saveThemeToStorage(isDarkMode.value); // Save theme whenever it changes
  }
}
