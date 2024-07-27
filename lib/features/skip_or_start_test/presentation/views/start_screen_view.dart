import 'package:articulate/features/skip_or_start_test/presentation/views/start_screen_view_body.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: StartScreenBody(),
      ),
    );
  }
}
