import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/model/bottom_sheet_model.dart';
import 'package:crypto_calculator/widget/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PercentageController extends GetxController {
  double amount = 0;
  double buyPrice = 0;
  double profitPer = 0;
  TextEditingController amountController = TextEditingController(text: "0");
  TextEditingController buyPriceController = TextEditingController(text: "0");
  TextEditingController profitPerController = TextEditingController(text: "0");

  String coins = '';
  String sellPrice = '';
  String totalPrice = '';
  String profit = '';
  List<BottomSheetDataModel> resultList = [];


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
      resultList = [
        BottomSheetDataModel(name: "Coins", value: coins, color: ColorConstant.orange),
        BottomSheetDataModel(name: "TotalPrice", value: totalPrice, color: ColorConstant.green),
        BottomSheetDataModel(name: "Profit", value: profit, color: ColorConstant.secondaryColor),
        BottomSheetDataModel(name: "SellPrice", value: sellPrice, color: ColorConstant.red)
      ];
      Get.bottomSheet(customBottomSheet(data: resultList),
          barrierColor: ColorConstant.primaryColor.withOpacity(0.8),isScrollControlled:true);
    }
    update();
  }
}
