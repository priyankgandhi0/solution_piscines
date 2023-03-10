import 'package:flutter_local_notifications/flutter_local_notifications.dart';


AndroidInitializationSettings _androidInitializationSettings =
const AndroidInitializationSettings('@drawable/ic_notification_icon');

DarwinInitializationSettings iosInitializationSettings =
const DarwinInitializationSettings(

  requestAlertPermission: true,
  requestBadgePermission: true,
  requestSoundPermission: true,

  // onDidReceiveLocalNotification:
);

// final DarwinInitializationSettings initializationSettingsDarwin =
// DarwinInitializationSettings(
//   requestAlertPermission: false,
//   requestBadgePermission: false,
//   requestSoundPermission: false,
//   onDidReceiveLocalNotification:
//       (int id, String? title, String? body, String? payload) async {
//     didReceiveLocalNotificationStream.add(
//       ReceivedNotification(
//         id: id,
//         title: title,
//         body: body,
//         payload: payload,
//       ),
//     );
//   },
//   notificationCategories: darwinNotificationCategories,
// );

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static sendNotification(
      String title,
      String body,
      ) async {
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      "solution_piscines Channel",
      "solution_piscines",
      icon: '@drawable/ic_notification_icon',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      ongoing: false,
      channelAction: AndroidNotificationChannelAction.values.first,
      showProgress: true,
    );

    //  IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      // iOS: iosNotificationDetails
    );

    await _notifications.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  static void initNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _notifications.initialize(initializationSettings,

      // onSelectNotification: (String? payload) {
      //   //payload == "Downloaded" ? Get.toNamed(Routes.myLibrary) : null;
      //   }
    );
  }

// static showProgressNotification() async {
//   const int maxProgress = 10;
//   String temp = "Downloading";
//   for (int i = 0; i <= maxProgress; i++) {
//     await Future<void>.delayed(const Duration(seconds: 1), () async {
//
//        AndroidNotificationDetails androidNotificationDetails =
//        AndroidNotificationDetails(
//            "HouseJet_channel",
//            "HouseJet_app",
//            icon: '@drawable/notification_icon',
//           channelShowBadge: false,
//           importance: Importance.max,
//           priority: Priority.high,
//           onlyAlertOnce: true,
//           showProgress: true,
//           maxProgress: maxProgress,
//            color: app_Orange_FF7448,
//           progress: i);
//        if(i == 10){
//          temp = "Downloaded";
//        }
//       final NotificationDetails notificationDetails = NotificationDetails(
//         android:   androidNotificationDetails,
//
//       );
//       await _notifications.show(0, 'House Jet Local Notification', '$temp',
//           notificationDetails,
//           //payload:temp = i == 10 ?"Downloaded":"Downloading"
//           //'Destination Screen(Progress Notification)'
//            );
//     });
//   }
// }

}