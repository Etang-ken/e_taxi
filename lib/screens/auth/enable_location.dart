import 'package:e_taxi/helper/helper/location_service.dart';
import 'package:e_taxi/helper/widgets.dart';
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
  String _locationMessage = "Getting location...";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void _getLocation() async {
    setState(() {
      isLoading = true;
    });
    try {
      var position = await LocationService().getCurrentLocation();
      var address = await LocationService().getAddressFromCoordinates(position);
      setState(() {
        _locationMessage =
            "Latitude: ${position}, Longitude: ${position.longitude}";
      });
      print(_locationMessage);
      print("Current Location: $address");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ), // Navigate to your dashboard screen
      );
      showAppSnackBar(
          context: context,
          message: "Your location: $address",
          type: SnackBarType.success);
    } catch (e) {
      setState(() {
        _locationMessage = "Failed to get location: ${e.toString()}";
      });
      showAppSnackBar(
          context: context,
          message:
              "Error getting location, please make sure your device's location is on.",
          type: SnackBarType.failure);
      print(_locationMessage);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/location_bg.png"),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 15,
                ),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.55,
                  maxWidth: 400,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/location-icon.png",
                        width: 120,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Enable your location",
                        style: AppStyles.header,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      PrimaryButton(
                          buttonText: "Use my Location",
                          onClick: () {
                            _getLocation();
                          }),
                      const SizedBox(
                        height: 30,
                      ),
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
        ),
        if(isLoading) showIsLoading()
      ],
    );
  }
}
