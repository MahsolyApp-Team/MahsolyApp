import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save_plant/core/functions/camera_functions.dart';
import 'package:save_plant/feature/auth/presentation/views/widgets/header_section.dart';
import 'package:save_plant/feature/camera/presentation/views/widgets/build_buttom.dart';

class BuildCameraPreview extends StatefulWidget {
  const BuildCameraPreview({
    super.key,
    required CameraController cameraController,
  }) : _cameraController = cameraController;

  final CameraController _cameraController;

  @override
  State<BuildCameraPreview> createState() => _BuildCameraPreviewState();
}

class _BuildCameraPreviewState extends State<BuildCameraPreview> {
  bool _isFlashOn = false;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final buttonSize = screenWidth * 0.18;
    final innerCircleRadius = buttonSize * 0.37;
    final bottomPadding = screenHeight * 0.04;
    final horizontalPadding = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(title: HeaderSection(title: 'Scan Your Plant')),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: CameraPreview(widget._cameraController)),

            Positioned(
              bottom: bottomPadding,
              left: horizontalPadding,
              right: horizontalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildButtom(
                    icon: _isFlashOn
                        ? CupertinoIcons.bolt_fill
                        : CupertinoIcons.bolt_slash,
                    onTap: () {
                      setState(() {
                        _isFlashOn = !_isFlashOn;
                      });
                      toggleFlash(_isFlashOn, widget._cameraController);
                    },
                  ),

                  GestureDetector(
                    onTap: () => takePicture(context, widget._cameraController),
                    child: Container(
                      width: buttonSize,
                      height: buttonSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: screenWidth * 0.01,
                        ),
                      ),
                      child: Center(
                        child: CircleAvatar(
                          radius: innerCircleRadius,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  BuildButtom(
                    icon: CupertinoIcons.photo,
                    onTap: () => pickFromGallery(_picker, context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
