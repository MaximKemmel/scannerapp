import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanner_app/ui/screens/camera/camera.dart';
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
  late int selectedTab;
  late bool isPopupShow;
  int level = 0;
  String folder = "";
  late List<Widget> pages = [];
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
    isPopupShow = false;
    level = 0;
    folder = "";
    pages = [
      const MainPage(),
      FilesPage(onChangeLevel: onChangeFilePath),
      const PremiumPage(),
      const SettingsPage(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  void onChangeFilePath(int level, String folder) {
    setState(() {
      this.level = level;
      this.folder = folder;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          appBar: selectedTab == 2
              ? null
              : AppBar(
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: AppColors().backgroundColor,
                  shape: selectedTab != 0 ? Border(
                    bottom: BorderSide(
                      color: AppColors().inactiveColor,
                      width: 1
                    ),
                  ) : null,
                  centerTitle: level == 1,
                  leading: level == 1 ? IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors().inactiveColor,
                    ),
                    onPressed: () {
                      onChangeFilePath(0, "");
                    },
                  ) : null,
                  title: Text(
                    level == 0 ? pageNames[selectedTab] : folder,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: level == 0 ? 24 : 16,
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
                                        width: 0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: isSearchFieldVisible
                                            ? AppColors().inactiveColor
                                            : Colors.transparent,
                                        width: 0,
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
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: selectedTab < 2 && !isPopupShow
              ? FloatingActionButton(
                  heroTag: "photo_btn",
                  shape: const CircleBorder(),
                  backgroundColor: AppColors().actionColor,
                  onPressed: () {
                    setState(() {
                      isPopupShow = true;
                    });
                  },
                  child: Image.asset('assets/png/photo.png'),
                )
              : null,
          bottomNavigationBar: BottomAppBar(
            height: 60,
            padding: EdgeInsets.zero,
            surfaceTintColor: Colors.transparent,
            notchMargin: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().backgroundColor,
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: AppColors().inactiveColor,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedTab = 0;
                          isSearchFieldVisible = false;
                          level = 0;
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.24,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Image.asset(selectedTab == 0 ? 'assets/png/home_active.png' : 'assets/png/home.png'),
                            ),
                            Text(
                              "Главная",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: selectedTab == 0 ? AppColors().darkTextColor : AppColors().grayTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedTab = 1;
                          isSearchFieldVisible = false;
                          level = 0;
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.24,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Image.asset(selectedTab == 1 ? 'assets/png/files_active.png' : 'assets/png/files.png'),
                            ),
                            Text(
                              "Файлы",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: selectedTab == 1 ? AppColors().darkTextColor : AppColors().grayTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedTab = 2;
                          isSearchFieldVisible = false;
                          level = 0;
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.24,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Image.asset(selectedTab == 2 ? 'assets/png/premium.png' : 'assets/png/premium.png'),
                            ),
                            Text(
                              "Премиум",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: selectedTab == 2 ? AppColors().darkTextColor : AppColors().grayTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedTab = 3;
                          isSearchFieldVisible = false;
                          level = 0;
                        });
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.24,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Image.asset(selectedTab == 3 ? 'assets/png/settings_active.png' : 'assets/png/settings.png'),
                            ),
                            Text(
                              "Настройки",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: selectedTab == 3 ? AppColors().darkTextColor : AppColors().grayTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: isPopupShow ? screenHeight : 0,
          width: screenWidth,
          color: AppColors().backgroundColor.withOpacity(0.65),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                isPopupShow = false;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors().popupActionColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    elevation: 0,
                    minimumSize:
                    Size(MediaQuery.of(context).size.width * 0.9, 65),
                    maximumSize:
                    Size(MediaQuery.of(context).size.width * 0.9, 65),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/png/photo.png"),
                      const SizedBox(width: 10),
                      Text(
                        "Камера",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors().backgroundColor,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    setState(() {
                      isPopupShow = false;
                    });
                    await availableCameras().then((value) => Navigator.push(context, MaterialPageRoute(builder: (_) => CameraScreen(cameras: value))));
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors().popupActionColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    elevation: 0,
                    minimumSize:
                    Size(MediaQuery.of(context).size.width * 0.9, 65),
                    maximumSize:
                    Size(MediaQuery.of(context).size.width * 0.9, 65),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/png/image.png"),
                      const SizedBox(width: 10),
                      Text(
                        "Галерея",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors().backgroundColor,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      isPopupShow = false;
                    });
                  },
                ),
                const SizedBox(height: 25),
                FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: AppColors().actionColor,
                  onPressed: () {
                    setState(() {
                      isPopupShow = false;
                    });
                  },
                  child: Image.asset('assets/png/photo.png'),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
