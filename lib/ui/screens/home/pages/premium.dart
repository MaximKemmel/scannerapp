import 'package:flutter/material.dart';

import '../../../theme/color.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage>  with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

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
                child: TabBar(
                  controller: tabController,
                  physics: const ClampingScrollPhysics(),
                  labelColor: AppColors().backgroundColor,
                  unselectedLabelColor: AppColors().darkTextColor,
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                  indicatorWeight: 0,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors().actionColor,
                  ),
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            "Пробная",
                            style: TextStyle(
                              fontFamily: "GothamPro",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Годовая",
                                style: TextStyle(
                                  fontFamily: "GothamPro",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: AppColors().backgroundColor,
                                ),
                                child: Center(
                                  child: Text(
                                    "-83%",
                                    style: TextStyle(
                                      fontFamily: "GothamPro",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8,
                                      color: AppColors().darkTextColor
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            "Месячная",
                            style: TextStyle(
                              fontFamily: "GothamPro",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 25,
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "2 390 ₽ /",
                          style: TextStyle(
                            fontFamily: "GothamPro",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(width: 8),
                        Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text(
                            "199,17 ₽ в месяц",
                            style: TextStyle(
                              fontFamily: "GothamPro",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "2 390 ₽ /",
                          style: TextStyle(
                            fontFamily: "GothamPro",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(width: 8),
                        Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text(
                            "199,17 ₽ в месяц",
                            style: TextStyle(
                              fontFamily: "GothamPro",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "2 390 ₽ /",
                          style: TextStyle(
                            fontFamily: "GothamPro",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(width: 8),
                        Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text(
                            "199,17 \u{20BD} в месяц",
                            style: TextStyle(
                              fontFamily: "GothamPro",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
