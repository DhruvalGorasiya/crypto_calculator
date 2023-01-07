import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinSellController extends GetxController {
  TextEditingController coins = TextEditingController();
  TextEditingController buyPrice = TextEditingController();
  TextEditingController sellPrice = TextEditingController();

  String totalPrice = '';
  String profit = '';
  String profitPer = '';

  void onTapClear() {
    coins.clear();
    buyPrice.clear();
    sellPrice.clear();
    totalPrice = '';
    profit = '';
    profitPer = '';
    update();
  }

  void onCalculate() {
    if (coins.text.isNotEmpty && sellPrice.text.isNotEmpty) {
      totalPrice = (double.parse(coins.text) * double.parse(sellPrice.text)).toStringAsFixed(2);
      if (buyPrice.text.isNotEmpty) {
        profit = ((double.parse(sellPrice.text) - double.parse(buyPrice.text)) *
                double.parse(coins.text))
            .toStringAsFixed(2);
      }
      profitPer =
          '${(double.parse(sellPrice.text) * 100 / double.parse(buyPrice.text.isEmpty ? '0' : buyPrice.text) - 100).toStringAsFixed(2)} %';
    }
    update();
  }
}
