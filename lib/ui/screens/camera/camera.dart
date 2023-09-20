import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/ui/theme/color.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraScreen({super.key, required this.cameras});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> with WidgetsBindingObserver, TickerProviderStateMixin {
  late CameraController controller;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    setCameraSettings();
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
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: CameraPreview(controller),
          ),
        ],
      ),
    );
  }
}
