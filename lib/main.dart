// ignore_for_file: prefer_const_constructors

import 'package:crypto_calculator/Router/routes.dart';
import 'package:crypto_calculator/controller/terms_and_conditions.dart';
import 'package:crypto_calculator/view/bottom_navigation_view.dart';
import 'package:crypto_calculator/view/percentage_view.dart';
import 'package:crypto_calculator/view/privacy_policy.dart';
import 'package:crypto_calculator/view/profit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (currentFocus.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          getPages: [
            GetPage(name: Routes.bottomNavigation, page: () => BottomNavigationView()),
            GetPage(name: Routes.profitView, page: () => ProfitView()),
            GetPage(name: Routes.percentageView, page: () => PercentageView()),
            GetPage(name: Routes.privacyPolicyView, page: () => PrivacyPolicy()),
            GetPage(name: Routes.termsAndCondition, page: () => TermsAndCondition()),
          ],
          initialRoute: Routes.bottomNavigation,
        ));
  }
}
