import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/controller/profit_controller.dart';
import 'package:crypto_calculator/widget/custom_button.dart';
import 'package:crypto_calculator/widget/custom_result_container.dart';
import 'package:crypto_calculator/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfitView extends StatelessWidget {
  ProfitView({Key? key}) : super(key: key);
  final ProfitController controller = Get.put(ProfitController());
  @override
  Widget build(BuildContext context) {
double width = MediaQuery.of(context).size.width;
    return GetBuilder<ProfitController>(
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: width * 0.05),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(width * 0.05),
                  width: width,
                  decoration: BoxDecoration(
                      color: ColorConstant.lightBlue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    customTextField(
                        frontText: "Amount",
                        hintText: "Investing Amount",
                        textInputType: TextInputType.number,
                        controller: controller.amount),
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
                      color: ColorConstant.lightBlue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      resultContainer(
                          text: "Coins",
                          value: controller.coins,
                          valueColor: ColorConstant.secondaryColor),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: width * 0.05),
                        child: resultContainer(
                            text: "Total Price",
                            value: controller.totalPrice,
                            valueColor: controller.valueColor
                                ? ColorConstant.green
                                : ColorConstant.red),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: width * 0.05),
                        child: resultContainer(
                            text: "Profit",
                            value: controller.profit,
                            valueColor: controller.valueColor
                                ? ColorConstant.green
                                : ColorConstant.red),
                      ),
                      resultContainer(
                          text: "Profit %",
                          value: controller.profitPer,
                          valueColor: controller.valueColor
                              ? ColorConstant.green
                              : ColorConstant.red),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customButton(
                        text: "CALCULATE", onTap: controller.onCalculate),
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
