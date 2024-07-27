import 'package:articulate/features/skip_or_start_test/presentation/views/skip_test_view_body.dart';
import 'package:flutter/material.dart';

class SkipTestView extends StatelessWidget {
  const SkipTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SkipTestViewBody()),
    );
  }
}
