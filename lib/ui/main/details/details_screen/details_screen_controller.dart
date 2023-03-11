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
    chlorineSuggest(int.parse(resultData!.volume,),double.parse(resultData!.ph),int.parse(resultData!.alkalinity));
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
  RxInt chlorineStick = 1.obs;
  RxInt chlorinePowder = 130.obs;
  RxString phTypeProduct = "".obs;
  RxString alkalinityInstruction = "".obs;


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

  chlorineSuggest(int volume,double phLevel,int alkalinityLevel){
    // var volume = 10000;
    int count = 25000;
    // int tempPowder = 130;
    for(var i=1;i<=1000;i++){
      int num = count*i;


      if( volume <= num){
        print("num:-> $num");
        print("chlorine count --> $i");
        chlorineStick.value = i;
        break;
      }
      // print('$num*$i=$num');
    }


    if(volume <= 10000){
       chlorinePowder.value = 130;
      print("powder ---> ${chlorinePowder.value}");
    }else{
      var tempCount  = volume/10000;
      var powder = tempCount*130;
      chlorinePowder.value = powder.toInt();
      print("powder ---> ${chlorinePowder.value}");
    }
    
    if(phLevel <= 7.1){
      phTypeProduct.value = "PH+";
    }else if(phLevel >= 7.7){
      phTypeProduct.value = "PH-";
    } else{
      phTypeProduct.value = "nothing for it ";
    }

    if(alkalinityLevel >= 120){
      alkalinityInstruction.value = "Do not touch alkalinity, it is too high";
    } else if(alkalinityLevel <= 80){
      alkalinityInstruction.value = "Do not touch alkalinity";
    }
    else{
      alkalinityInstruction.value = "alkalinity is perfect no addition needed yet";
    }
    
  }


}