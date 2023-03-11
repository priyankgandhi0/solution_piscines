import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solution_piscines/ui/main/details/details_screen/details_screen_controller.dart';
import 'package:solution_piscines/ui/widgets/common/app_button.dart';
import 'package:solution_piscines/utils/commen_ext.dart';
import 'package:solution_piscines/utils/extensions.dart';

import '../../../../constant/app_strings.dart';
import '../../../../generated/assets.dart';
import '../../../../theme/app_colors.dart';
import '../../../../utils/tab_indicator.dart';
import '../../../widgets/common/appbar.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);
  var controller = Get.put(DetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWithIcons(
          title: details,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(width: 25, height: 25,
              Assets.iconsIcBack, color: appColor,),
          ),
          rightIcon: IconButton(
            onPressed: () {
              // Get.back();
            },
            icon: Image.asset(width: 20, height: 20,
                Assets.iconsIcDelete),
          )
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Obx(() =>
                TabBar(
                  controller: controller.tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: CustomTabIndicator(color: appColor),
                  tabs: [
                    Tab(
                      child: parameter.appCommonText(
                          weight: FontWeight.w500,
                          color: controller.tabIndex.value == 0
                              ? appColor
                              : textHintColor,
                          size: 18),
                    ),
                    Tab(
                      child: instruction.appCommonText(
                          weight: FontWeight.w500,
                          color: controller.tabIndex.value == 1
                              ? appColor
                              : textHintColor,
                          size: 18),
                    ),
                  ],
                )).safeArea,
          ),

          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                Parameters(),
                Instructions(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
                onPress: () {
                  controller.launchURL();
                }, borderValue: 5, text: visitWebsite),
          ).paddingSymmetric(horizontal: 15),
          15.0.spaceH()
        ],
      ),
    );
  }
}

class Parameters extends StatelessWidget {
  Parameters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsScreenController>(
        builder: (ctrl) {
          return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  23.0.spaceH(),

                  if (ctrl.resultData?.volume != null)...[
                    'Parameters For Your ${ctrl.resultData?.volume} L Pool'
                        .appCommonText(
                        size: 20,
                        weight: FontWeight.w600,
                        maxLines: 1,
                        align: TextAlign.start,
                        overflow: TextOverflow.ellipsis
                    )
                        .paddingSymmetric(horizontal: 11),
                  ] else
                    ...[
                      'Parameters For Your 1000 L Pool'
                          .appCommonText()
                          .paddingSymmetric(horizontal: 11),
                    ],

                  23.0.spaceH(),

                  horizontalLine(
                    color: Colors.black.withOpacity(0.3),
                    height: 0.8,
                  ),

                  tabelTitle(),

                  horizontalLine(
                    color: Colors.black.withOpacity(0.3),
                    height: 0.8,
                  ),

                  23.0.spaceH(),

                  chlorine(ctrl),

                  ph(ctrl),

                  alkalinity(ctrl),

                ],
              )
          );
        }
    );
  }

  Widget tabelTitle() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: parameter.appCommonText(
              align: TextAlign.start,
              weight: FontWeight.w600,
              size: 16
          ),
        ),
        Expanded(
          flex: 1,
          child: value.appCommonText(
              align: TextAlign.start,
              weight: FontWeight.w600,
              size: 16
          ),
        ),
        Expanded(
          flex: 1,
          child: recommended.appCommonText(
              align: TextAlign.start,
              weight: FontWeight.w600,
              size: 16
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 12, vertical: 15);
  }

  Widget chlorine(DetailsScreenController ctrl) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: 'Chlorine'.appCommonText(
                align: TextAlign.start,
                weight: FontWeight.w400,
                size: 16
            )
        ),
        if (ctrl.resultData?.chlorine != null)...[
          Expanded(
            flex: 1,
            child: '${ctrl.resultData!.chlorine} ppm'.appCommonText(
                align: TextAlign.start,
                weight: FontWeight.w400,
                size: 16
            ),
          ),
        ] else
          ...[
            Expanded(
              flex: 1,
              child: '1 ppm'.appCommonText(
                  align: TextAlign.start,
                  weight: FontWeight.w400,
                  size: 16
              ),
            ),
          ],

        Expanded(
          flex: 1,
          child: '1-3 ppm'.appCommonText(
              align: TextAlign.start,
              weight: FontWeight.w400,
              size: 16
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 12, vertical: 7);
  }

  Widget ph(DetailsScreenController ctrl) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: 'Ph'.appCommonText(
              align: TextAlign.start,
              weight: FontWeight.w400,
              size: 16
          ),
        ),
        if (ctrl.resultData?.ph != null)...[
          Expanded(
            flex: 1,
            child: ctrl.resultData!.ph.appCommonText(
                align: TextAlign.start,
                weight: FontWeight.w400,
                size: 16
            ),
          ),
        ] else
          ...[
            Expanded(
              flex: 1,
              child: '7.3'.appCommonText(
                  align: TextAlign.start,
                  weight: FontWeight.w400,
                  size: 16
              ),
            ),
          ],

        Expanded(
          flex: 1,
          child: '7.2-7.6'.appCommonText(
              align: TextAlign.start,
              weight: FontWeight.w400,
              size: 16
          ),),
      ],
    ).paddingSymmetric(horizontal: 12, vertical: 7);
  }

  Widget alkalinity(DetailsScreenController ctrl) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: 'Alkalinity'.appCommonText(
              align: TextAlign.start,
              weight: FontWeight.w400,
              size: 16
          ),
        ),
        if (ctrl.resultData?.alkalinity != null)...[
          Expanded(
            flex: 1,
            child: '${ctrl.resultData!.alkalinity} ppm'.appCommonText(
                align: TextAlign.start,
                weight: FontWeight.w400,
                size: 16
            ),
          ),
        ] else
          ...[
            Expanded(
              flex: 1,
              child: '110 ppm'.appCommonText(
                  align: TextAlign.start,
                  weight: FontWeight.w400,
                  size: 16
              ),
            ),
          ],

        Expanded(
          flex: 1,
          child: '80-120 ppm'.appCommonText(
              align: TextAlign.start,
              weight: FontWeight.w400,
              size: 16
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 12, vertical: 7);
  }

}

class Instructions extends StatelessWidget {
  DetailsScreenController detailsScreenController = Get.find<DetailsScreenController>( );
  Instructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<DetailsScreenController>(builder: (ctrl) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              23.0.spaceH(),
              'Instructions For Water Treatment'.appCommonText(
                  size: 20,
                  weight: FontWeight.w600,
                  maxLines: 1,
                  align: TextAlign.start,
                  overflow: TextOverflow.ellipsis
              ).paddingSymmetric(horizontal: 13),
              23.0.spaceH(),
              horizontalLine(
                color: Colors.black.withOpacity(0.3),
                height: 0.8,
              ),
              23.0.spaceH(),
              appCommonTextSpan(
                  text: 'Step 1- ',
                  childText: "Your total volume is ${ctrl.resultData!.volume} so you need ${ctrl.chlorineStick.value} chlorine stick",
                  size: 16,
                  weight: FontWeight.w600,
                  childweight: FontWeight.w400
              ).paddingSymmetric(horizontal: 15),
              15.0.spaceH(),
              appCommonTextSpan(
                  text: 'Step 2- ',
                  childText:"Your total volume is ${ctrl.resultData!.volume} so you need ${ctrl.chlorinePowder.value}g chlorine powder",
                  size: 16,
                  weight: FontWeight.w600,
                  childweight: FontWeight.w400
              ).paddingSymmetric(horizontal: 15),
              15.0.spaceH(),
              appCommonTextSpan(
                  text: 'Step 3- ',
                  childText:"Your ph volume is ${ctrl.resultData!.ph} so you need ${ctrl.phTypeProduct.value}",
                  size: 16,
                  weight: FontWeight.w600,
                  childweight: FontWeight.w400
              ).paddingSymmetric(horizontal: 15),
              15.0.spaceH(),
              appCommonTextSpan(
                  text: 'Step 4- ',
                  childText:ctrl.alkalinityInstruction.value,
                  size: 16,
                  weight: FontWeight.w600,
                  childweight: FontWeight.w400
              ).paddingSymmetric(horizontal: 15)
            ],
          );
        })
    );
  }
}
