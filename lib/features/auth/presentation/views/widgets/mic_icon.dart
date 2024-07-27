import 'package:flutter/material.dart';

class MicIcon extends StatelessWidget {
  final String imagePath;
  final double scale;
  const MicIcon({
    super.key,
    required this.imagePath,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        imagePath,
        scale: scale,
      ),
    );
  }
}
