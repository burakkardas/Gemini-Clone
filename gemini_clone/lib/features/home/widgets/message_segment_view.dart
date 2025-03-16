import 'package:flutter/material.dart';
import 'package:gemini_clone/features/home/model/message.dart';
import 'package:gemini_clone/widgets/image_view.dart';

class MessageSegmentView extends StatelessWidget {
  const MessageSegmentView({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isUser) const ImageView(),
            Flexible(child: _messageBubble(context, isUser)),
          ],
        ),
      ),
    );
  }

  Widget _messageBubble(BuildContext context, bool isUser) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isUser ? 15 : 0, vertical: 8),
      decoration: BoxDecoration(
        color: isUser ? Theme.of(context).cardColor : Colors.transparent,
        borderRadius: BorderRadius.circular(15).subtract(
          BorderRadius.only(topRight: Radius.circular(isUser ? 15 : 0)),
        ),
      ),
      child: message.isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.blue,
              ),
            )
          : Text(
              message.message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
    );
  }
}
