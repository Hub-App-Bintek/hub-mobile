import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

// This function must be a top-level function (outside of any class)
// It handles notifications that arrive when the app is in the background or terminated.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Ensure Firebase is initialized (required for background processing)
  await Firebase.initializeApp();
  log("Handling a background message: ${message.messageId}");
  log("Notification Title: ${message.notification?.title}");
  log("Payload: ${message.data}");
}

class NotificationService extends GetxService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    // Asynchronously initialize the service when it's first created.
    _initialize();
  }

  // This private method contains all the async setup logic.
  Future<void> _initialize() async {
    // 1. Request notification permissions (essential for iOS).
    await _fcm.requestPermission(alert: true, badge: true, sound: true);

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // TODO: Add iOS/macOS settings if needed
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
        );

    // The onDidReceiveNotificationResponse callback is passed directly here.
    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
      onDidReceiveBackgroundNotificationResponse: _onNotificationTapped,
    );

    // 2. Set the background message handler.
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 3. Configure handlers for notification taps (launches from terminated/background).
    _setupNotificationTapHandler();

    // 4. Configure foreground notification handling.
    await _setupForegroundNotifications();

    log('NotificationService Initialized');
  }

  @pragma('vm:entry-point')
  static void _onNotificationTapped(NotificationResponse response) {
    if (response.payload != null && response.payload!.isNotEmpty) {
      log('Local notification tapped with payload: ${response.payload}');
      // The payload here is the 'route' we passed earlier.
      _handleNotificationNavigation({'route': response.payload});
    }
  }

  // This redundant method can be safely removed.
  // The logic is now correctly placed in _initialize().
  /*
  Future<NotificationService> init() async {
    ...
  }
  */

  // Handles notifications that arrive while the app is in the foreground.
  Future<void> _setupForegroundNotifications() async {
    // Define the Android notification channel.
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // Must match the ID in android/app/src/main/res/values/strings.xml
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );

    // Create the channel on the device.
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    // Listen for incoming messages while the app is in the foreground.
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If the message is a notification and we are on Android, display it using flutter_local_notifications.
      if (notification != null && android != null) {
        _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@mipmap/ic_launcher', // Your app's launcher icon
            ),
          ),
          // Pass the data payload for navigation purposes.
          payload: message.data['route'] as String?,
        );
      }
    });
  }

  // Configures what happens when a user taps on a notification.
  void _setupNotificationTapHandler() {
    // This handles the tap when the app is opened from a terminated state.
    _fcm.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        _handleNotificationNavigation(message.data);
      }
    });

    // This handles the tap when the app is in the background.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotificationNavigation(message.data);
    });
  }

  // Centralized navigation logic from notification data.
  static void _handleNotificationNavigation(Map<String, dynamic> data) {
    // Safely extract the route from the data payload.
    final route = data['route'] as String?;
    if (route != null) {
      log('Navigating to route from notification: $route');
      // Use GetX to navigate to the specified screen.
      Get.toNamed(route, arguments: data);
    }
  }

  // Public method to get the device's FCM token.
  Future<String?> getFcmToken() async {
    try {
      final token = await _fcm.getToken();
      log("FCM Token: $token");
      // TODO: Send this token to your backend server to associate it with the user.
      return token;
    } catch (e) {
      log("Error getting FCM token: $e");
      return null;
    }
  }
}
