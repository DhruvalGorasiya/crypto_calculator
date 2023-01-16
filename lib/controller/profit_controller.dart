import 'package:crypto_calculator/Router/routes.dart';
import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/model/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfitController extends GetxController {

  double amount = 1;
  double buyPrice = 1;
  double sellPrice = 1;

  TextEditingController amountController = TextEditingController(text: "1");
  TextEditingController buyPriceController = TextEditingController(text: "1");
  TextEditingController sellPriceController = TextEditingController(text: "1");

  String coins = '';
  String totalPrice = '';
  String profit = '';
  String profitPer = '';
  bool valueColor = false;
  List<ChartData> chartDataList = [];

  void onCalculate() {
    if (amount != 0 && buyPrice != 0 && sellPrice != 0) {
      if (sellPrice >= buyPrice) {
        valueColor = true;
      } else {
        valueColor = false;
      }
      coins = (amount / buyPrice).toStringAsFixed(2);
      totalPrice = ((amount / buyPrice) * sellPrice).toStringAsFixed(2);
      profit = (sellPrice - buyPrice).toStringAsFixed(2);
      profitPer = (sellPrice * 100 / buyPrice - 100).toStringAsFixed(2);
      chartDataList.clear();
      print("$buyPrice,$sellPrice,$profit,$coins,$profitPer,$totalPrice");
      chartDataList.addAll([
        ChartData(x: "Coins", y: double.parse(coins), color: ColorConstant.orange),
        ChartData(x: "TotalPrice", y: double.parse(totalPrice), color: ColorConstant.green),
        ChartData(x: "Profit", y: double.parse(profit), color: ColorConstant.secondaryColor),
        ChartData(x: "Profit %", y: double.parse(profitPer), color: ColorConstant.red)
      ]);
      Get.toNamed(Routes.calculateView, arguments: chartDataList);
    }
    update();
  }
}