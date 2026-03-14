import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_plant/core/constants/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.controller,
    this.labeltext,
    this.focusNode,
    this.enabled = true,
    this.hintText,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
  });
  final TextEditingController? controller;
  final String? labeltext;
  final String? hintText;
  final bool enabled;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(10),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        focusNode: focusNode,
        enabled: enabled,
        style: const TextStyle(color: AppColor.darkBackground),
        decoration: InputDecoration(
          labelText: labeltext,
          hintText: hintText,
          filled: true,
          fillColor: enabled
              ? Theme.of(context).colorScheme.background
              : Colors.grey.shade200, // لون مختلف لما يكون مقفول
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green, width: 2),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
