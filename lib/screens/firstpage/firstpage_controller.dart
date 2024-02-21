
import 'package:get/get.dart';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:getx_usage/routes/app_routes.dart';
import 'package:logger/logger.dart';
import '../../utils/export_file.dart';

class FirstPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FirstPageController>(FirstPageController());
  }
}

class FirstPageController extends GetxController {
  RxInt num = 1.obs;
  RxInt result = 0.obs;
     FirebaseMessaging fbMessaging = FirebaseMessaging.instance;
  @override
  void onInit() {
   notificationInit();
    super.onInit();
  }

  

  Future<void> notificationInit() async {
    final FirebaseMessaging messaging = FirebaseMessaging.instance;
    final NotificationSettings settings = await messaging.requestPermission();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      print('Notification permission denied');
    }
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
     //! Handle initial notification if the app was opened via a notification
    final RemoteMessage? initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      Logger().i("get initial Message call 'messaging.getInitialMessage' ");
      // selectNotification();
    Get.toNamed(AppRoutes.secondPage);
      
    }

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: (int? z, String? s, String? f, String? b) {
        onDidReceiveLocalNotification();
      },
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: ((payload) => selectNotification( )));

    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true,
            showWhen: true);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
 'high_importance_channel',
 "High Importance Notifcations",
  importance: Importance.high,
  playSound: true,
);

await flutterLocalNotificationsPlugin
    .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
    ?.createNotificationChannel(channel);
 
// Handle messages when the app is in the background
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      final RemoteNotification? notification = message.notification;
      final AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        if (Platform.isAndroid) {
            print("onBackgroundMessage call");
            await flutterLocalNotificationsPlugin.show(0, notification.title,
                notification.body, platformChannelSpecifics,
                payload: message.data.toString());
      
        }
      }
    });
    // Handle messages when the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final RemoteNotification? notification = message.notification;
      final AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        Logger().d('Message also contained a notification: ${notification.title}');
        if (Platform.isAndroid) {
        
          await flutterLocalNotificationsPlugin.show(0, notification.title,
              notification.body, platformChannelSpecifics,
              payload: message.data.toString());
        }
    
        // }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Logger().d("onMessageOpenedApp ");
      selectNotification();
    });
  }

  Future<void> selectNotification( ) async {
  Get.offAndToNamed(AppRoutes.secondPage);
    
 }
  // }


  Future onDidReceiveLocalNotification() async {
    print("onDidReceiveLocalNotification");
  }

  void multiple() {
    result.value = num.value * 2;
  }
}

