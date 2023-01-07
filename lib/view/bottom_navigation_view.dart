import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/constants/image_constant.dart';
import 'package:crypto_calculator/constants/textstyle_constant.dart';
import 'package:crypto_calculator/controller/bottom_navigation_controller.dart';
import 'package:crypto_calculator/widget/custom_appbar.dart';
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
          backgroundColor: ColorConstant.primaryColor,
          appBar: customAppBar(text: "Crypto Cal"),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.index,
            onTap: controller.changeIndex,
            showUnselectedLabels: false,
            selectedLabelStyle: TextStyleConstant.style14,
            iconSize: 25,
            selectedItemColor: ColorConstant.secondaryColor,
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorConstant.lightBlue,
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset( ImageConstant.profit,
                        color: controller.index == 0
                            ? ColorConstant.secondaryColor
                            : ColorConstant.blueGrey,
                        height: 25),
                  ),
                  label: "Profit"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                      controller.index == 1
                          ? ImageConstant.percentageSelected
                          : ImageConstant.percentage,
                      color: controller.index == 1
                          ? ColorConstant.secondaryColor
                          : ColorConstant.blueGrey,
                      height: 25),
                  label: "Percentage"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                      controller.index == 2
                          ? ImageConstant.coinSellSelected
                          : ImageConstant.coinSell,
                      color: controller.index == 2
                          ? ColorConstant.secondaryColor
                          : ColorConstant.blueGrey,
                      height: 25),
                  label: "Coin Sell"),
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
