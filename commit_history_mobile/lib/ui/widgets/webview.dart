import 'package:commit_history_mobile/ui/widgets/scaffold_with_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context)!.settings.arguments as String;
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(url));
    return ScaffoldWithSafeArea(
      bottom: false,
      body: WebViewWidget(controller: controller),
    );
  }
}
