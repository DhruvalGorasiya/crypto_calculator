import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/constants/textstyle_constant.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({required String text}) {
  return AppBar(
    backgroundColor: ColorConstant.secondaryColor,
    title: Text(text, style: TextStyleConstant.style20),
    centerTitle: true,
  );
}
