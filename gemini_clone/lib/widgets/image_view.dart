import 'package:flutter/material.dart';
import 'package:gemini_clone/constants/app_images.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) => Image(
        image: AssetImage(AppImagePath.logo),
        width: 20,
        height: 20,
        fit: BoxFit.cover,
      );
}
