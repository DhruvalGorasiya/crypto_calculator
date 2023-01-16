import 'package:crypto_calculator/controller/profit_controller.dart';
import 'package:crypto_calculator/widget/custom_button.dart';
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
                        controller: controller.amountController,
                        hintText: "Investing Amount",
                        textInputType: TextInputType.number,
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
                        onDragCompleted:
                            (handlerIndex, lowerValue, upperValue) {
                          controller.amount = lowerValue;
                          controller.amountController.text =
                              lowerValue.toString();
                        },
                        sliderValue: controller.amount),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: width * 0.05),
                      child: customTextField(
                          min: 1,
                          max: 1000000,
                          controller: controller.buyPriceController,
                          hintText: "Coin Buying Price",
                          textInputType: TextInputType.number,
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
                          sliderValue: controller.buyPrice),
                    ),
                    customTextField(
                        min: 1,
                        max: 1000000,
                        controller: controller.sellPriceController,
                        hintText: "Coin Sell Price",
                        textInputType: TextInputType.number,
                        onChanged: (value) {
                          if (double.parse(
                                  controller.sellPriceController.text) <=
                              1000000) {
                            controller.sellPrice = double.parse(
                                controller.sellPriceController.text);
                          } else {
                            controller.sellPrice = 1000000;
                            controller.sellPriceController.text = '1000000';
                          }
                          controller.update();
                        },
                        onDragCompleted:
                            (handlerIndex, lowerValue, upperValue) {
                          controller.sellPrice = lowerValue;
                          controller.sellPriceController.text =
                              lowerValue.toString();
                        },
                        sliderValue: controller.sellPrice),
                  ]),
                  const Spacer(),
                  customButton(text: "CALCULATE", onTap: controller.onCalculate)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
