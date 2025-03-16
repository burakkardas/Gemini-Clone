import 'package:flutter/material.dart';
import 'package:gemini_clone/features/home/view_model/home_view_model.dart';
import 'package:gemini_clone/features/home/widgets/gradient_text_view.dart';
import 'package:gemini_clone/features/home/widgets/message_segment_view.dart';
import 'package:gemini_clone/service/locator.dart';
import 'package:gemini_clone/widgets/search_field_view.dart';
import 'package:gemini_clone/widgets/theme_toggle_view.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final homeViewModel = locator<HomeViewModel>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _appBar(),
        body: _content(),
        bottomNavigationBar: SearchFieldView(
          homeViewModel: homeViewModel,
        ),
      );

  Obx _content() {
    return Obx(() {
      if (homeViewModel.messages.isEmpty) {
        return GradientTextView(text: "Hello Burak");
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          controller: homeViewModel.scrollController,
          itemCount: homeViewModel.messages.length,
          itemBuilder: (context, index) => MessageSegmentView(
            message: homeViewModel.messages[index],
          ),
        ),
      );
    });
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: false,
      title: const Text(
        "Gemini",
      ),
      actions: [
        ThemeToggleView(),
      ],
    );
  }
}
