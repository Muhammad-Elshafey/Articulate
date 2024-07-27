import 'package:articulate/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';

class CustomMaterialContainer extends StatelessWidget {
  final String imagePath;
  final String about;
  final bool isGame;
  final bool isListening;
  const CustomMaterialContainer({
    super.key,
    required this.imagePath,
    required this.isGame,
    required this.isListening,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.sw,
      height: 120.h,
      decoration: BoxDecoration(
        gradient: startScreenLinearGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.30000001192092896),
            blurRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              about,
              style: Styles.text16
                  .copyWith(color: kWhiteColor, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: isGame
                      ? MediaQuery.of(context).size.width / 50
                      : MediaQuery.of(context).size.width / 60,
                  bottom: isGame
                      ? MediaQuery.of(context).size.height / 10
                      : MediaQuery.of(context).size.height / 14,
                  child: Image.asset(
                    imagePath,
                    scale: isGame
                        ? 5.8
                        : isListening
                            ? 4.3
                            : 1.3,
                  ),
                ),
              ],
            ),
          ),
          // Add other widgets in the Row as needed
        ],
      ),
    );
  }
}
