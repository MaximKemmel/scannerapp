import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:scanner_app/ui/screens/login/login.dart';
import 'package:scanner_app/ui/theme/color.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController pageController = PageController();
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Заголовок",
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: AppColors().textColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Текст описание в несколько строк о приложении его преимуществах и тд.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors().textColor,
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    );
                  },
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: index == selectedIndex ? 30 : 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: index == selectedIndex
                            ? AppColors().actionColor
                            : AppColors().inactiveColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors().actionLightColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0,
                      minimumSize: const Size(160, 50),
                      maximumSize: const Size(160, 50),
                    ),
                    child: Text(
                      "Пропустить",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors().actionColor,
                      ),
                    ),
                    onPressed: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors().actionColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0,
                      minimumSize: const Size(160, 50),
                      maximumSize: const Size(160, 50),
                    ),
                    child: Text(
                      "Дальше",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors().backgroundColor,
                      ),
                    ),
                    onPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeIn,
                      );
                      if (selectedIndex == 2) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
