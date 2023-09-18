import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({super.key});

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Всего: 35 файлов",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors().darkTextColor,
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  width: 40,
                  height: 40,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 10),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 5,
                                        width: 36,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors().inactiveColor),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Новая папка",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: AppColors().darkTextColor,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    "Название папки",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AppColors().grayTextColor,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors().textFieldColor,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: AppColors().inactiveColor,
                                          width: 1,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: AppColors().inactiveColor,
                                          width: 1,
                                        ),
                                      ),
                                      labelText: '',
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors().actionColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 0,
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width *
                                              0.9,
                                          65),
                                      maximumSize: Size(
                                          MediaQuery.of(context).size.width *
                                              0.9,
                                          65),
                                    ),
                                    child: Text(
                                      "Создать",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppColors().backgroundColor,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: Image.asset('assets/png/new_folder.png'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  width: 40,
                  height: 40,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Image.asset('assets/png/filter.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            children: [
              for (int i = 0; i < 2; i++)
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
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
                              'assets/png/folder_with_files.png',
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
                                    "Название папки",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColors().darkTextColor,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "1 объект",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: AppColors().grayTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Image.asset('assets/png/more.png'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Scan 273648 two strokes",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors().darkTextColor,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "12/26/2023",
                                  style: GoogleFonts.inter(
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
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ],
    );
  }
}
