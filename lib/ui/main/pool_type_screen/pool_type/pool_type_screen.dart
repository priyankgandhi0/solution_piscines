import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_piscines/ui/main/pool_type_screen/pool_type_enum.dart';
import 'package:solution_piscines/utils/extensions.dart';

import '../../../../constant/app_strings.dart';
import '../../../../generated/assets.dart';
import '../../../../routes/router.dart';
import '../../../../theme/app_colors.dart';
import '../../../widgets/common/app_button.dart';
import '../../../widgets/common/appbar.dart';

class PoolType extends StatelessWidget {
   PoolType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          Image.asset(
            Assets.imagesBgPoolTypeScreen,
            width: Get.size.width,
            height: Get.size.height,
            fit: BoxFit.cover,
          ),
          // HomeAppbar( title: '',context: context,leadingColor: Colors.white,backGroundColor:Colors.transparent),


          SizedBox(
            height: Get.height/2.0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  choosePool.appCommonText(
                      size: 30,
                      weight: FontWeight.w600
                  ),
                  16.0.spaceH(),
                  loremIpsum.appCommonText(
                    size: 18,
                    color: textHintColor,
                    weight: FontWeight.w400,
                    align: TextAlign.center,
                  ),
                  30.0.spaceH(),
                  AppButton(
                      onPress: (){
                        Get.toNamed(Routes.poolTypeDetails,arguments: PoolTypeEnum.round);
                      },
                      borderValue: 5,
                      text: round
                  ),
                  16.0.spaceH(),
                  AppButton(
                      onPress: (){
                        Get.toNamed(Routes.poolTypeDetails,arguments: PoolTypeEnum.oval);
                      },
                      borderValue: 5,
                      text: oval
                  ),
                  16.0.spaceH(),
                  AppButton(
                      onPress: (){
                        Get.toNamed(Routes.poolTypeDetails,arguments: PoolTypeEnum.rectangular);
                      },
                      borderValue: 5,
                      text: rectangle
                  ),
                  16.0.spaceH(),
                ],
              ),
            ),
          ).paddingSymmetric(horizontal: 25),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
                height: 50,
                child: HomeAppbar( title: '',context: context,leadingColor: Colors.white,elevation: 0,backGroundColor:Colors.transparent)),
          ).paddingOnly(top: 15),
        ],
      ),
    );
  }
}
