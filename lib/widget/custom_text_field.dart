import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/constants/textstyle_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customTextField(
    {TextEditingController? controller,
    String? hintText,
    String? frontText,
    String? labelText,
    TextStyle? labelStyle,
    TextInputType? textInputType,
    EdgeInsetsGeometry? contentPadding,
    FormFieldValidator? validator}) {
  return Row(children: [
    Expanded(flex: 2, child: Text(frontText!, style: TextStyleConstant.style20)),
    Expanded(
        flex: 4,
        child: TextFormField(
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
          keyboardType: textInputType,
          validator: validator,
          controller: controller,
          cursorColor: ColorConstant.secondaryColor,
          style: TextStyleConstant.style18,
          cursorHeight: 22,
          decoration: InputDecoration(
              labelText: labelText,
              labelStyle: labelStyle,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: ColorConstant.secondaryColor, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: ColorConstant.blueGrey, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: ColorConstant.secondaryColor, width: 2)),
              contentPadding: contentPadding ?? const EdgeInsets.all(15),
              hintText: hintText,
              hintStyle: TextStyleConstant.style18.copyWith(color: ColorConstant.blueGrey)),
        )),
  ]);
}
