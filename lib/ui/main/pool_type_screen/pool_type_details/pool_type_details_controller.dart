import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_piscines/ui/main/pool_type_screen/pool_type_enum.dart';
import '../../../../constant/app_strings.dart';
import '../../../../routes/router.dart';

class PoolTypeDetailsController extends GetxController{

  var knowTheVolume = false.obs;

  final TextEditingController depthTextFieldController = TextEditingController();
  final TextEditingController diaMeterTextFieldController = TextEditingController();
  final TextEditingController volumeTextFieldController = TextEditingController();
  final TextEditingController lengthTextFieldController = TextEditingController();
  final TextEditingController widthTextFieldController = TextEditingController();
  PoolTypeEnum? poolType;
  String title = '';

  @override
  void onInit() async {
    poolType = Get.arguments;
    if (poolType == PoolTypeEnum.round) {
      title = round;
    }if (poolType == PoolTypeEnum.oval) {
      title = oval;
    }if (poolType == PoolTypeEnum.rectangular) {
      title = rectangle;
    }


    update();
    super.onInit();
  }


  void nextScreen(){
    if (poolType == PoolTypeEnum.round) {
      roundCalculation();
    }
    if (poolType == PoolTypeEnum.oval) {
      ovalCalculation();
    }
    if (poolType == PoolTypeEnum.rectangular) {
      rectangularCalculation();
    }
  }

  void roundCalculation() async {

    if (knowTheVolume.value) {
      var volume = double.parse(volumeTextFieldController.text).toStringAsFixed(0);
      print('Volume =====>>>>> Go to another page');
      Get.toNamed(Routes.testParameter,arguments: volume);
    } else {
      double diameterValue = double.parse(diaMeterTextFieldController.text);
      double depthValue = double.parse(depthTextFieldController.text);
      var radius = diameterValue / 2;
      var volume = (3.14 * radius * radius * depthValue * 28.31).toStringAsFixed(0);
      print('Volume =====>>>>> $volume');
      Get.toNamed(Routes.testParameter,arguments: volume);
    }
  }

  void ovalCalculation() {
    if (knowTheVolume.value) {
      var volume = double.parse(volumeTextFieldController.text).toStringAsFixed(0);
      print('Volume =====>>>>> Go to another page');
      Get.toNamed(Routes.testParameter,arguments: volume);
    }else{
      double depthValue = double.parse(depthTextFieldController.text);
      double widthValue = double.parse(depthTextFieldController.text);
      double lengthValue = double.parse(lengthTextFieldController.text);
      var volume = ((( 3.14 * widthValue * lengthValue) / 4) * depthValue).toStringAsFixed(0);
      print('Volume =====>>>>> $volume');
      Get.toNamed(Routes.testParameter,arguments: volume);
    }
  }

  void rectangularCalculation() {
    if (knowTheVolume.value) {
      var volume = double.parse(volumeTextFieldController.text).toStringAsFixed(0);
      print('Volume =====>>>>> Go to another page');
      Get.toNamed(Routes.testParameter,arguments: volume);
    }else{
      double depthValue = double.parse(depthTextFieldController.text);
      double widthValue = double.parse(depthTextFieldController.text);
      double lengthValue = double.parse(lengthTextFieldController.text);
      var volume = (depthValue * widthValue * lengthValue).toStringAsFixed(0);
      Get.toNamed(Routes.testParameter,arguments: volume);
    }
  }
}