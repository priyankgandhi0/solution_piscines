import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../routes/router.dart';


class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      try{
        Get.offAllNamed(Routes.home);
      } on Exception catch(_){
        Get.offAllNamed(Routes.home);
      }
    });
    return Scaffold(
      body:Image.asset(
        Assets.imagesBgSplash,
        width: Get.size.width,
        height: Get.size.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
