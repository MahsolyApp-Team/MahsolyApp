import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';

Future<void> pickFromGallery(dynamic _picker, BuildContext context) async {
  try {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      print("Selected: ${image.path}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Photo selected successfully! 🖼️'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    }
  } catch (e) {
    print("Error picking image: $e");
  }
}

Future<void> takePicture(BuildContext context, dynamic cameraController) async {
  try {
    if (!cameraController.value.isInitialized) return;

    final image = await cameraController.takePicture();

    await Gal.putImage(image.path);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Photo captured successfully! 📸'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  } catch (e) {
    print("Error taking picture: $e");
  }
}

Future<void> toggleFlash(bool _isFlashOn, dynamic cameraController) async {
  try {
    await cameraController.setFlashMode(
      _isFlashOn ? FlashMode.torch : FlashMode.off,
    );
  } catch (e) {
    print("Flash error: $e");
  }
}
