import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_plant/core/constants/app_assets.dart';
import 'package:save_plant/feature/auth/presentation/cubit/user_cubit.dart';
import 'package:save_plant/feature/auth/presentation/views/widgets/header_section.dart';
import 'package:save_plant/feature/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: HeaderSection(image: AppAssets.logo, title: "Mahsoly"),
        ),
        body: SignupViewBody(),
      ),
    );
  }
}
