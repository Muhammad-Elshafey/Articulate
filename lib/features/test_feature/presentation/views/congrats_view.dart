import 'package:articulate/features/test_feature/presentation/views/congrats_view_body.dart';
import 'package:flutter/material.dart';

class CongratsView extends StatelessWidget {
  const CongratsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CongratsViewBody()),
    );
  }
}
