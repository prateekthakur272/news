import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget {
  final String articleUrl;
  const ArticleWebView({super.key, required this.articleUrl});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()..setJavaScriptMode(JavaScriptMode.disabled);
    controller.loadRequest(Uri.parse(articleUrl));
    return Scaffold(
      appBar: AppBar(title: const Text('NEWS')),
      body: WebViewWidget(controller: controller),
    );
  }
}