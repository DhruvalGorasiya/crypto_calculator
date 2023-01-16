import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/constants/textstyle_constant.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({required String text,Color? bgColor}) {
  return AppBar(
    backgroundColor: bgColor ?? ColorConstant.primaryColor,
    title: Text(text, style: TextStyleConstant.style20),
    centerTitle: true,
  );
}
