import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static onTap(NotificationResponse response) {}
  //! Initialize Local Notification
  static Future initialize() async {
    InitializationSettings initializationSettings =
        const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

// ! Show Basic Notification
  static Future showBasicNotification() async {
    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
      'channel_id 0',
      'basic channel',
      importance: Importance.max,
      priority: Priority.high,
    ));
    await flutterLocalNotificationsPlugin.show(
      0,
      'Basic Notification',
      'Body',
      notificationDetails,
      payload: 'data',
    );
  }

// ! Show Repeating Notification every minute
  static Future showRepeatingNotification() async {
    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
      'channel_id 1',
      'basic channel',
      importance: Importance.max,
      priority: Priority.high,
    ));
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Repeating Notification',
      'Notification Body',
      RepeatInterval.everyMinute,
      notificationDetails,
      payload: 'data',
    );
  }

// ! Show Scheduled Notification 10 seconds
  static Future showScheduledNotification() async {
    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
      'channel_id 2',
      'basic channel',
      importance: Importance.max,
      priority: Priority.high,
    ));
    tz.initializeTimeZones();
    final String currentTimeZoneLocal =
        await FlutterTimezone.getLocalTimezone();
    // ? To get current local with way accuratlly
    tz.setLocalLocation(tz.getLocation(currentTimeZoneLocal));
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'Scheduled Notification',
      'Body',
      // ? To get current scheduled time by local timezone
      tz.TZDateTime.now(tz.local).add(
        const Duration(seconds: 10),
      ),
      // ? To get static scheduled time by local timezone
      // tz.TZDateTime(tz.local, 2024, 9, !!, !!, !!),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'data',
    );
  }

// ! Cancel All Notification
  static Future cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

// ! Cancel Notification By Id
  static Future cancelNotificationById(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
