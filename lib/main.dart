import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forecast/data/data_source/box_manager.dart';
import 'package:forecast/data/data_source/firebase_api.dart';
import 'package:forecast/forecast_app.dart';
import 'package:forecast/localizatoin_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loggy/loggy.dart';

Future<void> main() async {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDHaW6ZXaGFgiOglIPRBsO_U2hBlZGLVa8',
      appId: '1:277227233389:android:5fc00f59365c5ee80b1f64',
      messagingSenderId: '277227233389',
      projectId: 'forecast-62a54',
    ),
  );
  await FirebaseApi().initNotifications();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await _initHive();
  runApp(const LocalizationWidget(widget: ForecastApp()));
}

_initHive() async {
  await Hive.initFlutter();
  await BoxManager().init();
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
