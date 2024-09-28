import 'package:flutter/material.dart';
import 'package:local_notification_app/notification_app.dart';
import 'package:local_notification_app/notification_helper/local_notification_service.dart';
import 'package:local_notification_app/work_manager/work_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    LocalNotificationService.initialize(),
    WorkManagerService.initialize(),
  ]);

  runApp(const NotificationApp());
}
