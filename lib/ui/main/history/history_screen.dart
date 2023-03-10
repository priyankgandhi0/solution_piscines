import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solution_piscines/constant/app_strings.dart';
import 'package:solution_piscines/routes/router.dart';
import 'package:solution_piscines/theme/app_colors.dart';
import 'package:solution_piscines/utils/commen_ext.dart';
import 'package:solution_piscines/utils/extensions.dart';
import 'package:solution_piscines/utils/notification_services.dart';
import '../../../generated/assets.dart';
import '../../widgets/common/appbar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWithIcons(
        elevation: 1.7,
        title: history,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(width: 25,height: 25,
            Assets.iconsIcBack,color: appColor,),
        ),
        rightIcon:IconButton(
          onPressed: () {
            Get.toNamed(Routes.notification);
          // NotificationService.sendNotification("title", "body");
          // Get.back();
          //   bool isallowed = await AwesomeNotifications().isNotificationAllowed();
          //   if (!isallowed) {
          //     //no permission of local notification
          //     AwesomeNotifications().requestPermissionToSendNotifications();
          //   }else{
          //     //show notification
          //     AwesomeNotifications().createNotification(
          //         content: NotificationContent( //simgple notification
          //           id: 123,
          //           channelKey: 'basic', //set configuration wuth key "basic"
          //           title: 'Welcome to FlutterCampus.com',
          //           body: 'This simple notification is from Flutter App',
          //         )
          //     );
          //   }
          },
      icon: Image.asset(width: 20,height: 20,
        Assets.iconsIcSetting,color: appColor,),
    )
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          // var speaker = ctrl.filterSpeakerList[index];
          return Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                         'Round Pool'.appCommonText(
                             overflow: TextOverflow.ellipsis,
                             size: 16,
                             maxLines: 1,
                             weight: FontWeight.w500,
                             color: Colors.black
                         ).paddingOnly(left: 15),
                          '22 Feb 2023'.appCommonText(
                             overflow: TextOverflow.ellipsis,
                             size: 16,
                             maxLines: 1,
                             weight: FontWeight.w400,
                             align: TextAlign.left,
                             color: Colors.black
                         ).paddingOnly(left: 15,top: 5)
                        ],
                      ),
                    ),
                    Image.asset(width: 25,height: 25,
                      Assets.iconsIcRight,color: appColor,).paddingSymmetric(horizontal: 10),
                  ],
                ),
              ).paddingSymmetric(horizontal: 25,vertical: 5).onClick(
                () {
                  Get.toNamed(Routes.details);
            },
          );
        },
        itemCount: 10,
      ).paddingOnly(top: 18),
    );
  }
}
