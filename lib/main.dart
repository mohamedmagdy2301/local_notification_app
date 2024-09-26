import 'package:flutter/material.dart';
import 'package:local_notification_app/notification_app.dart';
import 'package:local_notification_app/notification_helper/local_notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.initialize();
  runApp(const NotificationApp());
}
