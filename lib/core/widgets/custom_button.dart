// ignore_for_file: unnecessary_non_null_assertion

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:save_plant/core/constants/app_colors.dart';
import 'package:save_plant/core/theme/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.width,
    this.child,
  });

  final VoidCallback? onPressed;
  final String buttonText;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          gradient: LinearGradient(
            colors: [AppColor.primaryColor, AppColor.secondaryColor],
          ),
        ),
        child: Center(
          child:
              child ??
              Text(buttonText!, style: AppTextStyle.giloryRegular18(context)),
        ),
      ),
    );
  }
}
