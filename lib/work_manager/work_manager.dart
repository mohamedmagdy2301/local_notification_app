import 'package:flutter/foundation.dart';
import 'package:local_notification_app/notification_helper/local_notification_service.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerService {
  static Workmanager workmanager = Workmanager();
  static Future<void> initialize() async {
    await workmanager.initialize(actionCallBack, isInDebugMode: kDebugMode);
    registerPeriodicTask();
  }

  static Future<void> registerPeriodicTask() async {
    await workmanager.registerPeriodicTask(
      "id0",
      "periodicTask",
      frequency: const Duration(minutes: 15),
    );
  }

  static Future<void> cancelAllTasks() async {
    await workmanager.cancelAll();
  }

  static Future<void> cancelTask(String uniqueName) async {
    await workmanager.cancelByUniqueName(uniqueName);
  }
}

@pragma('vm:entry-point')
void actionCallBack() {
  Workmanager().executeTask(
    (taskName, inputData) {
      LocalNotificationService.showDailyScheduledNotification();
      return Future.value(true);
    },
  );
}
