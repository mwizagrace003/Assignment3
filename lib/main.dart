import 'package:battery/battery.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  static const String BATTERY_NOTIFICATION_CHANNEL_ID = "battery_notification";

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void initNotifs() async {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher'); // Assuming you have ic_launcher.png

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  void initState() {
    super.initState();
    final battery = Battery();
    initNotifs();
    Connectivity().onConnectivityChanged.listen((result) {
      final hasInternet = result != ConnectivityResult.none;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hasInternet ? 'Internet Connected!' : 'No Internet Connection!'),
        ),
      );
    });

    battery.onBatteryStateChanged.listen((BatteryState state) {
      if (state == BatteryState.charging) {
        battery.batteryLevel.then((level) {
          if (level >= 90) {
            flutterLocalNotificationsPlugin.show(
              0,
              'Battery level',
              'Battery level is now $level%',
              NotificationDetails(
                android: AndroidNotificationDetails(
                  BATTERY_NOTIFICATION_CHANNEL_ID,
                  BATTERY_NOTIFICATION_CHANNEL_ID, // Removed extra argument
                ),
              ),
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: themeMode == ThemeMode.light
          ? ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      )
          : ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: HomeScreen(
        onThemeChanged: (themeMode) {
          setState(() {
            this.themeMode = themeMode;
          });
        },
      ),
    );
  }
}