import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_plant/core/constants/app_colors.dart';
import 'package:save_plant/core/functions/app_decoration.dart';
import 'package:save_plant/core/theme/text_style.dart';
import 'package:save_plant/core/widgets/custom_button.dart';

class CropResultView extends StatelessWidget {
  final String crop;

  const CropResultView({super.key, required this.crop});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              decoration: AppDecoration.card(context).copyWith(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20.r,
                    offset: Offset(0, 10.h),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.eco, size: 80.sp, color: const Color(0xff2E7D32)),
                  SizedBox(height: 20.h),
                  Text(
                    "Recommended Crop",
                    style: AppTextStyle.giloryBold18(
                      context,
                    ).copyWith(color: AppColor.primaryColor),
                  ),
                  SizedBox(height: 50.h),
                  Text(
                    crop.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.giloryBold30(
                      context,
                    ).copyWith(color: AppColor.primaryColor),
                  ),
                  SizedBox(height: 50.h),
                  CustomButton(
                    buttonText: 'Confirm',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    "Based on your soil analysis",
                    style: AppTextStyle.giloryRegular16(
                      context,
                    ).copyWith(color: AppColor.primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
