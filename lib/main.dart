import 'package:flutter/material.dart';
import 'package:project/homepage_copy.dart';
import 'package:project/pages/bottom_navigationBar.dart';
import 'package:project/pages/dite_page.dart';
import 'package:project/pages/forgot_password_page.dart';
import 'package:project/pages/profile_page.dart';
import 'package:project/pages/regestration_page.dart';
import 'package:project/pages/setting.dart';
import 'package:project/pages/snackBar.dart';
import 'package:project/pages/splash_page.dart';
import 'package:project/pages/tips_page.dart';
import 'package:project/pages/workout_page.dart';

import 'take_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryIconTheme: IconThemeData(color: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:PracticeBottomNavBar(),
      home: SplashScreen(),
    );
  }
}
