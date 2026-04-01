// ignore_for_file: unused_element

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:save_plant/feature/camera/presentation/views/widgets/build_camera_preview.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  List<CameraDescription> _cameras = [];
  CameraController? _cameraController;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _setupCameraController();
    }
  }

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          (_cameraController == null || !_cameraController!.value.isInitialized)
          ? const Center(child: CircularProgressIndicator())
          : BuildCameraPreview(cameraController: _cameraController!),
    );
  }

  Future<void> _setupCameraController() async {
    List<CameraDescription> cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      setState(() {
        _cameras = cameras;
        _cameraController = CameraController(
          _cameras.first,
          ResolutionPreset.high,
        );
      });
      await _cameraController!
          .initialize()
          .then((_) {
            if (!mounted) return;
            setState(() {});
          })
          .catchError((e) {
            print("Error initializing camera: $e");
          });
    }
  }
}
