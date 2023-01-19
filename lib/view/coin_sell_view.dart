import 'package:crypto_calculator/controller/coin_sell_controller.dart';
import 'package:crypto_calculator/widget/custom_button.dart';
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
          child: SizedBox(
            height: Get.height * 0.8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: width * 0.05),
              child: Column(
                children: [
                  Column(children: [
                    customTextField(
                        onChanged: (value) {
                          if (controller.coinsController.text.isEmpty) {
                            controller.coin = 0;
                          } else if (double.parse(controller.coinsController.text) <= 1000000) {
                            controller.coin = double.parse(controller.coinsController.text);
                          } else {
                            controller.coin = 1000000;
                            controller.coinsController.text = '1000000';
                          }
                          controller.update();
                        },
                        onDragCompleted: (handlerIndex, lowerValue, upperValue) {
                          controller.coin = lowerValue;
                          controller.coinsController.text = lowerValue.toString();
                        },
                        min: 0,
                        max: 1000000,
                        sliderValue: controller.coin,
                        frontText: "Coins",
                        hintText: "Coins Quantity",
                        textInputType: TextInputType.number,
                        controller: controller.coinsController),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: width * 0.05),
                      child: customTextField(
                          min: 0,
                          max: 1000000,
                          onChanged: (value) {
                            if (controller.buyPriceController.text.isEmpty) {
                              controller.buyPrice = 0;
                            } else if (double.parse(controller.buyPriceController.text) <= 1000000) {
                              controller.buyPrice =
                                  double.parse(controller.buyPriceController.text);
                            } else {
                              controller.buyPrice = 1000000;
                              controller.buyPriceController.text = '1000000';
                            }
                            controller.update();
                          },
                          onDragCompleted: (handlerIndex, lowerValue, upperValue) {
                            controller.buyPrice = lowerValue;
                            controller.buyPriceController.text = lowerValue.toString();
                          },
                          sliderValue: controller.buyPrice,
                          frontText: "Buy Price",
                          hintText: "Coin Buying Price",
                          textInputType: TextInputType.number,
                          controller: controller.buyPriceController),
                    ),
                    customTextField(
                        min: 0,
                        max: 1000000,
                        onChanged: (value) {
                          if (controller.sellPriceController.text.isEmpty) {
                            controller.sellPrices = 0;
                          } else if (double.parse(controller.sellPriceController.text) <= 1000000) {
                            controller.sellPrices =
                                double.parse(controller.sellPriceController.text);
                          } else {
                            controller.sellPrices = 1000000;
                            controller.sellPriceController.text = '1000000';
                          }
                          controller.update();
                        },
                        sliderValue: controller.sellPrices,
                        onDragCompleted: (handlerIndex, lowerValue, upperValue) {
                          controller.sellPrices = lowerValue;
                          controller.sellPriceController.text = lowerValue.toString();
                        },
                        frontText: "Sell Price",
                        hintText: "Coin Sell Price",
                        textInputType: TextInputType.number,
                        controller: controller.sellPriceController),
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
