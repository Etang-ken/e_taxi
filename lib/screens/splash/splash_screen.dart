import 'dart:async';

import 'package:e_taxi/screens/nav/dashboard_nav.dart';
import 'package:e_taxi/screens/onboarding/onboarding.dart';
import 'package:e_taxi/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = FlutterSecureStorage();

  Future<String?> getToken() async {
    final token = await storage.read(key: "authToken");
    if (token != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const DashboardNav(),
        ), // Navigate to your dashboard screen
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ), // Navigate to your login screen
      );
    }

    return token;
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      getToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: AppColors.primaryColor),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/images/splash_logo.png",
              height: 210,
              // height: 170,
            ),
          ),
        ),
      ),
    );
  }
}
