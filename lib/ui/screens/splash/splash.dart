import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:scanner_app/ui/screens/onboard/onboard.dart';
import 'package:scanner_app/ui/theme/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  late int i;

  @override
  void initState() {
    i = 0;
    startTimer();
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        i++;
      });
      if (i > 3) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardScreen()));
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Logo",
          style: GoogleFonts.inter(
            fontSize: 66,
            fontWeight: FontWeight.w700,
            color: AppColors().textColor,
          ),
        ),
      ),
    );
  }
}
