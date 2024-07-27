import 'package:flutter/material.dart';

import 'explain_test_view_body.dart';

class ExplainTestView extends StatelessWidget {
  const ExplainTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ExplainTestViewBody()),
    );
  }
}
