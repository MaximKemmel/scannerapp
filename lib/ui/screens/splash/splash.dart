import 'package:flutter/material.dart';
import 'package:scanner_app/ui/theme/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Logo",
          style: TextStyle(
            fontFamily: "GothamPro",
            fontSize: 66,
            fontWeight: FontWeight.w700,
            color: AppColors().textColor,
          ),
        ),
      ),
    );
  }
}
