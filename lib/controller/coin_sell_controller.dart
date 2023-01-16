import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinSellController extends GetxController {
  double coin = 1;
  double buyPrice = 1;
  double sellPrices = 1;
  TextEditingController coinsController = TextEditingController();
  TextEditingController buyPriceController = TextEditingController();
  TextEditingController sellPriceController = TextEditingController();

  String totalPrice = '';
  String profit = '';
  String profitPer = '';

  void onTapClear() {
    coinsController.clear();
    buyPriceController.clear();
    sellPriceController.clear();
    totalPrice = '';
    profit = '';
    profitPer = '';
    update();
  }

  void onCalculate() {
    if (coinsController.text.isNotEmpty &&
        sellPriceController.text.isNotEmpty) {
      totalPrice = (double.parse(coinsController.text) *
              double.parse(sellPriceController.text))
          .toStringAsFixed(2);
      if (buyPriceController.text.isNotEmpty) {
        profit = ((double.parse(sellPriceController.text) -
                    double.parse(buyPriceController.text)) *
                double.parse(coinsController.text))
            .toStringAsFixed(2);
      }
      profitPer =
          '${(double.parse(sellPriceController.text) * 100 / double.parse(buyPriceController.text.isEmpty ? '0' : buyPriceController.text) - 100).toStringAsFixed(2)} %';
    }
    update();
  }
}
