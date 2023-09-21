import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanner_app/ui/theme/color.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraScreen({super.key, required this.cameras});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> with WidgetsBindingObserver, TickerProviderStateMixin {
  late CameraController controller;
  late List<String> camTypes;
  late int selectedType;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    setCameraSettings();
    camTypes = [
      "Документы",
      "QR-код",
      "Подпсись",
      "Печать"
    ];
    selectedType = 0;
    super.initState();
  }

  Future<void> setCameraSettings() async {
    controller = CameraController(widget.cameras![0], ResolutionPreset.max);
    await controller.initialize().then((_){
      if (!mounted) {
        return;
      }
      setState(() {

      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case "CameraAccessDenied":
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().cameraColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors().cameraColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors().backgroundColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            child: CameraPreview(controller),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: camTypes.length,
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      setState(() {
                        selectedType = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                        child: Text(
                          camTypes[index],
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: selectedType == index ? AppColors().actionColor : AppColors().backgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){},
                  borderRadius: BorderRadius.circular(55),
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: AppColors().cameraButtonColor,
                      border: Border.all(
                        color: AppColors().actionColor,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors().actionColor.withOpacity(0.6),
                          spreadRadius: 0,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
