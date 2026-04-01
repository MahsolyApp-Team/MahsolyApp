import 'package:flutter/material.dart';
import 'package:save_plant/core/theme/text_style.dart';

class BuildIconTextRow extends StatelessWidget {
  const BuildIconTextRow({
    super.key,
    required this.iconColor,
    required this.text,
  });
  final Color iconColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconColor == Colors.green ? Icons.check_circle : Icons.cancel,
          color: iconColor,
          size: 18,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(text, style: AppTextStyle.giloryRegular16(context)),
        ),
      ],
    );
  }
}
