import 'package:flutter/material.dart';
import 'package:gemini_clone/constants/app_gradients.dart';

class GradientTextView extends StatelessWidget {
  const GradientTextView({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Center(
        child: ShaderMask(
          shaderCallback: (bounds) => AppGradients.primaryGradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
}
