import 'package:flutter/material.dart';
import 'package:gemini_clone/config/theme/dark_theme.dart';
import 'package:gemini_clone/config/theme/light_theme.dart';
import 'package:gemini_clone/controller/theme_controller.dart';
import 'package:gemini_clone/service/locator.dart';

final class AppTheme {
  final themeController = locator<ThemeController>();

  ThemeData get currentTheme =>
      themeController.isDarkMode.value ? DarkTheme.theme : LightTheme.theme;
}
