import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/core/common_widgets/custom_scaffold.dart';
import 'package:invoice_app/features/payment/presentation/screens/payment_status_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/navigation/custom_page_route.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {


  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            if(url.contains("success"))
              {
                Navigator.of(context).pushAndRemoveUntil(
                  CustomPageRoute.createRoute(
                    page: const PaymentStatusScreen(isSuccess: true),
                  ),
                      (Route<dynamic> route) => false,
                );
              }
            else if(url.contains("fail")) {
              Navigator.of(context).pushAndRemoveUntil(
                CustomPageRoute.createRoute(
                  page: const PaymentStatusScreen(isSuccess: false),
                ),
                    (Route<dynamic> route) => false,
              );
            }
          },
          onPageFinished: (String url) {
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    return CustomScaffold(
      title: "payment".tr(),
      body: WebViewWidget(
        controller:controller,
      ),
    );
  }
}
