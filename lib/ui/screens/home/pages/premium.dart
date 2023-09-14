import 'package:flutter/material.dart';

import '../../../theme/color.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/png/premium_background.png',
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Выберите план",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors().actionColor,
                  decorationThickness: 3,
                  fontFamily: "GothamPro",
                  fontWeight: FontWeight.w700,
                  fontSize: 29,
                  shadows: [
                    Shadow(
                      color: AppColors().darkTextColor,
                      offset: const Offset(0, -10),
                    ),
                  ],
                  color: Colors.transparent,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Image.asset('assets/png/info_check.png'),
                  const SizedBox(width: 15),
                  Text(
                    "Экспорт без ограничения",
                    style: TextStyle(
                      fontFamily: "GothamPro",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors().darkTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Image.asset('assets/png/info_check.png'),
                  const SizedBox(width: 15),
                  Text(
                    "Нет рекламы",
                    style: TextStyle(
                      fontFamily: "GothamPro",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors().darkTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Image.asset('assets/png/info_check.png'),
                  const SizedBox(width: 15),
                  Text(
                    "Многостраничное сканирование",
                    style: TextStyle(
                      fontFamily: "GothamPro",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors().darkTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Image.asset('assets/png/info_check.png'),
                  const SizedBox(width: 15),
                  Text(
                    "Электронная подпись документа",
                    style: TextStyle(
                      fontFamily: "GothamPro",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors().darkTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors().backgroundColor,
                  border: Border.all(
                    color: AppColors().actionColor,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors().actionColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 65),
                  maximumSize: Size(MediaQuery.of(context).size.width * 0.9, 65),
                ),
                child: Text(
                  "Оформить",
                  style: TextStyle(
                    fontFamily: "GothamPro",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors().backgroundColor,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
