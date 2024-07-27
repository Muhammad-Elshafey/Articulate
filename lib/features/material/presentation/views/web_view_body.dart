import 'package:articulate/constant.dart';
import 'package:articulate/core/utils/widgets/app_bar.dart';
import 'package:articulate/core/utils/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewBody extends StatefulWidget {
  final String url;
  final String text;
  const WebViewBody({super.key, required this.url, required this.text});

  @override
  State<WebViewBody> createState() => _WebViewBodyState();
}

class _WebViewBodyState extends State<WebViewBody> {
  bool isLoading = true;
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AbsorbPointer(
            absorbing: isLoading ? true : false,
            child: Column(
              children: [
                SizedBox(height: 50.h),
                CustomAppBar(text: 'Back to ${widget.text}'),
                SizedBox(height: 20.h),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 145,
                  child: Stack(
                    children: [
                      WebViewWidget(
                        controller: controller,
                      ),
                      if (isLoading)
                        const Center(
                          child: CustomCircularProgressIndicator(
                            color: kSoundColor,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
