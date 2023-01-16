import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PercentageController extends GetxController {
  double amount = 1;
  double buyPrice = 1;
  double sellPrices = 1;
  TextEditingController amountController = TextEditingController();
  TextEditingController buyPriceController = TextEditingController();
  TextEditingController profitPerController = TextEditingController();

  String coins = '';
  String sellPrice = '';
  String totalPrice = '';
  String profit = '';

  void onTapClear() {
    amountController.clear();
    buyPriceController.clear();
    profitPerController.clear();
    coins = '';
    sellPrice = '';
    totalPrice = '';
    profit = '';
    update();
  }

  void onCalculate() {
    if (amountController.text.isNotEmpty &&
        buyPriceController.text.isNotEmpty &&
        profitPerController.text.isNotEmpty) {
      coins = (double.parse(amountController.text) /
              double.parse(buyPriceController.text))
          .toStringAsFixed(2);
      sellPrice = (((double.parse(buyPriceController.text) *
                      double.parse(profitPerController.text)) /
                  100) +
              double.parse(buyPriceController.text))
          .toStringAsFixed(2);
      totalPrice = ((double.parse(amountController.text) /
                  double.parse(buyPriceController.text)) *
              double.parse(sellPrice))
          .toStringAsFixed(2);
      profit = (double.parse(totalPrice) - double.parse(amountController.text))
          .toStringAsFixed(2);
    }
    update();
  }
}
