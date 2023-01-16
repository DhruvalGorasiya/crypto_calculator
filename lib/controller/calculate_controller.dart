import 'package:crypto_calculator/constants/color_constant.dart';
import 'package:crypto_calculator/model/chart_data.dart';
import 'package:get/get.dart';

class CalculateController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    chartData.clear();
    chartData = Get.arguments as List<ChartData>;
  }

  List<ChartData> chartData = [];

}
