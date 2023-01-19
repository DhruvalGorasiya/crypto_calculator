import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/model/bottom_sheet_model.dart';
import 'package:crypto_calculator/widget/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinSellController extends GetxController {
  double coin = 0;
  double buyPrice = 0;
  double sellPrices = 0;
  TextEditingController coinsController = TextEditingController(text: "0");
  TextEditingController buyPriceController = TextEditingController(text: "0");
  TextEditingController sellPriceController = TextEditingController(text: "0");

  String totalPrice = '';
  String profit = '';
  String profitPer = '';
  List<BottomSheetDataModel> resultList = [];

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
      resultList = [
        BottomSheetDataModel(name: "Profit %", value: profitPer.toUpperCase() == 'NAN %' ? '0.00' : profitPer, color: ColorConstant.orange),
        BottomSheetDataModel(name: "TotalPrice", value: totalPrice, color: ColorConstant.green),
        BottomSheetDataModel(name: "Profit", value: profit, color: ColorConstant.secondaryColor),
      ];
      Get.bottomSheet(customBottomSheet(data: resultList),
          barrierColor: ColorConstant.primaryColor.withOpacity(0.8),isScrollControlled:true);

    }
    update();
  }
}
