import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyDetailView extends StatelessWidget {
  final String webUrl;
  final String title;

  const PolicyDetailView(
      {super.key, required this.webUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    var _webViewController = WebViewController()
      ..loadRequest(Uri.parse((dotenv.env['devApiUrl'] ?? "") + webUrl))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    return Scaffold(
      appBar: CommonAppBar.basic(title),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: WebViewWidget(
          controller: _webViewController,
        ),
      ),
    );
  }
}
