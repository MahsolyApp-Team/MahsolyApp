import 'package:flutter/material.dart';
import 'package:save_plant/core/cache/cache_helper.dart';
import 'package:save_plant/core/networking/api_constant.dart';
import 'package:save_plant/feature/home/presentation/views/home_view.dart';
import 'package:save_plant/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:save_plant/feature/auth/presentation/views/login_view.dart';
import 'package:save_plant/root.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    final token = CacheHelper().getData(key: ApiKey.access_token);
    final seen = CacheHelper().getData(key: "onboardingSeen") == true;

    if (token != null && token.toString().isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Root()),
      );
      return;
    }

    if (!seen) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingView()),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
