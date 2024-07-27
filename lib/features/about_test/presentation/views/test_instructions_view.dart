import 'package:flutter/material.dart';

import 'test_instructions_view_body.dart';

class TestInstructionsView extends StatelessWidget {
  const TestInstructionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: TestInstructionsViewBody(),
      ),
    );
  }
}
