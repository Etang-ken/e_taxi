import 'package:e_taxi/theme/app_colors.dart';
import 'package:e_taxi/theme/app_styles.dart';
import 'package:e_taxi/widgets/secondary_button.dart';
import 'package:flutter/material.dart';

class AvailableRidesScreen extends StatefulWidget {
  const AvailableRidesScreen({super.key});

  @override
  State<AvailableRidesScreen> createState() => _AvailableRidesScreenState();
}

class _AvailableRidesScreenState extends State<AvailableRidesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    const Icon(Icons.chevron_left),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Back",
                      style: AppStyles.bodyText.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Available cars for ride",
                style: AppStyles.smallHeader.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "18 cars found",
                style: AppStyles.smallBodyText.copyWith(
                  color: AppColors.mediumGrey,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  _availableCarCard(),
                  _availableCarCard(),
                  _availableCarCard(),
                  _availableCarCard(),
                  _availableCarCard(),
                  _availableCarCard()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _availableCarCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor100,
        border: Border.all(color: AppColors.primaryBoldColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BMW Cabrio",
                      style: AppStyles.bodyText,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Wrap(
                      spacing: 10,
                      children: [
                        Text(
                          "Automatic",
                          style: AppStyles.smallBodyText.copyWith(
                            color: AppColors.mediumGrey,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: AppColors.mediumGrey,
                              ),
                              right: BorderSide(
                                color: AppColors.mediumGrey,
                              ),
                            ),
                          ),
                          child: Text(
                            "3 seats",
                            style: AppStyles.smallBodyText.copyWith(
                              color: AppColors.mediumGrey,
                            ),
                          ),
                        ),
                        Text(
                          "Octane",
                          style: AppStyles.smallBodyText.copyWith(
                            color: AppColors.mediumGrey,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Icon(Icons.pin_drop, size: 20),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "800m (5min away)",
                          style: AppStyles.smallBodyText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset(
                "assets/images/car_1.png",
                width: 110,
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          SecondaryButton(
            buttonText: "View car list",
            verticalPadding: 14,
            onClick: () {},
          ),
        ],
      ),
    );
  }
}
