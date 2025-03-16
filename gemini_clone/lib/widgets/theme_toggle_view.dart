import 'package:flutter/material.dart';
import 'package:gemini_clone/constants/app_gradients.dart';
import 'package:gemini_clone/controller/theme_controller.dart';
import 'package:gemini_clone/service/locator.dart';
import 'package:get/get.dart';

class ThemeToggleView extends StatelessWidget {
  ThemeToggleView({super.key});

  final themeController = locator<ThemeController>();

  @override
  Widget build(BuildContext context) => Obx(
        () => ShaderMask(
          shaderCallback: (bounds) => AppGradients.primaryGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: IconButton(
            color: Colors.white,
            icon: Icon(
              themeController.isDarkMode.value
                  ? Icons.brightness_low_rounded
                  : Icons.brightness_3,
            ),
            onPressed: themeController.toggleTheme,
          ),
        ),
      );
}
