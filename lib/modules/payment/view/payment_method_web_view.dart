import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentMethodWebView extends StatelessWidget {
  final String appTitle;
  final String state;
  final String webUrl;
  /// 결제 정보
  final int? projectId;
  final int? amount;
  final int? date;
  final String? orderId;
  final String? title;
  final bool inApp;

  const PaymentMethodWebView(
      {super.key,
        required this.appTitle,
        required this.state,
        required this.webUrl,
        this.projectId,
        this.amount,
        this.date,
        this.orderId,
        this.title,
        required this.inApp});

  @override
  Widget build(BuildContext context) {
    String queryParamsReg = "";
    String queryParamsOnce = "";
    if (projectId != null) queryParamsReg += "projectId=$projectId&";
    if (amount != null) queryParamsReg += "amount=$amount&";
    if (date != null) queryParamsReg += "date=$date&";
    queryParamsReg += "inApp=$inApp";

    if (projectId != null) queryParamsOnce += "projectId=$projectId&";
    if (amount != null) queryParamsOnce += "amount=$amount&";
    if (date != null) queryParamsOnce += "date=$date&";
    if (title != null) queryParamsOnce += "title=$title&";
    if (orderId != null) queryParamsOnce += "orderId=$orderId&";
    queryParamsOnce += "inApp=$inApp";

    final regUrl = (dotenv.env['devWebUrl'] ?? "") + webUrl + "?" + queryParamsReg;
    final onceUrl = (dotenv.env['devWebUrl'] ?? "") + webUrl + "?" + queryParamsOnce;
    String fullUrl = "";
    if (state == 'REGULAR') {
      fullUrl = regUrl;
    } else {
      fullUrl = onceUrl;
    }

    var _webViewController = WebViewController()
      ..loadRequest(Uri.parse(fullUrl))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    return Scaffold(
      appBar: CommonAppBar.basic(appTitle),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: WebViewWidget(
          controller: _webViewController,
        ),
      ),
    );
  }
}
