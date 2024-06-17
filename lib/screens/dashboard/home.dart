import 'package:e_taxi/screens/dashboard/transport/select_transport.dart';
import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          "assets/images/home_bg.png",
        ),
        fit: BoxFit.cover,
      )),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/images/icon-location-target.png",
                  width: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Where are you going today?",
                style: AppStyles.smallHeader.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(
                  // vertical: 10,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/icon-pickup-point.png",
                      width: 30,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "Choose pick up point",
                          hintStyle: AppStyles.bodyText.copyWith(
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(
                  // vertical: 10,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/icon_pin.png",
                      width: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "Choose your destination",
                          hintStyle: AppStyles.bodyText.copyWith(
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SelectTransportScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/icon-location-badge.png",
                            width: 12,
                            color: AppColors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Home",
                            style: AppStyles.bodyText.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColors.grey,
                        )),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/icon-location-badge.png",
                          width: 12,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Office",
                          style: AppStyles.bodyText.copyWith(
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.grey,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chevron_right,
                      color: AppColors.mediumGrey,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
