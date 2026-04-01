import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:save_plant/core/constants/app_colors.dart';
import 'package:save_plant/core/theme/text_style.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.title, this.image});
  final String title;
  final AssetImage? image;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image != null
            ? Image(image: image!, fit: BoxFit.fill)
            : SizedBox(width: 5.w),
        SizedBox(width: 30.w),
        Text(
          title,
          style: AppTextStyle.giloryBold24(
            context,
          ).copyWith(color: AppColor.primaryColor),
        ),
      ],
    );
  }
}
