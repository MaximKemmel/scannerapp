import 'package:flutter/material.dart';

import '../../theme/color.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  late List<bool> tilesStatus;

  @override
  void initState() {
    tilesStatus = List.generate(25, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors().backgroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors().inactiveColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Поддержка",
          style: TextStyle(
            fontFamily: "GothamPro",
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors().darkTextColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Divider(
            height: 10,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: AppColors().inactiveColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: tilesStatus.length,
                itemBuilder: (context, index) {
                  return Card(
                    borderOnForeground: true,
                    surfaceTintColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    color: AppColors().backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        width: 1,
                        color: AppColors().inactiveColor,
                      ),
                    ),
                    elevation: 0,
                    child: ExpansionTile(
                      initiallyExpanded: tilesStatus[index],
                      onExpansionChanged: (status) {
                        setState(() {
                          tilesStatus[index] = status;
                        });
                      },
                      backgroundColor: AppColors().backgroundColor,
                      tilePadding: const EdgeInsets.symmetric(horizontal: 15),
                      collapsedShape: const Border(),
                      trailing: Icon(
                        tilesStatus[index] ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined,
                        color: AppColors().actionColor,
                      ),
                      title: Text(
                        "Короткий вопрос в одну строку",
                        style: TextStyle(
                          fontFamily: "GothamPro",
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors().darkTextColor,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text(
                            "Какой-то текст с ответом на вопрос, на сколько-то строк для наглядности как это будет выглядеть",
                            style: TextStyle(
                              fontFamily: "GothamPro",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors().grayTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
