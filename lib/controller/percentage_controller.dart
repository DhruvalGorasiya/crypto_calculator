import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PercentageController extends GetxController{
  TextEditingController amount = TextEditingController();
  TextEditingController buyPrice = TextEditingController();
  TextEditingController profitPer = TextEditingController();

  String coins = '';
  String sellPrice = '';
  String totalPrice = '';
  String profit = '';

  void onTapClear(){
    amount.clear();
    buyPrice.clear();
    profitPer.clear();
    coins = '';
    sellPrice = '';
    totalPrice = '';
    profit = '';
    update();
  }
  void onCalculate(){
    if(amount.text.isNotEmpty && buyPrice.text.isNotEmpty && profitPer.text.isNotEmpty) {
      coins = (double.parse(amount.text) / double.parse(buyPrice.text)).toStringAsFixed(2);
      sellPrice = (((double.parse(buyPrice.text) * double.parse(profitPer.text)) / 100) + double.parse(buyPrice.text)).toStringAsFixed(2);
      totalPrice = ((double.parse(amount.text) / double.parse(buyPrice.text)) * double.parse(sellPrice)).toStringAsFixed(2);
      profit = (double.parse(totalPrice) - double.parse(amount.text)).toStringAsFixed(2);
    }
    update();
  }
}