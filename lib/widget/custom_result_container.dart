import 'package:crypto_calculator/constants/textstyle_constant.dart';
import 'package:flutter/cupertino.dart';

Widget resultContainer({required String text,String? value,Color? valueColor}){
  return Row(
    children: [
      Expanded(child: Text(text,style: TextStyleConstant.style18,)),
      Expanded(child: Text(value ?? '',style: TextStyleConstant.style18.copyWith(color: valueColor),)),
    ],
  );
}