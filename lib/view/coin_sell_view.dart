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
