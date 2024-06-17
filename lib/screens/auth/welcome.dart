import 'package:e_taxi/screens/auth/sign_in.dart';
import 'package:e_taxi/screens/auth/sign_up.dart';
import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:e_taxi/widgets/primary_button.dart';
import 'package:e_taxi/widgets/secondary_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Column(
              children: [
                Image.asset("assets/images/welcome.png"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome",
                  style: AppStyles.header,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Have a better sharing experience",
                  style: AppStyles.bodyText.copyWith(
                      color: AppColors.mediumGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                PrimaryButton(buttonText: "Create an account", onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ), // Navigate to your dashboard screen
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                SecondaryButton(buttonText: "Log In", onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ), // Navigate to your dashboard screen
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
