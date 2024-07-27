import 'package:articulate/features/about_test/presentation/views/test_mic_view_body.dart';
import 'package:flutter/material.dart';

class TestMicView extends StatelessWidget {
  const TestMicView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: TestMicViewBody()),
    );
  }
}
