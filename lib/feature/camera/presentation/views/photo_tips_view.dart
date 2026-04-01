import 'package:flutter/material.dart';
import 'package:save_plant/core/constants/app_colors.dart';
import 'package:save_plant/core/theme/text_style.dart';
import 'package:save_plant/feature/camera/presentation/views/widgets/photo_tips_view_body.dart';

class PhotoTipsView extends StatelessWidget {
  const PhotoTipsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photo Guide',
          style: AppTextStyle.giloryBold24(
            context,
          ).copyWith(color: AppColor.primaryColor),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: PhotoTipsViewBody(),
    );
  }
}
