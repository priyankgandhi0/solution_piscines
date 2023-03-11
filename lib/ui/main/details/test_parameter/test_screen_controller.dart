import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../model/resultData.dart';
import '../../../../routes/router.dart';

class TestParameterScreenController extends GetxController{

  final TextEditingController chlorineTextFieldController = TextEditingController();
  final TextEditingController phTextFieldController = TextEditingController();
  final TextEditingController alkalinityTextFieldController = TextEditingController();
  ResultData? allData;
  var knowTheVolume = false.obs;
  var volume;
  var testParams = GlobalKey<FormState>();
  @override
  void onInit() {
    volume = Get.arguments;

    super.onInit();
  }

  void testParameters() {
    List result =['round',volume,chlorineTextFieldController.text,phTextFieldController.text,alkalinityTextFieldController.text];
    double resultPh = double.parse(phTextFieldController.text) ;
    if (resultPh > 7.6) {
      double volumeNew = double.parse(volume);
      double finalResult = volumeNew/10000 * 150;
      print('resultPh =====>>>>> $finalResult');
    }

    allData =  ResultData(
        waterId: 'round',
        volume: volume,
        chlorine: chlorineTextFieldController.text,
        ph: phTextFieldController.text,
        alkalinity: alkalinityTextFieldController.text
    );
    Get.toNamed(Routes.details,arguments: allData);
  }
}