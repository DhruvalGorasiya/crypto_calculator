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
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: width * 0.05),
            child: Column(
              children: [
                Column(children: [
                  customTextField(
                      min: 1,
                      max: 1000000,
                      frontText: "Amount",
                      hintText: "Investing Amount",
                      textInputType: TextInputType.number,
                      sliderValue: 100,
                      onChanged: (value) {
                        if (double.parse(controller.amountController.text) <=
                            1000000) {
                          controller.amount =
                              double.parse(controller.amountController.text);
                        } else {
                          controller.amount = 1000000;
                          controller.amountController.text = '1000000';
                        }
                        controller.update();
                      },
                      onDragCompleted: (handlerIndex, lowerValue, upperValue) {
                        controller.amount = lowerValue;
                        controller.amountController.text =
                            lowerValue.toString();
                      },
                      controller: controller.amountController),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: width * 0.05),
                    child: customTextField(
                        min: 1,
                        max: 1000000,
                        onChanged: (value) {
                          if (double.parse(
                                  controller.buyPriceController.text) <=
                              1000000) {
                            controller.buyPrice = double.parse(
                                controller.buyPriceController.text);
                          } else {
                            controller.buyPrice = 1000000;
                            controller.buyPriceController.text = '1000000';
                          }
                          controller.update();
                        },
                        onDragCompleted:
                            (handlerIndex, lowerValue, upperValue) {
                          controller.buyPrice = lowerValue;
                          controller.buyPriceController.text =
                              lowerValue.toString();
                        },
                        frontText: "Buy Price",
                        hintText: "Coin Buying Price",
                        textInputType: TextInputType.number,
                        controller: controller.buyPriceController),
                  ),
                  customTextField(
                      min: 1,
                      max: 1000000,
                      onChanged: (value) {
                        if (double.parse(controller.profitPerController.text) <=
                            1000000) {
                          controller.sellPrices =
                              double.parse(controller.profitPerController.text);
                        } else {
                          controller.sellPrices = 1000000;
                          controller.profitPerController.text = '1000000';
                        }
                        controller.update();
                      },
                      onDragCompleted: (handlerIndex, lowerValue, upperValue) {
                        controller.sellPrices = lowerValue;
                        controller.profitPerController.text =
                            lowerValue.toString();
                      },
                      frontText: "Profit %",
                      hintText: "Profit want in %",
                      textInputType: TextInputType.number,
                      controller: controller.profitPerController),
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
