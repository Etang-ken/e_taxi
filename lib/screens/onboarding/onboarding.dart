import 'package:e_taxi/screens/auth/enable_location.dart';
import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentDisplay = 0;
  List<Map<String, String>> onboardingDisplays = [
    {
      "image": "assets/images/onboarding_1.png",
      "title": "Anywhere you are",
      "caption": "Get a taxi at the comfort of your home",
      "button": "assets/images/onboard_btn_1.png"
    },
    {
      "image": "assets/images/onboarding_2.png",
      "title": "At anytime",
      "caption": "Active 24/7",
      "button": "assets/images/onboard_btn_2.png"
    },
    {
      "image": "assets/images/onboarding_3.png",
      "title": "Book your car",
      "caption": "Book rides effortlessly with CamTaxi",
      "button": "assets/images/onboard_btn_3.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 20,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const EnableLocationScreen(),
                        ), // Navigate to your dashboard screen
                      );
                    },
                    child: Text(
                      "Skip",
                      style: AppStyles.bodyText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset(onboardingDisplays[currentDisplay]['image'] ?? ''),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  onboardingDisplays[currentDisplay]['title'] ?? '',
                  style: AppStyles.header,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  onboardingDisplays[currentDisplay]['caption'] ?? '',
                  style: AppStyles.bodyText.copyWith(
                      color: AppColors.mediumGrey,
                      // fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                GestureDetector(
                  onTap: () {
                    if (currentDisplay < 2) {
                    setState(() {

                        currentDisplay += 1;

                    });
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const EnableLocationScreen(),
                        ), // Navigate to your dashboard screen
                      );
                    }
                  },
                  child: Image.asset(
                    onboardingDisplays[currentDisplay]['button'] ?? '',
                    width: 85,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
