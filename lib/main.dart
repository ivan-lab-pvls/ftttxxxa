import 'dart:convert';
import 'package:in_app_review/in_app_review.dart';
import 'package:flutter/material.dart';
import 'package:restaurantdelapp/pages/pages_controller.dart';
import 'package:restaurantdelapp/pages/splash_screen/splash_screen.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:firebase_core/firebase_core.dart';
import 'pages/detail_pages/const.dart';
import 'pages/qr_page/n.dart';
import 'pages/qr_page/n3.dart';
import 'pages/settings_page/settings_page_view.dart';

bool zxczxvcs = false;
const int gsdfvsdcs = 7;
bool checkerx = false;
final InAppReview dgsdfcdsa = InAppReview.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final RxSharedPreferences prefs = RxSharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationServiceFb().activate();
  final bool? takeOrder = await prefs.getBool("takeOrder");
  final bool? checker = await prefs.getBool("athx");
  if (takeOrder == null) {
    await RxSharedPreferences.getInstance().setBool("takeOrder", true);
  }
  if (checker == true) {
    checkerx = await prefs.getBool("athx") as bool;
  }
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: checkerx ? "/" : "/splash",
      routes: {
        "/splash": (context) => SplashScreen(),
        "/": (context) => PageControllerModel(),
      },
    );
  }
}
