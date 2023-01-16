import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/controller/percentage_controller.dart';
import 'package:crypto_calculator/widget/custom_button.dart';
import 'package:crypto_calculator/widget/custom_result_container.dart';
import 'package:crypto_calculator/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PercentageView extends StatelessWidget {
  PercentageView({Key? key}) : super(key: key);
  final PercentageController controller = Get.put(PercentageController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<PercentageController>(builder: (controller) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: Get.height * 0.8,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: width * 0.05),
            child: Column(
              children: [
                Column(children: [
                  customTextField(
                      frontText: "Amount",
                      hintText: "Investing Amount",
                      textInputType: TextInputType.number,
                      sliderValue: 100,
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
                      frontText: "Profit %",
                      hintText: "Profit want in %",
                      textInputType: TextInputType.number,
                      controller: controller.profitPer),
                ]),
                Spacer(),
                customButton(text: "CALCULATE", onTap: controller.onCalculate)
              ],
            ),
          ),
        ),
      );
    });
  }
}
