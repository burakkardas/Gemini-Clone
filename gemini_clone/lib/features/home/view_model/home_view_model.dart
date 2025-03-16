import 'package:flutter/material.dart';
import 'package:gemini_clone/features/home/model/message.dart';
import 'package:gemini_clone/service/gemini_service.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final textController = TextEditingController();
  final scrollController = ScrollController();
  final messages = <Message>[].obs;
  final _geminiService = GeminiService();

  void addMessage(bool isUser) async {
    final text = textController.text.trim();
    if (text.isEmpty) return;

    messages.add(Message(message: text, isUser: isUser));
    textController.clear();

    if (!isUser) return;

    _showLoadingMessage();

    try {
      final response = await _geminiService.generateText(text);
      _replaceLoadingMessage(response);
    } catch (e) {
      _replaceLoadingMessage("An error occurred. Please try again.");
    }

    _scrollToBottom();
  }

  void _showLoadingMessage() {
    messages
        .add(Message(message: "Loading...", isUser: false, isLoading: true));
  }

  void _replaceLoadingMessage(String response) {
    messages.removeWhere((msg) => msg.isLoading);
    messages.add(Message(message: response, isUser: false));
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
