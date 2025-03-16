import 'package:flutter/material.dart';
import 'package:gemini_clone/constants/app_colors.dart';

final class DarkTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: AppColors.darkBackgroundColor,
        cardColor: AppColors.darkMessageBackgroundColor,
        appBarTheme: _appBarTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      );

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
      suffixIconColor: Colors.grey,
      enabledBorder: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(),
    );
  }

  static OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(100),
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
    );
  }
}
