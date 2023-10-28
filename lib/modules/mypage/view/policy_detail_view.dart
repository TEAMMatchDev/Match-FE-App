import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyDetailView extends StatelessWidget {
  final String webUrl;

  const PolicyDetailView({super.key, required this.webUrl});

  @override
  Widget build(BuildContext context) {
    var _webViewController = WebViewController()
      ..loadRequest(Uri.parse((dotenv.env['devApiUrl'] ?? "") + webUrl))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    return Scaffold(
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}
