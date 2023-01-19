import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/model/bottom_sheet_model.dart';
import 'package:crypto_calculator/widget/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfitController extends GetxController {
  double amount = 0;
  double buyPrice = 0;
  double sellPrice = 0;

  TextEditingController amountController = TextEditingController(text: "0");
  TextEditingController buyPriceController = TextEditingController(text: "0");
  TextEditingController sellPriceController = TextEditingController(text: "0");

  String coins = '';
  String totalPrice = '';
  String profit = '';
  String profitPer = '';
  List<BottomSheetDataModel> resultList = [];

  void onCalculate() {
    if (amount != 0 && buyPrice != 0 && sellPrice != 0) {
      coins = (amount / buyPrice).toStringAsFixed(2);
      totalPrice = ((amount / buyPrice) * sellPrice).toStringAsFixed(2);
      profit = (sellPrice - buyPrice).toStringAsFixed(2);
      profitPer = (sellPrice * 100 / buyPrice - 100).toStringAsFixed(2);
      resultList = [
        BottomSheetDataModel(name: "Coins", value: coins, color: ColorConstant.orange),
        BottomSheetDataModel(name: "TotalPrice", value: totalPrice, color: ColorConstant.green),
        BottomSheetDataModel(name: "Profit", value: profit, color: ColorConstant.secondaryColor),
        BottomSheetDataModel(name: "Profit %", value: profitPer, color: ColorConstant.red)
      ];
      Get.bottomSheet(customBottomSheet(data: resultList),
          barrierColor: ColorConstant.primaryColor.withOpacity(0.8),isScrollControlled:true);
    }
    update();
  }
}
