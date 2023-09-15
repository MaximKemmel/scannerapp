import 'package:flutter/material.dart';
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

class _HomeScreenState extends State<HomeScreen>{
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectedTab == 2 ? null : AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors().backgroundColor,
        title: Text(
          pageNames[selectedTab],
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
        padding: selectedTab == 2 ? EdgeInsets.zero : const EdgeInsets.all(15.0),
        child: pages[selectedTab],
      ),
      floatingActionButton: selectedTab < 2 ? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: AppColors().actionColor,
            onPressed:(){},
            child: Image.asset('assets/png/photo.png'),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: AppColors().actionColor,
            onPressed:(){},
            child: Image.asset('assets/png/image.png'),
          ),
        ],
      ) : null,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors().backgroundColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedTab,
        selectedItemColor: AppColors().darkTextColor,
        selectedLabelStyle: TextStyle(
          fontFamily: "GothamPro",
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: AppColors().actionColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: "GothamPro",
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
            label: "Главная"
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
              label: "Файлы"
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
              label: "Премиум"
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
              label: "Настройки"
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
