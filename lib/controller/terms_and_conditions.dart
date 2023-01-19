import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl:
      "https://doc-hosting.flycricket.io/crypto-calculator-terms-of-use/5dab2a9c-1d89-41e6-8964-bd0159e4fa2d/terms",
    );
  }
}
