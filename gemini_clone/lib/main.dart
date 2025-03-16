import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini_clone/config/theme/app_theme.dart';
import 'package:gemini_clone/features/home/view/home_view.dart';
import 'package:gemini_clone/service/locator.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  setupLocator();

  Future.delayed(const Duration(seconds: 2), () {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().currentTheme,
        home: HomeView(),
      );
}
