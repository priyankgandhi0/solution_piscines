import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_piscines/model/resultData.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreenController extends GetxController with GetSingleTickerProviderStateMixin{
  late TabController tabController;
  ResultData? resultData;
  var url = 'https://solutionpiscines.com/';
  @override
  void onInit() {
    super.onInit();
    resultData = Get.arguments;
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(() {
      tabIndex.value = tabController.index;
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
  var tabIndex = 0.obs;

  launchURL() async {

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  void launchURL1() async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}