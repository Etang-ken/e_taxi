import 'package:e_taxi/screens/auth/welcome.dart';
import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:e_taxi/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class EnableLocationScreen extends StatefulWidget {
  const EnableLocationScreen({super.key});

  @override
  State<EnableLocationScreen> createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends State<EnableLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20,),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/location_bg.png")
          ),

        ),
        child: Center(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 15,),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height*0.55,
              maxWidth: 400,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),

            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/images/location-icon.png", width: 120,),
                  const SizedBox(height: 25,),
                  Text("Enable your location", style: AppStyles.header,),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Choose your location to start find the request around you",
                      textAlign: TextAlign.center,
                      style: AppStyles.bodyText.copyWith(
                          color: AppColors.mediumGrey,
                          // fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                  PrimaryButton(buttonText: "Use my Location", onClick: () {}),
                  const SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ), // Navigate to your dashboard screen
                      );
                    },
                    child: Text(
                      "Skip for now",
                      style: AppStyles.bodyText.copyWith(
                          color: AppColors.mediumGrey.withOpacity(0.7),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
