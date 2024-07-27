import 'package:articulate/features/material/presentation/views/web_view_body.dart';
import 'package:flutter/material.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  final String text;
  const WebViewPage({super.key, required this.url, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewBody(url: url, text: text),
    );
  }
}
