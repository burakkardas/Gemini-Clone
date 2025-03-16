import 'package:flutter/material.dart';
import 'package:gemini_clone/controller/theme_controller.dart';
import 'package:gemini_clone/features/home/view_model/home_view_model.dart';
import 'package:gemini_clone/service/locator.dart';
import 'package:get/get.dart';

class SearchFieldView extends StatelessWidget {
  SearchFieldView({super.key, required this.homeViewModel});

  final HomeViewModel homeViewModel;
  final themeController = locator<ThemeController>();

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 25),
        child: _textField(context),
      );

  Obx _textField(BuildContext context) {
    return Obx(
      () => TextField(
        controller: homeViewModel.textController,
        onEditingComplete: () {
          homeViewModel.addMessage(true);
          FocusScope.of(context).unfocus();
        },
        style: TextStyle(
          color: themeController.isDarkMode.value ? Colors.white : Colors.black,
        ),
        decoration: _decoration(),
      ),
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      hintText: "Ask to Gemini",
      suffixIcon: Icon(Icons.send_rounded),
    );
  }
}
