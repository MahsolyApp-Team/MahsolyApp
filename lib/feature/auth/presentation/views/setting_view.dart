import 'package:flutter/material.dart';
import 'package:save_plant/feature/auth/presentation/views/widgets/header_section.dart';
import 'package:save_plant/feature/auth/presentation/views/widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: HeaderSection(title: "Settings"), elevation: 0),
      body: SettingViewBody(),
    );
  }
}
