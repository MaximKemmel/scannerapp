import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:scanner_app/ui/screens/premium/premium.dart';
import 'package:scanner_app/ui/screens/support/support.dart';
import 'package:scanner_app/ui/theme/color.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool isActive;

  @override
  void initState() {
    isActive = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: Image.asset('assets/png/avatar.png').image,
                backgroundColor: AppColors().backgroundColor,
              ),
              const SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Наталья Пушкина",
                    style: TextStyle(
                      fontFamily: "GothamPro",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColors().darkTextColor,
                    ),
                  ),
                  Text(
                    "test@gmail.com",
                    style: TextStyle(
                      fontFamily: "GothamPro",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppColors().grayTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 10,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: AppColors().inactiveColor,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    Image.asset('assets/png/info.png'),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "Разрешить \npush-уведомления",
                        style: TextStyle(
                          fontFamily: "GothamPro",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors().darkTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FlutterSwitch(
                width: 40,
                height: 20,
                valueFontSize: 25.0,
                toggleSize: 18,
                value: isActive,
                borderRadius: 30.0,
                padding: 2,
                activeColor: AppColors().actionColor,
                activeToggleColor: AppColors().backgroundColor,
                inactiveColor: AppColors().inactiveColor,
                inactiveToggleColor: AppColors().backgroundColor,
                onToggle: (val) {
                  setState(() {
                    isActive = val;
                  });
                },
              ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SupportScreen()));
            },
            child: SizedBox(
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Image.asset('assets/png/info.png'),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "Поддержка",
                            style: TextStyle(
                              fontFamily: "GothamPro",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors().darkTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors().inactiveColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PremiumScreen()));
            },
            child: SizedBox(
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Image.asset('assets/png/info.png'),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "Премиум подписка",
                            style: TextStyle(
                              fontFamily: "GothamPro",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors().darkTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors().inactiveColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 45,
          child: Row(
            children: [
              const SizedBox(width: 5),
              Image.asset('assets/png/info.png'),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  "Оценить приложение",
                  style: TextStyle(
                    fontFamily: "GothamPro",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors().darkTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () async {
              await FlutterShare.share(
                title: 'Title',
                text: 'Text',
                linkUrl: 'https://flutter.dev/',
                chooserTitle: 'Chooser title',
              );
            },
            child: SizedBox(
              height: 45,
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Image.asset('assets/png/info.png'),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "Поделиться приложением",
                      style: TextStyle(
                        fontFamily: "GothamPro",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors().darkTextColor,
                      ),
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
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 5,
                            width: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors().inactiveColor
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          "Вы уверены, что хотите выйти",
                          style: TextStyle(
                            fontFamily: "GothamPro",
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: AppColors().darkTextColor,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                "Отмена",
                                style: TextStyle(
                                  fontFamily: "GothamPro",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColors().actionColor,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
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
                                "Выйти",
                                style: TextStyle(
                                  fontFamily: "GothamPro",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColors().backgroundColor,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: SizedBox(
              height: 45,
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  Image.asset('assets/png/info_active.png'),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "Выйти",
                      style: TextStyle(
                        fontFamily: "GothamPro",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors().actionColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
