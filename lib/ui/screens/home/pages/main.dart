import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late int currentTab;

  @override
  void initState() {
    currentTab = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 36,
            child: TabBar(
              controller: tabController,
              physics: const ClampingScrollPhysics(),
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.symmetric(horizontal: 5),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
              indicatorWeight: 0,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              onTap: (index) {
                setState(() {
                  currentTab = index;
                });
              },
              dividerColor: Colors.transparent,
              tabs: [
                Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: currentTab == 1 ? AppColors().actionLightColor : AppColors().actionColor,
                    ),
                    child: Center(
                      child: Text(
                        "Сканирование",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: currentTab == 1 ? AppColors().actionColor : AppColors().backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: currentTab == 0 ? AppColors().actionLightColor : AppColors().actionColor,
                    ),
                    child: Center(
                      child: Text(
                        "Редактирование",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: currentTab == 0 ? AppColors().actionColor : AppColors().backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              ListView(
                children: [
                  scanBlock(),
                  const SizedBox(height: 25),
                  Text(
                    "Последние файлы",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColors().darkTextColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  for (int i = 0; i < 5; i++)
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors().cardColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/png/doc.png',
                                height: 67,
                                width: 67,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Scan 273648 two strokes",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: AppColors().darkTextColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "12/26/2023",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: AppColors().grayTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Image.asset('assets/png/brush.png'),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Image.asset('assets/png/more.png'),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  const SizedBox(height: 50),
                ],
              ),
              ListView(
                children: [
                  editBlock(),
                  const SizedBox(height: 25),
                  Text(
                    "Последние файлы",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColors().darkTextColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  for (int i = 0; i < 5; i++)
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors().cardColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/png/doc.png',
                                height: 67,
                                width: 67,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Scan 273648 two strokes",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: AppColors().darkTextColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "12/26/2023",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: AppColors().grayTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Image.asset('assets/png/brush.png'),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Image.asset('assets/png/more.png'),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  const SizedBox(height: 25),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget scanBlock() {
    return Column(
      children: [
        makeScanButton(
          text: "Документы",
          textColor: AppColors().darkTextColor,
          buttonColor: AppColors().docsColor,
        ),
        const SizedBox(height: 10),
        makeScanButton(
          text: "Распознавание QR",
          textColor: AppColors().backgroundColor,
          buttonColor: AppColors().qrColor,
        ),
        const SizedBox(height: 10),
        makeScanButton(
          text: "Подпись",
          textColor: AppColors().backgroundColor,
          buttonColor: AppColors().signatureColor,
        ),
        const SizedBox(height: 10),
        makeScanButton(
          text: "Печать",
          textColor: AppColors().backgroundColor,
          buttonColor: AppColors().printColor,
        ),
      ],
    );
  }

  Widget makeScanButton(
      {required String text,
      required Color textColor,
      required Color buttonColor}) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: buttonColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
              Image.asset(
                'assets/png/folder.png',
                height: 56,
              ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {},
            child: Container(
              height: 56,
            ),
          ),
        ),
      ],
    );
  }

  Widget editBlock() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            makeEditButton(
              text: "Разметка",
              iconAsset: 'assets/png/markup.png',
              buttonColor: AppColors().markupColor,
            ),
            makeEditButton(
              text: "Текст",
              iconAsset: 'assets/png/text.png',
              buttonColor: AppColors().textEditColor,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            makeEditButton(
              text: "Подпись",
              iconAsset: 'assets/png/signature.png',
              buttonColor: AppColors().signatureEditColor,
            ),
            makeEditButton(
              text: "Скрыть",
              iconAsset: 'assets/png/hide.png',
              buttonColor: AppColors().hideColor,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            makeEditButton(
              text: "Соединить",
              iconAsset: 'assets/png/connect.png',
              buttonColor: AppColors().connectColor,
            ),
            makeEditButton(
              text: "Разделить",
              iconAsset: 'assets/png/share.png',
              buttonColor: AppColors().shareColor,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            makeEditButton(
              text: "OCR",
              iconAsset: 'assets/png/ocr.png',
              buttonColor: AppColors().ocrColor,
            ),
            makeEditButton(
              text: "Картинки",
              iconAsset: 'assets/png/images.png',
              buttonColor: AppColors().imagesColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget makeEditButton(
      {required String text,
      required String iconAsset,
      required Color buttonColor}) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: buttonColor,
              width: 1,
            ),
            color: buttonColor.withOpacity(0.1),
          ),
          child: Row(
            children: [
              Image.asset(
                iconAsset,
                height: 28,
                width: 28,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors().darkTextColor,
                ),
              ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {},
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 56,
            ),
          ),
        ),
      ],
    );
  }
}
