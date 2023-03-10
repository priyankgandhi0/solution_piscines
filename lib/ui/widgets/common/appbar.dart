import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_piscines/generated/assets.dart';
import 'package:solution_piscines/utils/commen_ext.dart';
import 'package:solution_piscines/utils/extensions.dart';

AppBar HomeAppbar({
  String? title,
  BuildContext? context,
  Color? backGroundColor,
  double? elevation,
  Color? leadingColor
}) {
  return AppBar(

    centerTitle: true,
    elevation: elevation,
    backgroundColor: backGroundColor ?? Colors.white,
    leading: GestureDetector(
      child: Image.asset(
        height: 20,
        width: 20,
        Assets.iconsIcBack,color: leadingColor ?? Colors.white,),
      onTap: () {
        Get.back();
      },
    ),
    title: title!.appCommonText(color: Colors.black, size: 22,weight: FontWeight.w600 ),
  );
}

AppBar appbarWithBackIcon({
  required Widget title,
  required GestureTapCallback onBackClick,
  Widget? rightWidget,
}) {
  return AppBar(
    toolbarHeight: 70,
    centerTitle: true,
    leading: Container(
      width: 48,
      height: 48,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Image.asset(Assets.iconsIcBack, color: Colors.white),
    ).paddingOnly(left: 15).onClick(onBackClick),
    title: title,
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      rightWidget!,
    ],
  );
}

AppBar appbarWithIcons(
    {required String title,
    required Widget leading,
    required Widget rightIcon,
    double? elevation,
    }) {
  return AppBar(
      centerTitle: true,
      leading: leading,
      title: title.appCommonText(color: Colors.black, size: 22,weight: FontWeight.w600 ),
      backgroundColor: Colors.white,
      elevation: elevation ?? 0,
      actions: <Widget>[rightIcon.paddingOnly(right: 10)]);
}
