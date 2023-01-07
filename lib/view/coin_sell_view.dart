import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/controller/coin_sell_controller.dart';
import 'package:crypto_calculator/widget/custom_button.dart';
import 'package:crypto_calculator/widget/custom_result_container.dart';
import 'package:crypto_calculator/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinSellView extends StatelessWidget {
  CoinSellView({Key? key}) : super(key: key);
  final CoinSellController controller = Get.put(CoinSellController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<CoinSellController>(
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: width * 0.05),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(width * 0.05),
                  width: width,
                  decoration: BoxDecoration(
                      color: ColorConstant.lightBlue, borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    customTextField(
                        frontText: "Coins",
                        hintText: "Coins Quantity",
                        textInputType: TextInputType.number,
                        controller: controller.coins),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: width * 0.05),
                      child: customTextField(
                          frontText: "Buy Price",
                          hintText: "Coin Buying Price",
                          textInputType: TextInputType.number,
                          controller: controller.buyPrice),
                    ),
                    customTextField(
                        frontText: "Sell Price",
                        hintText: "Coin Sell Price",
                        textInputType: TextInputType.number,
                        controller: controller.sellPrice),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.all(width * 0.05),
                  margin: EdgeInsets.only(top: width * 0.05),
                  width: width,
                  decoration: BoxDecoration(
                      color: ColorConstant.lightBlue, borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: width * 0.05),
                        child: resultContainer(
                            text: "Total Price",
                            value: controller.totalPrice,
                            valueColor: double.parse(controller.profit.isEmpty ?"0":controller.profit ) < 0
                                ? ColorConstant.red
                                : ColorConstant.green),
                      ),
                      controller.buyPrice.text.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.only(bottom: width * 0.05),
                              child: resultContainer(
                                  text: "Profit",
                                  value: controller.profit,
                                  valueColor: double.parse(controller.profit.isEmpty ?"0":controller.profit) < 0
                                      ? ColorConstant.red
                                      : ColorConstant.green),
                            )
                          : const SizedBox(),
                      resultContainer(
                          text: "Profit %",
                          value: controller.profitPer == "Infinity %" ? "0" : controller.profitPer,
                          valueColor: double.parse(controller.profit.isEmpty ?"0":controller.profit) < 0
                              ? ColorConstant.red
                              : ColorConstant.green),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customButton(text: "CALCULATE", onTap: controller.onCalculate),
                    customButton(text: "CLEAR", onTap: controller.onTapClear),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
