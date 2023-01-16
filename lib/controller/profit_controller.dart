import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfitController extends GetxController{

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
void onCalculate(){
    if(amount != 0 && buyPrice != 0 && sellPrice != 0) {
      if(sellPrice >=buyPrice){
        valueColor = true;
      }else{
        valueColor = false;
      }
      coins = (amount / buyPrice).toStringAsFixed(2);
      totalPrice = ((amount / buyPrice) * sellPrice).toStringAsFixed(2);
      profit = (sellPrice -buyPrice).toStringAsFixed(2);
      profitPer = '${(sellPrice * 100 / buyPrice - 100).toStringAsFixed(2)} %';
    }

    update();
}
}