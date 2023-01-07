import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class ProfitController extends GetxController{

  TextEditingController amount = TextEditingController();
  TextEditingController buyPrice = TextEditingController();
  TextEditingController sellPrice = TextEditingController();

  String coins = '';
  String totalPrice = '';
  String profit = '';
  String profitPer = '';
  bool valueColor = false;

  void onTapClear(){
    amount.clear();
    buyPrice.clear();
    sellPrice.clear();
    coins = '';
    totalPrice = '';
    profit = '';
    profitPer = '';
    update();
  }
void onCalculate(){
    if(amount.text.isNotEmpty && buyPrice.text.isNotEmpty && sellPrice.text.isNotEmpty) {
      if(double.parse(sellPrice.text) >= double.parse(buyPrice.text)){
        valueColor = true;
      }else{
        valueColor = false;
      }
      coins = (double.parse(amount.text) / double.parse(buyPrice.text)).toStringAsFixed(2);
      totalPrice = ((double.parse(amount.text) / double.parse(buyPrice.text)) * double.parse(sellPrice.text)).toStringAsFixed(2);
      profit = (double.parse(sellPrice.text) - double.parse(buyPrice.text)).toStringAsFixed(2);
      profitPer = '${(double.parse(sellPrice.text) * 100 / double.parse(buyPrice.text) - 100).toStringAsFixed(2)} %';
    }
    update();
}
}