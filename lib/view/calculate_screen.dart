import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/constants/image_constant.dart';
import 'package:crypto_calculator/constants/textstyle_constant.dart';
import 'package:crypto_calculator/controller/calculate_controller.dart';
import 'package:crypto_calculator/model/chart_data.dart';
import 'package:crypto_calculator/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CalculateScreen extends StatelessWidget {
   CalculateScreen({Key? key}) : super(key: key);
final CalculateController controller = Get.put(CalculateController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalculateController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorConstant.primaryColor,
        body: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GestureDetector(
              onTap: ()=> Get.back(),
              child: Container(
                margin: EdgeInsets.only(
                  top: Get.width * 0.1,
                  left: Get.width * 0.07,
                  bottom: Get.width * 0.05,
                ),
                height: Get.width * 0.05,
                width: Get.width * 0.05,
                child: SvgPicture.asset(ImageConstant.backIcon),
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                  "Result",
                  style: TextStyleConstant.style32,
                ),
            ),
            Container(
                child: SfCircularChart(
                    series: <CircularSeries>[
                      // Renders doughnut chart
                      DoughnutSeries<ChartData, String>(
                          dataSource: controller.chartData,
                          pointColorMapper:(ChartData data,  _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          innerRadius: '85%',
                      )
                    ]
                )
            )
          ]),
        ),
      );
    },);
  }
}
