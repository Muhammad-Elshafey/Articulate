import 'package:articulate/constant.dart';
import 'package:articulate/core/utils/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final bool isLoading;
  final double scale;
  final Color color;
  const ImageButton({
    super.key,
    required this.onTap,
    required this.imagePath,
    this.isLoading = false,
    this.scale = 1,
    this.color = kBlueColor3,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isLoading
          ? const Center(
              child: CustomCircularProgressIndicator(
                color: kBlueColor3,
              ),
            )
          : Image.asset(imagePath, scale: scale),
    );
  }
}
