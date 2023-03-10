import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// extension on string
extension extOnString on String {
  get text {
    return Text(this ?? "");
  }

  bool get isEmailValid {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this ?? "");
  }

  bool get isVideo {
    return substring(length - 4, length) == ".mp4";
  }

  File get asFile {
    return File(this);
  }

  String get filename {
    return split('/').last;
  }

  get isValid {
    this.trim().isEmpty;
  }

  // get errorSnack {
  //   showAppSnackBar(
  //     this ?? " ",
  //     type: SnackType.error,
  //   );
  // }

  get isHttpImage {
    return (substring(0, 4) == "http");
  }

  get exntension {
    return split('.').last;
  }


}
Widget horizontalLine({
  double? height,
  double? paddingH,
  double? paddingV,
  Color? color,
}) {
  return Container(
    width: Get.width,
    height: height ?? 1,
    color: color ?? Colors.black,
  ).paddingSymmetric(
    horizontal: paddingH ?? 0.0,
    vertical: paddingV ?? 0.0,
  );
}

extension extOnString2 on String? {
/*  get isNullOrEmpty {
    return this==null || this.isEmpty;
  }*/

  String get toStringOrEmpty{
    if(this == null){
      return "";
    }
    return this!;
  }

  bool get isNotNullOrNotEmpty{
     if(this==null || this!.isEmpty){
       return false;
     }
     return true;
  }
}

extension extOnFile on File {
  String get filename {
    return path.split('/').last;
  }
}

extension extOnDynamic on dynamic {
  get debugprint {
    if (kDebugMode) {
      print("--->(@) ${this.toString()}");
    }
  }

  get printLine {
    if (kDebugMode) {
      print(
          "--------------------------------------------------------------------------------------------->(*)");
    }
  }
}

extension extOnInt on int {
  get heightBox {
    return SizedBox(
      height: toDouble(),
    );
  }

  get widthBox {
    return SizedBox(
      width: toDouble(),
    );
  }

  get squareBox {
    return SizedBox(
      width: toDouble(),
      height: toDouble(),
    );
  }

  heightOfScreen(BuildContext context) {
    return SizedBox(
      height: Get.height * this,
    );
  }

  widthOfScreen(BuildContext context) {
    return SizedBox(
      height: Get.height * this,
    );
  }

  squareOfScreen(BuildContext context) {
    return SizedBox(
      height: Get.height * this,
      width: Get.width * this,
    );
  }
}

/// extension on double
extension extOnDouble on double {
  get paddingHorizontal {
    return EdgeInsets.symmetric(horizontal: this);
  }

  get paddingVerticle {
    return EdgeInsets.symmetric(horizontal: this);
  }

  heightOfScreen(BuildContext context) {
    return SizedBox(
      height: Get.height * this,
    );
  }

  widthOfScreen(BuildContext context) {
    return SizedBox(
      height: Get.height * this,
    );
  }

  squareOfScreen(BuildContext context) {
    return SizedBox(
      height: Get.height * this,
      width: Get.width * this,
    );
  }

  get heightBox {
    return SizedBox(
      height: this,
    );
  }

  get widthBox {
    return SizedBox(
      width: this,
    );
  }

  get squareBox {
    return SizedBox(
      width: this,
      height: this,
    );
  }




  get sHeight{
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  }

  get sWidth{
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
  }


  get isNotNaNOrZero{
    if(isNaN || this == 0.0){
      return false;
    }
    return true;
  }
}

extension extOnNum on num? {
  double toDoubleOrZero() {
    if (this == null || this == 0) {
      return 0;
    } else {
      return this!.toDouble();
    }
  }

  int toIntOrZero() {
    if (this == null) {
      return 0;
    } else {
      return this!.toInt();
    }
  }
}

///extension on widget
extension extOnWidget on Widget {
  Widget get center {
    return Center(
      child: this,
    );
  }

  get safeArea {
    return SafeArea(child: this);
  }

    onClick(GestureTapCallback ontap) {
    return GestureDetector(
      onTap: ontap,
      child: this,
    );
  }

  Widget onTap(GestureTapCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: this,
    );
  }

  onInkClick(GestureTapCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: this,
    );
  }

  makeAlign(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  positioned({double? left, double? right, double? top, double? bottom}) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: this,
    );
  }

  get fittedBox {
    return FittedBox(
      child: this,
    );
  }

  get row {
    return Row(
      children: [this],
    );
  }

  get appContainer {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: this,
    );
  }

  myPadding(
    double? top,
    double? bottom,
    double? left,
    double? right,
  ) {
    return Padding(
      padding: EdgeInsets.only(
          top: top ?? 0.0,
          bottom: bottom ?? 0.0,
          left: left ?? 0.0,
          right: right ?? 0.0),
      child: this,
    );
  }

  // setLoading(RegisterController controller) {
  //   return Stack(
  //     children: [
  //       this,
  //     ],
  //   );
  // }
}

extension extOnScaffold on Scaffold {
  onBackPressed(WillPopCallback onback) {
    return WillPopScope(
      onWillPop: onback,
      child: this,
    );
  }
}

///extension in IconData
extension ExtOnIconData on IconData {
  get icon {
    return Icon(this);
  }
}


extension extOnDateAndTime on DateTime{
  double get timeToDouble => hour + minute/60.0;
}