import 'package:flutter/material.dart';
import 'package:local_notification_app/notification_helper/local_notification_service.dart';
import 'package:local_notification_app/widget/button_push_or_cancel.dart';

class NotificationApp extends StatelessWidget {
  const NotificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(title: const Text("Local Notification App")),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            width: 400,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! Push or Cancel Basic Notification
                ButtonPushOrCancl(
                  text: 'Basic',
                  onPressedToPush: () =>
                      LocalNotificationService.showBasicNotification(),
                  onPressedToCancel: () =>
                      LocalNotificationService.cancelNotificationById(0),
                ),
                //! Push or Cancel Repeating Notification
                ButtonPushOrCancl(
                  text: 'Repeating',
                  onPressedToPush: () =>
                      LocalNotificationService.showRepeatingNotification(),
                  onPressedToCancel: () =>
                      LocalNotificationService.cancelNotificationById(1),
                ),
                //! Push or Cancel Scheduled Notification
                ButtonPushOrCancl(
                  text: 'Scheduled',
                  onPressedToPush: () =>
                      LocalNotificationService.showScheduledNotification(),
                  onPressedToCancel: () =>
                      LocalNotificationService.cancelNotificationById(2),
                ),
                //! Cancel All Notification
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () =>
                        LocalNotificationService.cancelAllNotifications(),
                    child: const Text(
                      "Cancel All Notification",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
