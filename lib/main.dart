import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:solution_piscines/routes/router.dart';
import 'package:solution_piscines/ui/main/notification/NotificationPlugin.dart';
import 'package:solution_piscines/ui/main/splash_screen/splash_screen.dart';
import 'package:solution_piscines/utils/SharedPreference.dart';
import 'package:solution_piscines/utils/notification_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  await NotificationsHelper.init();
  AwesomeNotifications().initialize(

      'resource://drawable/ic_notification_icon',
      [            // notification icon
        NotificationChannel(
          channelGroupKey: 'basic_test',
          channelKey: 'basic',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          channelShowBadge: true,
          importance: NotificationImportance.High,
          enableVibration: true,
        ),
        //add more notification type with different configuration
      ]
  );
  NotificationService.initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solution Piscines',
      getPages: Routes.pages,
      home: SplashScreen(),
    );
  }
}
