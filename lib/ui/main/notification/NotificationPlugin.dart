import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:solution_piscines/main.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationsHelper {

  static final _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

//needs an icon
  static final _initializationSettingsAndroid =
  AndroidInitializationSettings('@drawable/ic_notification_icon');

  static final _initializationSettings =
  InitializationSettings(android: _initializationSettingsAndroid);

  static Future<void> init() async {
    await _flutterLocalNotificationsPlugin.initialize(_initializationSettings);
    tz.initializeDatabase([]);
  }

  static final _androidNotificationDetails = AndroidNotificationDetails(
    'solution_piscines Channel',
    'solution_piscines',
    importance: Importance.max,
    priority: Priority.high,
  );

  static final _notificationDetails =
  NotificationDetails(android: _androidNotificationDetails);

// set Notification methoud

  static Future<void> setNotification(DateTime dateTime, int id) async {
    // await _flutterLocalNotificationsPlugin.periodicallyShow(
    //   id,
    //   "title",
    //   "body",
    //   RepeatInterval.weekly,
    //   _notificationDetails,
    //   androidAllowWhileIdle: true, );
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'scheduled title',
      'scheduled body',
      tz.TZDateTime.from(dateTime,tz.local),
      // tz.TZDateTime.now(tz.local).add(Duration(hours: dateTime.hour,minutes: dateTime.minute)),
      // tz.TZDateTime(tz.local, dateTime.year, dateTime.month, dateTime.hour,
      //     dateTime.minute),
      _notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.wallClockTime,
    );
  }

  static Future<bool> displayNotificationRationale() async {
    bool userAuthorized = false;
    BuildContext context = MyApp.navigatorKey.currentContext!;
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Get Notified!',
                style: Theme.of(context).textTheme.titleLarge),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/animated-bell.gif',
                        height: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                    'Allow Awesome Notifications to send you beautiful notifications!'),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Deny',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () async {
                    userAuthorized = true;
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Allow',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.deepPurple),
                  )),
            ],
          );
        });
    return userAuthorized &&
        await AwesomeNotifications().requestPermissionToSendNotifications();
  }
  static Future<void> scheduleNewNotification(int id) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) isAllowed = await displayNotificationRationale();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 0, // -1 is replaced by a random number
            channelKey: 'basic',
            title: "Huston! The eagle has landed!",
            body:
            "A small step for a man, but a giant leap to Flutter's community!",
            bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
            largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
            //'asset://assets/images/balloons-in-sky.jpg',
            notificationLayout: NotificationLayout.BigPicture,
            payload: {
              'notificationId': '1234567890'
            }),
        actionButtons: [
          NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
          NotificationActionButton(
              key: 'DISMISS',
              label: 'Dismiss',
              // actionType: ActionType.DismissAction,
              isDangerousOption: true)
        ],
        schedule: NotificationCalendar.fromDate(
            date: DateTime.now().add(const Duration(days: DateTime.monday,seconds: 2))));
  }

  static Future<void> resetBadgeCounter() async {
    await AwesomeNotifications().resetGlobalBadge();
  }

  static Future<void> cancelNotifications() async {
    await AwesomeNotifications().cancelAll();
}

  static Future<void> setNotification1(DateTime dateTime, int id) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'scheduled title',
      'scheduled body',
      // tz.TZDateTime.from(dateTime, tz.local),
      _weeklyschedule(Time(11,00,00),days:[DateTime.monday]),
      // tz.TZDateTime.now(tz.local).add(Duration(hours: dateTime.hour,minutes: dateTime.minute)),
      // tz.TZDateTime(tz.local, dateTime.year, dateTime.month, dateTime.hour,
      //     dateTime.minute),
      _notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime
    );

  }




// cancel Notification methoud
  static Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}

tz.TZDateTime _weeklyschedule(Time time,{required List<int> days}) {
  tz.TZDateTime scheduledDate = _Dailyschedule(time);
  while (!days.contains(scheduledDate.weekday)){
    scheduledDate = scheduledDate.add(Duration(days: 1));
  }
  return scheduledDate;
}
  tz.TZDateTime _Dailyschedule(Time time) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day,time.hour,time.minute,time.second);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
}