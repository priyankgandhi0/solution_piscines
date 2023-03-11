import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:solution_piscines/constant/app_strings.dart';
import 'package:solution_piscines/theme/app_colors.dart';
import 'package:solution_piscines/ui/main/details/test_parameter/test_screen_controller.dart';
import 'package:solution_piscines/ui/widgets/common/appbar.dart';
import 'package:solution_piscines/utils/extensions.dart';
import '../../../../utils/commen_ext.dart';
import '../../../widgets/common/app_button.dart';
import '../../../widgets/common/app_textfield.dart';


class TestParameter extends StatelessWidget {
   TestParameter({Key? key}) : super(key: key);
   var controller = Get.put(TestParameterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(
        title: testParameter,
        leadingColor: appColor,
        elevation: 1.7,
      ),
      body: GetBuilder<TestParameterScreenController>(
          builder: (ctrl) {
          return SingleChildScrollView(
            child: Form(
              key: ctrl.testParams,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.spaceH(),
                  appCommonTextSpan(
                      text: '$instruction : ',
                      weight: FontWeight.w600,
                      childweight: FontWeight.w400,
                      childText: instructions,
                      size: 16,

                  ).paddingSymmetric(horizontal: 20),
                  15.0.spaceH(),
                  horizontalLine(
                    color: Colors.black.withOpacity(0.3),
                    height: 0.8,
                  ),
                  15.0.spaceH(),
                  appCommonTextSpan(
                    text: 'Chlorine ',
                    childText: between1and3,
                    align: TextAlign.start,
                    size: 18,
                    childsize: 14,
                    weight: FontWeight.w500,
                    childweight: FontWeight.w400,
                    color: Colors.black,

                  ).paddingSymmetric(horizontal: 20),
                  10.0.spaceH(),
                  AppStartUpTextField(
                    hint: eChlorine,
                    textInputFormet:<TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,9}'))
                    ],
                    textInputType: TextInputType.number,
                    controller: ctrl.chlorineTextFieldController,
                    validator: (val){
                      if(ctrl.chlorineTextFieldController.text.isEmpty){
                        return "Pls enter chlorine";
                      }
                      return null;
                    },
                  ).paddingSymmetric(horizontal: 20),
                  10.0.spaceH(),
                  appCommonTextSpan(
                    text: 'Ph ',
                    childText: phText,
                    align: TextAlign.start,
                    color: Colors.black,
                    size: 18,
                    childsize: 14,
                    weight: FontWeight.w500,
                    childweight: FontWeight.w400,

                  ).paddingSymmetric(horizontal: 20),
                  10.0.spaceH(),
                  AppStartUpTextField(
                    hint: ePh,
                    textInputFormet:<TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,9}'))
                    ],
                    textInputType: TextInputType.number,
                    controller: ctrl.phTextFieldController,
                    validator: (val){
                      double value  = double.parse(ctrl.phTextFieldController.text);

                      if(ctrl.phTextFieldController.text.isEmpty){
                        return "Pls enter ph";
                      }if(value > 14 || value < 0){
                        return "Pls enter valid ph";
                      }

                      return null;
                    },
                  ).paddingSymmetric(horizontal: 20),
                  10.0.spaceH(),
                  appCommonTextSpan(
                    text: alkali,
                    childText: alkaliText,
                    size: 18,
                    childsize: 14,
                    weight: FontWeight.w500,
                    childweight: FontWeight.w400,
                    align: TextAlign.start,
                    color: Colors.black,

                  ).paddingSymmetric(horizontal: 20),
                  10.0.spaceH(),
                  AppStartUpTextField(
                    hint: eAlkalinity,
                    textInputFormet:<TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,9}'))
                    ],
                    textInputType: TextInputType.number,
                    controller: ctrl.alkalinityTextFieldController,
                    validator: (val){
                      if(ctrl.alkalinityTextFieldController.text.isEmpty){
                        return "Pls enter alkalinity";
                      }
                      return null;
                    },
                  ).paddingSymmetric(horizontal: 20),

                  10.0.spaceH(),

                  AppButton(
                      onPress: (){
                        if(ctrl.testParams.currentState!.validate()){
                          ctrl.testParameters();
                        }

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
