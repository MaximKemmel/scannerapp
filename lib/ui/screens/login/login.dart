import 'package:flutter/material.dart';

import '../../theme/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 25),
              Column(
                children: [
                  Text(
                    "Добро пожаловать в...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "GothamPro",
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors().textColor,
                    ),
                  ),
                  const SizedBox(height: 25),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors().backgroundColor,
                      side: BorderSide(
                        color: AppColors().inactiveColor,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),

                      ),
                      elevation: 0,
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 55),
                      maximumSize: Size(MediaQuery.of(context).size.width * 0.8, 55),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/png/google.png'),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "Продолжить с Google",
                          style: TextStyle(
                            fontFamily: "GothamPro",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors().darkTextColor,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 15),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors().backgroundColor,
                      side: BorderSide(
                        color: AppColors().inactiveColor,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      elevation: 0,
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 55),
                      maximumSize: Size(MediaQuery.of(context).size.width * 0.8, 55),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/png/apple.png'),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "Продолжить с Apple",
                          style: TextStyle(
                            fontFamily: "GothamPro",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors().darkTextColor,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Text(
                "Продолжая, вы соглашаетесь с политикой конфиденциальности",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "GothamPro",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors().grayTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
