import 'package:flutter/material.dart';
import 'package:save_plant/core/constants/app_colors.dart';
import 'package:save_plant/core/theme/text_style.dart';
import 'package:save_plant/core/widgets/custom_textfield.dart';

class SearchAppBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const SearchAppBar({
    super.key,
    required this.onChanged,
    required this.onClear,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mahsoly",
          style: AppTextStyle.giloryBold24(
            context,
          ).copyWith(color: AppColor.primaryColor),
        ),
        SizedBox(height: 20),
        CustomTextfield(
          controller: _controller,
          prefixIcon: Icon(Icons.search),
          onChanged: widget.onChanged,
          hintText: 'Search plants...',
          enabled: true,
          suffixIcon: IconButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              _controller.clear();
              widget.onClear();
            },
            icon: Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}
