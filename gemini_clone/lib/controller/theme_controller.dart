import 'package:gemini_clone/config/theme/dark_theme.dart';
import 'package:gemini_clone/config/theme/light_theme.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final RxBool isDarkMode = true.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? DarkTheme.theme : LightTheme.theme);
  }
}
