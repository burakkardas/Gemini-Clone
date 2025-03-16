import 'package:gemini_clone/controller/theme_controller.dart';
import 'package:gemini_clone/features/home/view_model/home_view_model.dart';
import 'package:gemini_clone/service/gemini_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ThemeController>(() => ThemeController());
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
  locator.registerLazySingleton<GeminiService>(() => GeminiService());
}
