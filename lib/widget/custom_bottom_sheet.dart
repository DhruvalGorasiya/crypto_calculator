// ignore_for_file: prefer_const_constructors

import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/constants/textstyle_constant.dart';
import 'package:crypto_calculator/model/bottom_sheet_model.dart';
import 'package:crypto_calculator/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customBottomSheet({required List<BottomSheetDataModel> data}) {
  return Container(
    height: Get.width * 0.95,
    decoration: const BoxDecoration(
        color: ColorConstant.white, borderRadius: BorderRadius.vertical(top: Radius.circular(36))),
    padding: EdgeInsets.only(left: Get.width * 0.07,right: Get.width * 0.07, top: Get.width * 0.12,bottom: Get.width * 0.05),
    child: Column(children: [
      Column(
        children: List.generate(
          data.length,
          (index) => bottomSheetChild(
            color: data[index].color,
            name: data[index].name,
            value: data[index].value.toString(),
          ),
        ),
      ),
      Spacer(),
      customButton(
        text: "Done",
        onTap: () => Get.back(),
      ),
    ]),
  );
}

Widget bottomSheetChild({required String name, required String value, required Color color}) {
  return Padding(
    padding: EdgeInsets.only(bottom: Get.width * 0.04),
    child: Row(children: [
      Expanded(
        child: Row(
          children: [
            Container(
              height: Get.width * 0.09,
              width: Get.width * 0.09,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
            ),
            SizedBox(
              width: Get.width * 0.05,
            ),
            Text(
              name,
              style: TextStyleConstant.style18
                  .copyWith(color: ColorConstant.grey, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      Text(
        value,
        style: TextStyleConstant.style18
            .copyWith(color: ColorConstant.primaryColor, fontWeight: FontWeight.w500),
      ),
    ]),
  );
}
