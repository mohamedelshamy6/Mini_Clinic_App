import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Initialize notification
  initializeNotification() async {
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    const InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  notificationDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          'channel id',
          'channel name',
          channelDescription: 'channel description',
          importance: Importance.max,
        ),
        iOS: DarwinNotificationDetails());
  }

  void showScheduledNotification(
      {int id = 0,
      String? title,
      String? body,
      required DateTime scheduleDate}) async {
    flutterLocalNotificationsPlugin.schedule(
        id, title, body, scheduleDate, await notificationDetails(),
        androidAllowWhileIdle: true);
  }

  void showNotification({int id = 0, String? title, String? body}) async =>
      flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        await notificationDetails(),
      );

  /// Request IOS permissions
  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  cancelAll() async => await flutterLocalNotificationsPlugin.cancelAll();

  cancel(id) async => await flutterLocalNotificationsPlugin.cancel(id);
}
