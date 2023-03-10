import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:solution_piscines/ui/main/notification/notification_screen_controller.dart';
import 'package:solution_piscines/utils/extensions.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/SharedPreference.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/appbar.dart';
import 'NotificationPlugin.dart';

class NotificationScreen extends StatelessWidget {
   NotificationScreen({Key? key}) : super(key: key);
  var controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(
        title: 'Notification',
        leadingColor: appColor,
        elevation: 1.7,
      ),
      body:GetBuilder<NotificationController>(builder: (ctrl) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Notification On/Off '.appCommonText(
                    weight: FontWeight.w500,
                    color: Colors.black,
                    size: 17,
                  ),
                  Switch(
                    value: controller.notificationOnOff,
                    onChanged: (value) {
                      controller.notificationOnOff = !controller.notificationOnOff;
                      controller.update();
                    },
                  ),
                ],
              ).paddingSymmetric(horizontal: 20),
              15.0.spaceH(),
              'Select Any One Day'.appCommonText(
                color: Colors.black,
                size: 17,
                align: TextAlign.left,
                weight: FontWeight.w500,
             ).paddingOnly(left: 23),
              25.0.spaceH(),
              SizedBox(
                height: 35  ,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: ctrl.weekList.length,
                  itemBuilder: (context, index) {
                    return dayWidget('${ctrl.weekList[index].weekDayName}'.substring(0,2),
                      ctrl.weekList[index].isSelected,
                            (){
                      ctrl.selectDay();
                      ctrl.weekList[index].isSelected =! ctrl.weekList[index].isSelected;
                      ctrl.update();
                    }).paddingSymmetric(horizontal: 10);
                  },
                )
              ).paddingSymmetric(horizontal: 10),
             /* 25.0.spaceH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Select a time '.appCommonText(
                    weight: FontWeight.w500,
                    color: Colors.black,
                    size: 17,
                  ),
                  Container(
                    height: 35,
                    width: 100,
                    alignment:Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:Colors.blueGrey.shade100,
                    ),
                    child: ctrl.timeText.appCommonText(
                        size: 16,
                        weight: FontWeight.w400,
                        align: TextAlign.center
                    )
                  ).onTap(() async {
                    ctrl.pickedTime =  await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if(ctrl.pickedTime != null ){
                      print(ctrl.pickedTime!.format(context));   //output 10:51 PM
                      ctrl.timeText = ctrl.pickedTime!.format(context); //set the value of text field.
                      ctrl.update();

                    }else{
                      print("Time is not selected");
                    }
                  }),
                ],
              ).paddingSymmetric(horizontal: 20),*/
              35.0.spaceH(),
              AppButton(
                  onPress: (){
                    // DateTime parsedTime = DateTime.now();
                    // DateTime newDT = DateTime(
                      // parsedTime.year,
                      // parsedTime.month,
                      // parsedTime.day,
                      // ctrl.pickedTime!.hour,
                      // ctrl.pickedTime!.minute,
                    // );
                      for(var element in ctrl.weekList){
                        // if (element.isSelected && parsedTime.weekday == element.id) {
                        if (element.isSelected) {
                          NotificationsHelper.scheduleNewNotification(element.id);
                          // NotificationsHelper.setNotification1(newDT, 0);
                          List<String> weekList = ctrl.weekList.map((e) {
                            return jsonEncode(e.toJson());
                          }).toList();

                          preferences.saveNotification(ctrl.notificationOnOff,weekList);

                          var snackBar = SnackBar(content:'Data Saved Successfully'.appCommonText(
                            size: 15,
                            color: Colors.white,
                            weight: FontWeight.w400,
                           ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        }
                      // }
                  },
                  borderValue: 5,
                  text: 'Submit',
              ).paddingSymmetric(horizontal: 20),
            ],
          );
        }
      ),
    );
  }

 Widget dayWidget(String day , bool isSelected,Function() onTap ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:isSelected ? Colors.blueGrey : Colors.blueGrey.shade100,
        ),
        child: day.appCommonText(
          size: 16,
          weight: FontWeight.w400,
          align: TextAlign.center
        ),
      ),
    );
 }
}
