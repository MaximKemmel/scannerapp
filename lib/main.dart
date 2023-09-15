import 'package:flutter/material.dart';
import 'package:scanner_app/ui/screens/home/home.dart';
import 'package:scanner_app/ui/screens/login/login.dart';
import 'package:scanner_app/ui/screens/onboard/onboard.dart';
import 'package:scanner_app/ui/screens/splash/splash.dart';
import 'package:scanner_app/ui/theme/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerColor: Colors.transparent,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors().backgroundColor,
      ),
      home: const HomeScreen(),
    );
  }
}
