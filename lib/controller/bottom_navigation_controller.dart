import 'package:crypto_calculator/view/coin_sell_view.dart';
import 'package:crypto_calculator/view/percentage_view.dart';
import 'package:crypto_calculator/view/profit_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  int index = 0;
  void changeIndex(int index) {
    this.index = index;
    update();
  }
List<String> titleList = ["Profit Calculator","Percentage Calculator","Coin Sell Calculator"];
  List<Widget> screens = [
    ProfitView(),
    PercentageView(),
    CoinSellView(),
  ];
}
