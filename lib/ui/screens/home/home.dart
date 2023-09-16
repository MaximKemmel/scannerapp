import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanner_app/ui/screens/home/pages/files.dart';
import 'package:scanner_app/ui/screens/home/pages/main.dart';
import 'package:scanner_app/ui/screens/home/pages/premium.dart';
import 'package:scanner_app/ui/screens/home/pages/settings.dart';
import 'package:scanner_app/ui/theme/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myController = TextEditingController();
  late FocusNode myFocusNode;
  late bool isSearchFieldVisible;
  late int selectedTab = 0;
  static const List<Widget> pages = [
    MainPage(),
    FilesPage(),
    PremiumPage(),
    SettingsPage(),
  ];
  static const List<String> pageNames = [
    "Logo name",
    "Файлы",
    "Премиум",
    "Настройки"
  ];
  PageController pageController = PageController();

  @override
  void initState() {
    isSearchFieldVisible = false;
    selectedTab = 0;
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: selectedTab == 2
          ? null
          : AppBar(
              surfaceTintColor: Colors.transparent,
              backgroundColor: AppColors().backgroundColor,
              title: Text(
                pageNames[selectedTab],
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: AppColors().darkTextColor,
                ),
              ),
              actions: [
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(microseconds: 350),
                      width: isSearchFieldVisible ? screenWidth : 0,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            width: 40,
                            height: 40,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (mounted) {
                                  setState(() {
                                    isSearchFieldVisible = false;
                                  });
                                  myFocusNode.unfocus();
                                }
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: AppColors().inactiveColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              focusNode: myFocusNode,
                              controller: myController,
                              decoration: InputDecoration(
                                hintText: "Поиск",
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors().grayTextColor,
                                ),
                                contentPadding: const EdgeInsets.only(
                                  left: 15,
                                  right: 35,
                                ),
                                filled: true,
                                fillColor: AppColors().cardColor,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: isSearchFieldVisible
                                        ? AppColors().inactiveColor
                                        : Colors.transparent,
                                    width: isSearchFieldVisible ? 1 : 0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: isSearchFieldVisible
                                        ? AppColors().inactiveColor
                                        : Colors.transparent,
                                    width: isSearchFieldVisible ? 1 : 0,
                                  ),
                                ),
                                labelText: '',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(right: isSearchFieldVisible ? 15 : 0),
                      child: IconButton(
                        onPressed: () {
                          if (mounted) {
                            if (!isSearchFieldVisible) {
                              setState(() {
                                isSearchFieldVisible = !isSearchFieldVisible;
                              });
                              myFocusNode.requestFocus();
                            } else {
                              setState(() {
                                myController.clear();
                              });
                            }
                          }
                        },
                        icon: isSearchFieldVisible
                            ? Image.asset('assets/png/close.png')
                            : Image.asset('assets/png/search.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
      body: Padding(
        padding:
            selectedTab == 2 ? EdgeInsets.zero : const EdgeInsets.all(15.0),
        child: pages[selectedTab],
      ),
      floatingActionButton: selectedTab < 2
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: "photo_btn",
                  shape: const CircleBorder(),
                  backgroundColor: AppColors().actionColor,
                  onPressed: () {},
                  child: Image.asset('assets/png/photo.png'),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  heroTag: "image_btn",
                  shape: const CircleBorder(),
                  backgroundColor: AppColors().actionColor,
                  onPressed: () {},
                  child: Image.asset('assets/png/image.png'),
                ),
              ],
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors().backgroundColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedTab,
        selectedItemColor: AppColors().darkTextColor,
        selectedLabelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: AppColors().actionColor,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: AppColors().grayTextColor,
        ),
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Image.asset('assets/png/home_active.png'),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Image.asset('assets/png/home.png'),
            ),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Image.asset('assets/png/files_active.png'),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Image.asset('assets/png/files.png'),
            ),
            label: "Файлы",
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Image.asset('assets/png/premium.png'),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Image.asset('assets/png/premium.png'),
            ),
            label: "Премиум",
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Image.asset('assets/png/settings_active.png'),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Image.asset('assets/png/settings.png'),
            ),
            label: "Настройки",
          ),
        ],
        onTap: (index) {
          if (selectedTab == index) return;
          setState(() {
            selectedTab = index;
          });
        },
      ),
    );
  }
}
