import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/constants/image_constant.dart';
import 'package:crypto_calculator/controller/bottom_navigation_controller.dart';
import 'package:crypto_calculator/widget/custom_appbar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationView extends StatelessWidget {
  BottomNavigationView({Key? key}) : super(key: key);
  final BottomNavigationController controller = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorConstant.white,
          appBar: customAppBar(text: controller.titleList[controller.index]),
          bottomNavigationBar: CurvedNavigationBar(
            index: controller.index,
            onTap: controller.changeIndex,
            buttonBackgroundColor: ColorConstant.secondaryColor,
            height: 65,
            backgroundColor: Colors.transparent,
            color: ColorConstant.primaryColor,
            items: [Image.asset( ImageConstant.profit,
                color: controller.index == 0
                    ? ColorConstant.white
                    : ColorConstant.grey,
                height: 25),
              Image.asset(
                  controller.index == 1
                      ? ImageConstant.percentageSelected
                      : ImageConstant.percentage,
                  color: controller.index == 1
                      ? ColorConstant.white
                      : ColorConstant.grey,
                  height: 25),
              Image.asset(
                  controller.index == 2
                      ? ImageConstant.coinSellSelected
                      : ImageConstant.coinSell,
                  color: controller.index == 2
                      ? ColorConstant.white
                      : ColorConstant.grey,
                  height: 25),
            ],
          ),
          body: IndexedStack(
            index: controller.index,
            children: controller.screens,
          ),
        );
      },
    );
  }
}
