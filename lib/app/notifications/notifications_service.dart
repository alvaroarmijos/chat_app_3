import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _flutterLocalNotifications = FlutterLocalNotificationsPlugin();

  final channel = AndroidNotificationChannel(
    'chat',
    'Chat Notifications',
    importance: Importance.high,
    description: 'This channel is used for chat message notifications.',
  );

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    print("Firebase Messaging Token: $token");
  }

  void showNotification(RemoteMessage message) {
    final notification = message.notification;
    if (notification != null) {
      _flutterLocalNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            importance: Importance.high,
            priority: Priority.high,
            icon: 'launch_background',
          ),
        ),
      );
    }
  }
}
