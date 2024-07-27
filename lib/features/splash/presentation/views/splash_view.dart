import 'package:flutter/material.dart';
import '../../../../core/utils/common/functions.dart';
import 'splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late final Animation<double> opacityAnimation;
  @override
  void initState() {
    initSlidingAnimation();
    initOpacityAnimation();
    Functions.splashViewNavigateMethod(context: context);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SplashViewBody(
          animationController: animationController,
          slidingAnimation: slidingAnimation,
          opacityAnimation: opacityAnimation,
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void initOpacityAnimation() {
    Tween<double> opacityTween = Tween<double>(begin: 0.0, end: 1.0);
    opacityAnimation = opacityTween.animate(animationController);
    animationController.forward();
  }
}
