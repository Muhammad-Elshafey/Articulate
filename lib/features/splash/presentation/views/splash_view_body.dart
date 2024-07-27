import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/articulate_text.dart';
import 'widgets/bg_splash_image.dart';
import 'widgets/mic_logo_image.dart';

class SplashViewBody extends StatefulWidget {
  final Animation<double> opacityAnimation;
  final AnimationController animationController;
  final Animation<Offset> slidingAnimation;
  const SplashViewBody(
      {super.key,
      required this.animationController,
      required this.slidingAnimation,
      required this.opacityAnimation});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BgSplashImage(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: widget.slidingAnimation,
                builder: (context, _) {
                  return SlideTransition(
                    position: widget.slidingAnimation,
                    child: const MicLogoImage(),
                  );
                },
              ),
              SizedBox(height: 15.h),
              FadeTransition(
                opacity: widget.opacityAnimation,
                child: const ArticulateText(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
