import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_piscines/constant/app_strings.dart';
import 'package:solution_piscines/theme/app_colors.dart';
import 'package:solution_piscines/ui/widgets/common/app_button.dart';
import 'package:solution_piscines/utils/extensions.dart';
import '../../../generated/assets.dart';
import '../../../routes/router.dart';

class HomeScreen extends StatelessWidget {
     HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            Assets.imagesBgHome,
            width: Get.size.width,
            height: Get.size.height,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: Get.height/2.5,
            child: Column(
              children: [
                funBegins.appCommonText(
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
                25.0.spaceH(),
                AppButton(
                    onPress: (){
                      Get.toNamed(Routes.poolType);
                    },
                    borderValue: 5,
                    text: createNew,
                ),
                20.0.spaceH(),
                SizedBox(
                  height: 50,
                  child:BorderButton(
                    text: history, onTap: () {
                    Get.toNamed(Routes.history);
                  }, value: 5,
                    appButtonColor: Colors.white,
                    appTextFillColor: appColor,
                    appBorderFillColor: appColor,
                  ),
                )
              ],
            ),
          ).paddingSymmetric(horizontal: 25),
        ],
      ),
    );

  }
}
