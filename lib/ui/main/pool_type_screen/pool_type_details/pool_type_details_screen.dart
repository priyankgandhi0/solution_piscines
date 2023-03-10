import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:solution_piscines/constant/app_strings.dart';
import 'package:solution_piscines/theme/app_colors.dart';
import 'package:solution_piscines/ui/widgets/common/appbar.dart';
import 'package:solution_piscines/utils/extensions.dart';

import '../../../widgets/common/app_button.dart';
import '../../../widgets/common/app_textfield.dart';
import '../pool_type_enum.dart';
import 'pool_type_details_controller.dart';


class PoolTypeDetailsScreen extends StatelessWidget {
  PoolTypeDetailsScreen({Key? key}) : super(key: key);
  var controller =  Get.put(PoolTypeDetailsController());
  var poolTypeKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(
        title: controller.title,
        leadingColor: appColor,
        elevation: 1.7,
      ),
      body: GetBuilder<PoolTypeDetailsController>(builder: (ctrl) {
          return SingleChildScrollView(
            child: Form(
              key: poolTypeKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  20.0.spaceH(),

                  avgdepth.appCommonText(
                    color: Colors.black,
                    weight: FontWeight.w500,
                    size: 18,
                  ).paddingSymmetric(horizontal: 20),

                  10.0.spaceH(),

                  AppStartUpTextField(
                    hint: enterDepth,
                    // validator: (v){
                    //   if (ctrl.depthTextFieldController.text.isEmpty) {
                    //     return 'Filed not be Empty';
                    //   }
                    //   return null;
                    // },
                    textInputFormet:<TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,9}'))
                    ],
                    textInputType: TextInputType.number,
                    controller: ctrl.depthTextFieldController,
                  ).paddingSymmetric(horizontal: 20),

                  10.0.spaceH(),

                  if (ctrl.poolType == PoolTypeEnum.round)...[
                    diameter.appCommonText(
                      color: Colors.black,
                      weight: FontWeight.w500,
                      size: 18,
                    ).paddingSymmetric(horizontal: 20),

                    10.0.spaceH(),
                    AppStartUpTextField(
                      hint: enterDiameter,
                      textInputFormet:<TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,9}'))
                      ],
                      textInputType: TextInputType.number,
                      controller: ctrl.diaMeterTextFieldController,
                    ).paddingSymmetric(horizontal: 20),
                  ]else...[
                    length.appCommonText(
                      color: Colors.black,
                      weight: FontWeight.w500,
                      size: 18,
                    ).paddingSymmetric(horizontal: 20),

                    10.0.spaceH(),

                    AppStartUpTextField(
                      hint: enterLength,
                      textInputFormet:<TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,9}'))
                      ],
                      textInputType: TextInputType.number,
                      controller: ctrl.lengthTextFieldController,
                    ).paddingSymmetric(horizontal: 20),

                    10.0.spaceH(),

                    width.appCommonText(
                      color: Colors.black,
                      weight: FontWeight.w500,
                      size: 18,
                    ).paddingSymmetric(horizontal: 20),

                    10.0.spaceH(),

                    AppStartUpTextField(
                      hint: enterWidth,
                      textInputFormet:<TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,9}'))
                      ],
                      textInputType: TextInputType.number,
                      controller: ctrl.widthTextFieldController,
                    ).paddingSymmetric(horizontal: 20),
                  ],


                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.all(appColor),
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        value: controller.knowTheVolume.value,
                        onChanged: (value) {
                          controller.knowTheVolume.value =
                          !controller.knowTheVolume.value;
                        },
                      ),
                      knowVolume.appCommonText(
                          weight: FontWeight.w400,
                          size: 14
                      ),

                    ],

                  ).paddingOnly(left: 7),),

                  Obx(() => controller.knowTheVolume.value ?
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.0.spaceH(),
                          'Volume'.appCommonText(
                            color: Colors.black,
                            weight: FontWeight.w500,
                            size: 18,
                          ).paddingSymmetric(horizontal: 20),
                          10.0.spaceH(),
                          AppStartUpTextField(
                            hint: 'Enter Volume',
                            textInputFormet:<TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,9}'))
                            ],
                            textInputType: TextInputType.number,
                            controller: ctrl.volumeTextFieldController,
                          ).paddingSymmetric(horizontal: 20),
                        ],
                    ) :Container()
                  ),
                  15.0.spaceH(),
                  AppButton(
                      onPress: (){
                        // if (poolTypeKey.currentState!.validate()) {
                        if (ctrl.volumeTextFieldController.text.isNotEmpty ||
                            ctrl.depthTextFieldController.text.isNotEmpty ||
                            ctrl.diaMeterTextFieldController.text.isNotEmpty) {
                            ctrl.nextScreen();
                        }else {
                          var snackBar = SnackBar(content:'Please enter value or enter volume value'.appCommonText(
                              size: 15,
                              color: Colors.white,
                              weight: FontWeight.w400,
                           ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        // }
                      },
                      borderValue: 5,
                      text: next
                  ).paddingSymmetric(horizontal: 20),
                ],
              ),
            ),
          );
        }
      ),
    );

  }

}
