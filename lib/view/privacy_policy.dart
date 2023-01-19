import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl:
      "https://doc-hosting.flycricket.io/crypto-calculator-privacy-policy/d87870f4-11c9-43c4-bf8d-e389784ecebe/privacy",
    );
  }
}
