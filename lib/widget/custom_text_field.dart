import 'package:another_xlider/another_xlider.dart';
import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/constants/textstyle_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget customTextField(
    {required TextEditingController controller,
    String? hintText,
    String? frontText,
    String? labelText,
    double? sliderValue = 50,
      double? min = 0,
      double? max = 100000,
    TextStyle? labelStyle,
    TextInputType? textInputType,
    void Function(int, dynamic, dynamic)? onDragCompleted,
    EdgeInsetsGeometry? contentPadding,
    void Function(String)? onChanged,
    FormFieldValidator? validator}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(hintText ?? '', style: TextStyleConstant.style14.copyWith(color: ColorConstant.grey)),
      SizedBox(height: Get.width * 0.01),
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: TextFormField(

              inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
              keyboardType: textInputType,
              validator: validator,
              controller: controller,
              cursorColor: ColorConstant.secondaryColor,
              style: TextStyleConstant.style18.copyWith(color: ColorConstant.primaryColor),
              cursorHeight: 22,
              onChanged: onChanged,
              decoration: InputDecoration(
                  labelStyle: TextStyleConstant.style18.copyWith(color: ColorConstant.grey),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: ColorConstant.secondaryColor, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: ColorConstant.grey, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: ColorConstant.secondaryColor, width: 1)),
                  contentPadding: const EdgeInsets.all(16),
                  hintStyle: TextStyleConstant.style18.copyWith(color: ColorConstant.grey)),
            ),
          ),
          FlutterSlider(
            trackBar: FlutterSliderTrackBar(
              activeTrackBarHeight: 1.5,
              inactiveTrackBarHeight: 1,
              inactiveTrackBar: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorConstant.grey,
              ),
              activeTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: ColorConstant.secondaryColor),
            ),
            handlerHeight: 25,
            handlerWidth: 25,
            handlerAnimation: const FlutterSliderHandlerAnimation(),
            handler: FlutterSliderHandler(
                child: Container(
              height: 25,
              width: 25,
              padding: const EdgeInsets.all(10),
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: ColorConstant.secondaryColor),
              child: Container(
                height: 5,
                width: 5,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: ColorConstant.white),
              ),
            )),
            min: min!,
            max: max!,
            selectByTap: false,
            onDragging: onDragCompleted,
            step: const FlutterSliderStep(step: 1),
            values: [sliderValue!],
            tooltip: FlutterSliderTooltip(disabled: true),
          )
        ],
      ),
    ],
  );
}
