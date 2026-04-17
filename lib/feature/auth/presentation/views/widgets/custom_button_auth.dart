import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_plant/core/theme/text_style.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.width,
    this.child,
  });

  final VoidCallback? onPressed;
  final String? buttonText;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          alignment: Alignment.center,
          width: width ?? double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child:
              child ??
              Text(buttonText!, style: AppTextStyle.giloryRegular18(context)),
        ),
      ),
    );
  }
}
