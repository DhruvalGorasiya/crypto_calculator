import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/constants/textstyle_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget customDrawerButton({required String text, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      margin: EdgeInsets.symmetric(vertical: Get.width * 0.05),
      width: Get.width * 0.6,
      height: Get.width * 0.13,
      decoration:const BoxDecoration(
        color: ColorConstant.secondaryColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(8),topRight: Radius.circular(8)),
      ),
      child: Center(
        child: Text(text, style: TextStyleConstant.style18),
      ),
    ),
  );
}