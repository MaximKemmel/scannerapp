import 'package:flutter/material.dart';
import 'package:scanner_app/ui/theme/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late bool isSearchFieldVisible;
  late int selectedIndex;
  PageController pageController = PageController();

  @override
  void initState() {
    isSearchFieldVisible = false;
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors().backgroundColor,
        title: Text(
          "Logo name",
          style: TextStyle(
            fontFamily: "GothamPro",
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: AppColors().darkTextColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (mounted) {
                setState(() {
                  isSearchFieldVisible = !isSearchFieldVisible;
                });
              }
            },
            icon: isSearchFieldVisible
                ? Image.asset('assets/png/close.png')
                : Image.asset('assets/png/search.png'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex == 0
                        ? AppColors().actionColor
                        : AppColors().actionLightColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Сканирование",
                    style: TextStyle(
                      fontFamily: "GothamPro",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: selectedIndex == 0
                          ? AppColors().backgroundColor
                          : AppColors().actionColor,
                    ),
                  ),
                  onPressed: () {
                    pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeIn,
                    );
                  },
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex == 1
                        ? AppColors().actionColor
                        : AppColors().actionLightColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Редактирование",
                    style: TextStyle(
                      fontFamily: "GothamPro",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: selectedIndex == 1
                          ? AppColors().backgroundColor
                          : AppColors().actionColor,
                    ),
                  ),
                  onPressed: () {
                    pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 260,
              child: PageView.builder(
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return selectedIndex == 0 ? scanBlock() : editBlock();
                },
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "Последние файлы",
              style: TextStyle(
                fontFamily: "GothamPro",
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors().darkTextColor,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Scan 273648 two strokes",
                                style: TextStyle(
                                  fontFamily: "GothamPro",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColors().darkTextColor,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "12/26/2023",
                                style: TextStyle(
                                  fontFamily: "GothamPro",
                                  fontWeight: FontWeight.w500,
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
                  );
                }),
              ),
            ),
          ],
        ),
      ),
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
                style: TextStyle(
                  fontFamily: "GothamPro",
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
                style: TextStyle(
                  fontFamily: "GothamPro",
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
